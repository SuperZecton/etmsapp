import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/core/utils/locator.dart';
import 'package:ltcapp/features/login/view/pages/LoginPage.dart';
import 'package:ltcapp/core/widgets/LoadingIndicator.dart';
import 'package:ltcapp/core/services/DatabaseConnector.dart';
import 'package:ltcapp/core/services/CurrentSession.dart';
import 'package:ltcapp/core/config/Globals.dart';
import 'package:ltcapp/features/login/model/UUIDGetter.dart';
import 'package:ltcapp/features/login/view/widgets/LoginFailDialog.dart';
import 'package:stacked/stacked.dart';

class LoginPageViewModel extends BaseViewModel {
  void initialise(BuildContext context) {
    findRememberedAccount(context);
    notifyListeners();
  }

  DeviceUUID deviceID = new DeviceUUID();
  String _deviceID = CurrentUser.instance.deviceID!;
  DatabaseHandler db = DatabaseHandler();

  Future findRememberedAccount(BuildContext context) async {
    List<dynamic> _futureEntry = await db.findLoginEntry(_deviceID);
    print("login entry is " + _futureEntry.toString());
    List<dynamic> _loginEntry;
    if (_futureEntry.isNotEmpty) {
      ///Input logic for page skip to after login page
      print("Login entry is successful");
      _loginEntry = _futureEntry;
      bool loginCredentials =
          await db.verifyLoginCreds(_loginEntry[0], _loginEntry[1]);
      if (loginCredentials == true) {
        String? rememberLoginBool = await db.singleDataPull(
            "Users", "username", _loginEntry[0], "rememberlogin");
        if (rememberLoginBool == "true") {
          CurrentUser.instance.username = _loginEntry[0];
          CurrentUser.instance.password = _loginEntry[1];
          String _currentTripID = await db.checkOngoingTrips(user);
          CurrentUser.instance.currentTripID = _currentTripID;
          DateTime currentDateTime = DateTime.now();
          var now = DateTime.parse(currentDateTime.toString());
          String _date = now.day.toString().padLeft(2, '0') +
              "/" +
              now.month.toString().padLeft(2, '0') +
              "/" +
              now.year.toString();
          String _time = now.hour.toString().padLeft(2, '0') +
              now.minute.toString().padLeft(2, '0') +
              now.second.toString().padLeft(2, '0');
          await db.checkAndCreateLoginEntry(
              _deviceID, _loginEntry[0], _loginEntry[1], _date, _time);

          ///Push to Home page
          Navigator.pushNamed(context, '/afterLogin');
          notifyListeners();
        } else {
          print("Login successful but user doesnt want auto login");
        }
      } else {
        LoginFailDialog.loginFailDialog(context);
        print("Login failed");
      }
    } else {
      print("Login entry is empty");
      _loginEntry = ["", ""];
      usernameController.text = _loginEntry[0];
      passwordController.text = _loginEntry[1];
    }
  }

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  String get user => usernameController.text;
  String get password => passwordController.text;

  Future verifyLoginData(BuildContext context) async {
    bool loginCredentials = await db.verifyLoginCreds(user, password);

    if (loginCredentials == true) {
      /// Sets global user
      CurrentUser.instance.username = user;
      String _currentTripID = await db.checkOngoingTrips(user);
      CurrentUser.instance.currentTripID = _currentTripID;
      DateTime currentDateTime = DateTime.now();
      var now = DateTime.parse(currentDateTime.toString());
      String _date = now.day.toString().padLeft(2, '0') +
          "/" +
          now.month.toString().padLeft(2, '0') +
          "/" +
          now.year.toString();
      String _time = now.hour.toString().padLeft(2, '0') +
          now.minute.toString().padLeft(2, '0') +
          now.second.toString().padLeft(2, '0');
      await db.checkAndCreateLoginEntry(
          _deviceID, user, password, _date, _time);

      /// Redirects user to home page
      Navigator.pushNamed(context, '/afterLogin');
    } else {
      print('user is $user and pass is $password');
      LoginFailDialog.loginFailDialog(context);
    }
  }

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }
}
