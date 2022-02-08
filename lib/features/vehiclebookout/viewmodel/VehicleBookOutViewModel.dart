import 'package:flutter/material.dart';
import 'package:ltcapp/core/services/CurrentSession.dart';
import 'package:ltcapp/core/services/DatabaseConnector.dart';
import 'package:ltcapp/core/services/TelebotConnector.dart';
import 'package:ltcapp/features/vehiclebookout/model/individual_vehicle.dart';
import 'package:stacked/stacked.dart';

class VehicleBookOutViewModel extends BaseViewModel {
  DatabaseHandler db = DatabaseHandler();
  TelebotConnector telebot = TelebotConnector();

  ///<----------- Start Trip Variables --------------> ///
  TextEditingController _startingOdometer = TextEditingController();
  TextEditingController _purposeOfTrip = TextEditingController();
  TextEditingController _locationStart = TextEditingController();
  TextEditingController _locationEnd = TextEditingController();
  TextEditingController get startingOdometer => _startingOdometer;
  TextEditingController get purposeOfTrip => _purposeOfTrip;
  TextEditingController get locationStart => _locationStart;
  TextEditingController get locationEnd => _locationEnd;

  GlobalKey _startTripKey = GlobalKey<FormState>();
  GlobalKey get startTripKey => _startTripKey;

  CarType? _currentCarTypeValue;
  CarType? get currentCarValue => _currentCarTypeValue;

  String? _currentVehicleNo;
  String? get currentVehicleNo => _currentVehicleNo;

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

  void onStartTripPush(BuildContext context) async {
    ///Ensure that current trip id is cleared before setting it again
    CurrentUser.instance.currentTripID = null;
    DateTime currentDateTime = DateTime.now();
    var now = DateTime.parse(currentDateTime.toString() + '-08:00');
    String _date = now.day.toString().padLeft(2, '0') +
        "/" +
        now.month.toString().padLeft(2, '0') +
        "/" +
        now.year.toString();
    String _time = now.hour.toString().padLeft(2, '0') +
        now.minute.toString().padLeft(2, '0');
    String _classType = await db.singleDataPull(
        "Vehicles", "vehicleNo", _currentVehicleNo!, "classType");
    String? _username = CurrentUser.instance.username;
    if (_username != null) {
      print("Starting trip..");
      String _currentTripID = await db.startTrip(
          _username,
          _date,
          _currentVehicleNo!,
          _time,
          _startingOdometer.text,
          _locationStart.text,
          _locationEnd.text,
          _purposeOfTrip.text,
          _classType);
      CurrentUser.instance.currentTripID = _currentTripID;
      print("CurrentTripID stored as ${CurrentUser.instance.currentTripID}");

      ///Telegram movement
      String _rankTO =
          await db.singleDataPull("Users", "username", _username, "rank");
      String _fullNameTO =
          await db.singleDataPull("Users", "username", _username, "fullName");
      String _fullNameVC = "Damon Lim";
      String _rankVC = "PTE";
      telebot.sendMovement(_currentVehicleNo!, _locationEnd.text,
          _purposeOfTrip.text, _rankTO, _fullNameTO, _rankVC, _fullNameVC);

      Navigator.pushNamed(context, '/home');
    } else {
      print("Unsuccessful Submit, username null");
    }
  }

  List<String?> vehicleNumbers = [""];

  Future<List<String?>> getVehicleNumbers(CarType value) async {
    String? _carType = value.toString();
    List<dynamic> _dynamicList = await db.vehiclesBasedOnCarType(_carType);
    List<String?> _vehicleList = _dynamicList.map((s) => s as String?).toList();
    return _vehicleList;
  }

  /// <------------- End Trip Variables -------------> /////////
  GlobalKey _endTripKey = GlobalKey<FormState>();
  GlobalKey get endTripKey => _endTripKey;

  TextEditingController _endOdometer = TextEditingController();
  TextEditingController get endOdometer => _endOdometer;

  void onEndTripPush(BuildContext context) async {
    //DateTime formatting
    DateTime currentDateTime = DateTime.now();
    var now = DateTime.parse(currentDateTime.toString() + '-08:00');
    String _time = now.hour.toString().padLeft(2, '0') +
        now.minute.toString().padLeft(2, '0');
    //Local Variables
    String? _username = CurrentUser.instance.username;
    String? _tripID = CurrentUser.instance.currentTripID;
    if (_username != null && _tripID != null) {
      String startOdo =
          await db.singleDataPull("Logging", "UUID", _tripID, "odometerStart");
      //Casting dyn to int
      int _mileage = int.parse(_endOdometer.text) - int.parse(startOdo);
      print(
          "Starting odo is $startOdo and Ending odo is ${_endOdometer.text} so total mileage is $_mileage");
      db.endTrip(_tripID, _mileage.toString(), _time, _endOdometer.text);
      CurrentUser.instance.currentTripID = null;
      print(
          "Current Trip ID Set to null >> ${CurrentUser.instance.currentTripID}");
      ///Telegram Movement
      //telebot.endMovement(vehicleNo, locationEnd, toRank, toFullName, vcRank, vcFullName),

      Navigator.pushNamed(context, '/home');
    }
  }
}
