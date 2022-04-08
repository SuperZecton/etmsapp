import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ltcapp/core/services/CurrentSession.dart';
import 'package:ltcapp/core/services/DatabaseConnector.dart';
import 'package:ltcapp/core/services/TelebotConnector.dart';
import 'package:ltcapp/core/utils/DateAndTimeGetter.dart';
import 'package:ltcapp/core/widgets/ErrorDialogs.dart';
import 'package:ltcapp/features/detailing/model/detail_type.dart';
import 'package:stacked/stacked.dart';

class DetailingAddDetailViewModel extends BaseViewModel {
  DatabaseHandler db = DatabaseHandler();
  TelebotConnector telebot = TelebotConnector();
  DateAndTime dt = DateAndTime();

  void initialise() async {
    vehicleCommanders = await getUsers();
    transportOperator = await getUsers();
    vehicleCommanders.insert(0, "No VC");
    notifyListeners();
  }

  ///<----------- Start Trip Variables --------------> ///
  TextEditingController _reportTo = TextEditingController();
  TextEditingController _timeDepart = TextEditingController();
  TextEditingController _timeRTU = TextEditingController();
  TextEditingController _startDetailDate = TextEditingController();
  TextEditingController _endDetailDate = TextEditingController();
  TextEditingController _trainingDetailName = TextEditingController();
  TextEditingController _civilianPlate = TextEditingController();
  TextEditingController get reportTo => _reportTo;
  TextEditingController get timeDepart => _timeDepart;
  TextEditingController get timeRTU => _timeRTU;
  TextEditingController get startDetailDate => _startDetailDate;
  TextEditingController get endDetailDate => _endDetailDate;
  TextEditingController get trainingDetailName => _trainingDetailName;
  TextEditingController get civilianPlate => _civilianPlate;

  CarType? _currentCarTypeValue;
  CarType? get currentCarValue => _currentCarTypeValue;

  DetailType? _currentDetailType;
  DetailType? get currentDetailType => _currentDetailType;

  String? _currentVehicleNo;
  String? get currentVehicleNo => _currentVehicleNo;

  String? _currentLTCorBPC;
  String? get currentLTCorBPC => _currentLTCorBPC;

  String? _currentVCom;
  String? get currentVCom => _currentVCom;

  String? _currentTransportOperator;
  String? get currentTransportOperator => _currentTransportOperator;

  void carTypeDropDownOnChanged(CarType value) async {
    _currentCarTypeValue = value;
    vehicleNumbers = await getVehicleNumbers(value);
    _currentVehicleNo = null;
    notifyListeners();
  }

  void detailTypeDropDownOnChanged(DetailType value) async {
    _currentDetailType = value;
    /// DO BPC or LTC Here (DONE)
    if (value.toString() == "MP FERRY SERVICE" || value.toString() == "NIGHT FERRY SERVICE" || value.toString() == "NFS (DTL COVER)"){
      _currentLTCorBPC = "BPC";
      reportTo.text = "IN CAMP DRIVING @ MINDEF";
    }
    else if (value.toString() == "BPC DUTY VEHICLE") {
      _currentLTCorBPC = "BPC";
      reportTo.text = "STANDBY TILL FURTHER INSTRUCTIONS";
    }
    else if (value.toString() == "LTC DUTY VEHICLE") {
      _currentLTCorBPC = "LTC";
      reportTo.text = "STANDBY TILL FURTHER INSTRUCTIONS";
    }
    else{
      _currentLTCorBPC = "LTC";
    }
    notifyListeners();
  }

  void LTCorBPCDropDownOnChanged(String value) {
    _currentLTCorBPC = value;
    notifyListeners();
  }

  void vehicleNoDropDownOnChanged(String value) {
    _currentVehicleNo = value;
    notifyListeners();
  }

  void vcDropDownOnChanged(String value) {
    _currentVCom = value;
    notifyListeners();
  }

  void transportOperatorDropDownOnChanged(String value) {
    _currentTransportOperator = value;
    notifyListeners();
  }

  void onAddDetailPush(BuildContext context) async {
    ///Ensure that current trip id is cleared before setting it again
    String? _username = CurrentUser.instance.username;
    DateTime detailStart = DateTime.parse(_startDetailDate.text.split("/")[2] + _startDetailDate.text.split("/")[1] + _startDetailDate.text.split("/")[0]);
    DateTime detailEnd = DateTime.parse(_endDetailDate.text.split("/")[2] + _endDetailDate.text.split("/")[1] + _endDetailDate.text.split("/")[0]);
    int daysOfDetail = dt.daysBetween(detailStart, detailEnd);
    //Input validation fields
    if (_username != null &&
      _reportTo != null &&
      _timeDepart != null &&
      _timeRTU != null &&
      _startDetailDate != null &&
      _endDetailDate != null &&
      _currentDetailType != null &&
      _currentLTCorBPC != null &&
      _currentTransportOperator != null &&
      _currentVehicleNo != null &&
      daysOfDetail >= 0) {

      print("Adding Detail..");

      /// Data Validation and Correction
      var typeOfDetail;
      var rank = _currentTransportOperator!.split(" ")[0];
      var fullName = _currentTransportOperator!.substring(rank.length+1);
      if(_currentVCom == "No VC"){
        _currentVCom = "";
      }
      if(_trainingDetailName.text != "" && _currentDetailType.toString() == "VIP DETAIL"){
        typeOfDetail = _trainingDetailName.text;
      }
      else{
        typeOfDetail = _currentDetailType.toString();
      }

      for (int x = 0; x < daysOfDetail+1; x++){
        var dateOfDetail = detailStart.add(Duration(days: x));
        await db.createDetail(dt.dateTimeToDate(dateOfDetail), typeOfDetail, _currentLTCorBPC!, rank, fullName, currentVehicleNo!, _civilianPlate.text, reportTo.text, _currentVCom!, timeDepart.text, timeRTU.text);
      }

      Navigator.pushNamed(context, '/detailingMain');
    } else {
      ErrorDialogs.normalAlertDialog(
          context, "Missing Fields", "Please fill out all the required fields");
    }
  }

  List<String?> vehicleNumbers = [""];

  Future<List<String?>> getVehicleNumbers(CarType value) async {
    String? _carType = value.toString();
    List<dynamic> _dynamicList = await db.vehiclesBasedOnCarType(_carType);
    List<String?> _vehicleList = _dynamicList.map((s) => s as String?).toList();
    return _vehicleList;
  }

  List<String?> LTCorBPC = ["LTC","BPC"];

  List<String?> transportOperator = [""];
  List<String?> vehicleCommanders = [""];
  Future<List<String?>> getUsers() async {
    List<dynamic> _dynamicList = await db.getAllUsers();
    List<String?> _vComList = _dynamicList.map((s) => s as String?).toList();
    return _vComList;
  }

  String selectedDate = "";
  String convertedDate = "";
  Future<void> selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != DateTime.now()) {
      selectedDate = DateFormat.yMd("en_US").format(picked);
      convertedDate = selectedDate.split("/")[1].padLeft(2, '0') + "/" + selectedDate.split("/")[0].padLeft(2, '0') + "/" + selectedDate.split("/")[2];
      controller.text = convertedDate;
      notifyListeners();
    }
  }


}
