import 'package:flutter/material.dart';
import 'package:ltcapp/core/services/CurrentSession.dart';
import 'package:ltcapp/core/services/DatabaseConnector.dart';
import 'package:ltcapp/core/services/TelebotConnector.dart';
import 'package:ltcapp/core/widgets/ErrorDialogs.dart';
import 'package:ltcapp/features/vehiclebookout/model/individual_vehicle.dart';
import 'package:stacked/stacked.dart';

class VehicleStartTripViewModel extends BaseViewModel {
  DatabaseHandler db = DatabaseHandler();
  TelebotConnector telebot = TelebotConnector();

  void initialise() async {
    vehicleCommanders = await getVCom();
    vehicleCommanders.insert(0, "No VC");
    notifyListeners();
  }

  ///<----------- Start Trip Variables --------------> ///
  TextEditingController _startingOdometer = TextEditingController();
  TextEditingController _locationStart = TextEditingController();
  TextEditingController _locationEnd = TextEditingController();
  TextEditingController get startingOdometer => _startingOdometer;
  TextEditingController get locationStart => _locationStart;
  TextEditingController get locationEnd => _locationEnd;

  final _startTripKey = GlobalKey<FormState>();
  GlobalKey get startTripKey => _startTripKey;

  CarType? _currentCarTypeValue;
  CarType? get currentCarValue => _currentCarTypeValue;

  String? _currentVehicleNo;
  String? get currentVehicleNo => _currentVehicleNo;

  String? _currentVCom;
  String? get currentVCom => _currentVCom;

  String? _currentPurpose;
  String? get currentPurpose => _currentPurpose;

  List<String?> _purposeOfTrip = [
    "Ferry Personnel",
    "FS",
    "FDC",
    "Maintenance/Top-up",
    "Training",
    "MUV Detail",
    "VIP Detail",
    "Boss Detail",
    "Send Vehicle"
  ];
  List<String?> get purposeOfTrip => _purposeOfTrip;
  void purposeOfTripOnChanged(String value) async {
    _currentPurpose = value;
    notifyListeners();
  }

  void carTypeDropDownOnChanged(CarType value) async {
    _currentCarTypeValue = value;
    vehicleNumbers = await getVehicleNumbers(value);
    _currentVehicleNo = null;
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

  /// Check box logic
  bool _bosDone = false;
  bool get bosDone => _bosDone;
  void bosOnChanged(bool value) {
    _bosDone = value;
    notifyListeners();
  }

  bool _ctJitDone = false;
  bool get ctJitDone => _ctJitDone;
  void ctJitOnChanged(bool value) {
    _ctJitDone = value;
    notifyListeners();
  }

  bool _mtRacDone = false;
  bool get mtRacDone => _mtRacDone;
  void mtRacOnChanged(bool value) {
    _mtRacDone = value;
    notifyListeners();
  }

  void onStartTripPush(BuildContext context) async {
    ///Ensure that current trip id is cleared before setting it again
    DateTime currentDateTime = DateTime.now();
    var now = DateTime.parse(currentDateTime.toString() + '-08:00');
    String _date = now.day.toString().padLeft(2, '0') +
        "/" +
        now.month.toString().padLeft(2, '0') +
        "/" +
        now.year.toString();
    String _time = now.hour.toString().padLeft(2, '0') +
        now.minute.toString().padLeft(2, '0');
    String? _username = CurrentUser.instance.username;
    //Input validation fields
    if (_startTripKey.currentState!.validate() &&
        _username != null &&
        _currentVehicleNo != null &&
        _currentPurpose != null) {
      if (_bosDone == true && _ctJitDone == true && _mtRacDone == true) {
        print("Starting trip..");
        CurrentUser.instance.currentTripID = null;
        String _classType = await db.singleDataPull(
            "Vehicles", "vehicleNo", _currentVehicleNo!, "classType");
        if(_currentVCom == "No VC"){
          _currentVCom = "";
        }

        String _currentTripID = await db.startTrip(
            _username,
            _date,
            _currentVehicleNo!,
            _time,
            _startingOdometer.text,
            _locationStart.text,
            _locationEnd.text,
            _currentPurpose!,
            _classType,
            _currentVCom!);
        CurrentUser.instance.currentTripID = _currentTripID;
        print("CurrentTripID stored as ${CurrentUser.instance.currentTripID}");

        ///Telegram movement
        String _rankTO =
            await db.singleDataPull("Users", "username", _username, "rank");
        String _fullNameTO =
            await db.singleDataPull("Users", "username", _username, "fullName");
        String? _fullNameVC = _currentVCom;
        String? _additionalPlate = await db.singleDataPull(
            "Vehicles", "vehicleNo", _currentVehicleNo!, "additionalPlate");
        if (_additionalPlate.isNotEmpty) {
          telebot.sendMovement(
              _currentVehicleNo!,
              _locationEnd.text,
              _currentPurpose!,
              _rankTO,
              _fullNameTO,
              _fullNameVC!,
              _additionalPlate);
        } else {
          telebot.sendMovement(_currentVehicleNo!, _locationEnd.text,
              _currentPurpose!, _rankTO, _fullNameTO, _fullNameVC!, "");
        }
        Navigator.pushNamed(context, '/home');
      } else {
        ErrorDialogs.normalAlertDialog(context, "Missing Fields",
            "Please ensure you check your vehicle before moving off");
      }
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

  List<String?> vehicleCommanders = [""];
  Future<List<String?>> getVCom() async {
    List<dynamic> _dynamicList = await db.getAvailableVehCom();
    List<String?> _vComList = _dynamicList.map((s) => s as String?).toList();
    return _vComList;
  }
}
