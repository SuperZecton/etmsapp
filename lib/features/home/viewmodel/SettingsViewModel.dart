import 'package:ltcapp/core/services/CurrentSession.dart';
import 'package:ltcapp/core/services/DatabaseConnector.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class SettingsViewModel extends MultipleFutureViewModel {
  DatabaseHandler db = DatabaseHandler();
  static const String _StayLoggedInDelayedFuture = "loggedIn";
  bool get fetchedStayLoggedIn => dataMap![_StayLoggedInDelayedFuture];
  bool get fetchingStayLoggedIn => busy(_StayLoggedInDelayedFuture);

  @override
  Map<String, Future Function()> get futuresMap =>
      {_StayLoggedInDelayedFuture: getStayLoggedIn};

  Future<bool> getStayLoggedIn() async {
    String? _username = CurrentUser.instance.username;
    if (_username != null) {
      String? stayLoggedInString = await db.singleDataPull(
          "Users", "username", _username, "rememberlogin");
      if (stayLoggedInString == "true") {
        return true;
      } else if (stayLoggedInString == "false") {
        return false;
      } else {
        return Future.error("Some error");
      }
    } else {
      return Future.error("Cannot find");
    }
  }

  void onStayLoggedInTap(bool value) {
    String? _username = CurrentUser.instance.username;
    if (value == true && _username != null ){
      db.editSingleDataEntry("Users", "username",_username, "rememberlogin", "true");
      notifyListeners();
    } else if (value == false && _username != null ){
      db.editSingleDataEntry("Users", "username",_username, "rememberlogin", "false");
      notifyListeners();
    } else {
      print("Error!");
    }

  }
}
