


import 'package:flutter/material.dart';
import 'package:ltcapp/core/services/CurrentSession.dart';
import 'package:ltcapp/core/services/DatabaseConnector.dart';
import 'package:ltcapp/core/services/TelebotConnector.dart';
import 'package:ltcapp/core/widgets/ErrorDialogs.dart';
import 'package:stacked/stacked.dart';

class VehicleEndTripViewModel extends BaseViewModel {
  /// <------------- End Trip Variables -------------> /////////
  GlobalKey _endTripKey = GlobalKey<FormState>();
  GlobalKey get endTripKey => _endTripKey;

  TextEditingController _endOdometer = TextEditingController();
  TextEditingController get endOdometer => _endOdometer;
  DatabaseHandler db = DatabaseHandler();
  TelebotConnector telebot = TelebotConnector();

  void onEndTripPush(BuildContext context) async {
    //DateTime formatting
    DateTime currentDateTime = DateTime.now();
    var now = DateTime.parse(currentDateTime.toString() + '-08:00');
    String _time = now.hour.toString().padLeft(2, '0') +
        now.minute.toString().padLeft(2, '0');
    //Local Variables
    String? _username = CurrentUser.instance.username;
    String? _tripID = CurrentUser.instance.currentTripID;
    if (_username != null && _tripID != null && _endOdometer.text.isEmpty != true)  {
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
      ///
      String? _vehicleNo = await db.singleDataPull("Logging", "UUID", _tripID, "vehicleNo");
      String? _locationEnd = await db.singleDataPull("Logging", "UUID", _tripID, "locationEnd");
      String? _toRank = await db.singleDataPull("Users", "username", _username, "rank");
      String? _toFullName = await db.singleDataPull("Users", "username", _username, "fullName");
      String? _vcRankFullName = await db.singleDataPull("Logging", "UUID", _tripID, "vcRankFullName");
      telebot.endMovement(_vehicleNo, _locationEnd, _toRank, _toFullName, _vcRankFullName);

      Navigator.pushNamed(context, '/home');
    } else {
      ErrorDialogs.normalAlertDialog(context, "Missing Fields", "Please fill out end Odometer");
    }
  }


}