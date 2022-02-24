import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ltcapp/core/services/CurrentSession.dart';
import 'package:ltcapp/core/services/DatabaseConnector.dart';
import 'package:ltcapp/core/utils/DateAndTimeGetter.dart';
import 'package:stacked/stacked.dart';

class CheckOutViewModel extends MultipleFutureViewModel {
  DateAndTime dt = DateAndTime();
  DatabaseHandler db = DatabaseHandler();
  static const String _StatusDelayedFuture = "status";
  List<String> get fetchedStatus => dataMap![_StatusDelayedFuture];
  bool get fetchingStatus => busy(_StatusDelayedFuture);

  @override
  Map<String, Future Function()> get futuresMap => {
    _StatusDelayedFuture: getStatus
  };

  Future<List<String>> getStatus() async {
    String? _username = CurrentUser.instance.username;
    if (_username != null ){
      String _nric = await db.singleDataPull("Users", "username", _username , "nricLast4Digits");
      List<String> _list = await db.checkStatus(_username);
      _list.add(_nric);
      print(_list);
      return _list;
    } else {
      return Future.error("Cannot find");
    }


  }

  ///Variable Initializers

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
