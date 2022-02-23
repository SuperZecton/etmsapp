import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ltcapp/core/services/CurrentSession.dart';
import 'package:ltcapp/core/services/DatabaseConnector.dart';
import 'package:ltcapp/core/utils/DateAndTimeGetter.dart';
import 'package:stacked/stacked.dart';

class CheckOutViewModel extends BaseViewModel {
  CheckOutViewModel(){
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

  void onSubmit(BuildContext context) {
    String? _username = CurrentUser.instance.username;
    if(_username != null){
      db.checkOut(_username);
      Navigator.pushNamed(context, '/afterLogin');
    } else {
      print("error");
    }


  }
}
