import 'dart:core';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ltcapp/core/services/CurrentSession.dart';
import 'package:ltcapp/core/services/DatabaseConnector.dart';
import 'package:ltcapp/core/utils/DateAndTimeGetter.dart';
import 'package:ltcapp/core/widgets/ErrorDialogs.dart';
import 'package:stacked/stacked.dart';

class CheckInViewModel extends BaseViewModel {
  CheckInViewModel(){
    String _date = dt.getCurrentDate();
    String _time = dt.getDisplayCurrentTime();
    _localDate = _date;
    _localTime = _time;
  }
  DateAndTime dt = DateAndTime();
  DatabaseHandler db = DatabaseHandler();
  ///Variable Initializers
  String? _localDate;
  String? _localTime;
  String? get localDate => _localDate;
  String? get localTime => _localTime;
  String? _currentStatus;
  String? get currentStatus => _currentStatus;

  String? _currentLocation;
  String? get currentLocation => _currentLocation;

  List<String?> _statusList = [
    "PRESENT",
    "DUTY",
    "DETAIL",
    "OFF",
    "SOL",
    "LEAVE",
    "MC",
    "RSI",
    "RSO",
    "MA",
    "ON COURSE",
    "SHRO"
  ];
  List<String?> get statusList => _statusList;
  List<String?> _locationList = [
    "In LTC",
    "In BPC",
    "On Detail",
    "At Home",
    "Others"
  ];
  List<String?> get locationList => _locationList;
  void statusOnChanged(String value) {
    _currentStatus = value;
    notifyListeners();
  }

  void locationOnChanged(String value) {
    _currentLocation = value;
    notifyListeners();
  }

  void onSubmitPush(BuildContext context){
    String? _username = CurrentUser.instance.username;
    if(_currentLocation != null && _currentStatus != null && _username != null){
      db.createCheckInEntry(_username, _currentLocation!, _currentStatus!);
      print("Successfully checked in ");
    } else{
      ErrorDialogs.normalAlertDialog(context, "Missing Fields", "Please fill out all the required fields");
    }

    Navigator.pushNamed(context, '/afterLogin');
  }
}
