import 'package:ltcapp/core/services/CurrentSession.dart';
import 'package:ltcapp/core/services/DatabaseConnector.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class SettingsViewModel extends BaseViewModel {
  DatabaseHandler db = DatabaseHandler();
  bool? _loggedInBool;
  bool? get loggedInBool => _loggedInBool;

  void initialise() async {
   _loggedInBool = await getStayLoggedIn();

  }
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
      _loggedInBool = true;
      notifyListeners();
    } else if (value == false && _username != null ){
      db.editSingleDataEntry("Users", "username",_username, "rememberlogin", "false");
      _loggedInBool = false;
      notifyListeners();
    } else {
      print("Error!");
    }

  }
}
