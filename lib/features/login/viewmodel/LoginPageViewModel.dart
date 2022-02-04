import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/core/utils/locator.dart';
import 'package:ltcapp/features/login/view/pages/LoginPage.dart';
import 'package:ltcapp/core/widgets/LoadingIndicator.dart';
import 'package:ltcapp/core/utils/database_connector.dart';
import 'package:ltcapp/core/services/CurrentSession.dart';
import 'package:ltcapp/core/config/Globals.dart';
import 'package:ltcapp/features/login/model/UUIDGetter.dart';
import 'package:ltcapp/features/login/view/widgets/LoginFailDialog.dart';
import 'package:stacked/stacked.dart';

class LoginPageViewModel extends BaseViewModel {
  void initialise(){
    usernameController.text = rememberedUsername!;
    usernameController.text = rememberedPassword!;

  }

  static String? rememberedUsername = CurrentUser.instance.rememberedUser;
  static String? rememberedPassword = CurrentUser.instance.rememberedPassword;
  DeviceUUID deviceID = new DeviceUUID();
  String _deviceID = CurrentUser.instance.deviceID!;
  DatabaseHandler db = DatabaseHandler();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  String get user => usernameController.text;
  String get password => passwordController.text;

  Future verifyLoginData(BuildContext context) async {
    bool loginCredentials;
    loginCredentials = await db.verifyLoginCreds(user, password);

    if (loginCredentials == true) {
      /// Sets global user
      CurrentUser.instance.username = user;
      bool canFindLoginEntry = await db.checkLoginEntry(_deviceID, user);
      DateTime currentDateTime = DateTime.now();
      var now = DateTime.parse(currentDateTime.toString()+'-08:00');
      String _date = now.day.toString().padLeft(2, '0') + "/" + now.month.toString().padLeft(2, '0') + "/" + now.year.toString();
      String _time = now.hour.toString().padLeft(2, '0') + now.minute.toString().padLeft(2, '0') + now.second.toString().padLeft(2, '0');

      if (canFindLoginEntry != true) {
        print("Creating Login Entry..");
        db.createLoginEntry(_deviceID, user, password, _date, _time);
      } else {
        //TODO Update the time of the current login entry to current login entry
      }

      /// Redirects user to home page
      Navigator.pushNamed(context, '/home');
    } else {
      print('user is $user and pass is $password');
      LoginFailDialog.loginFailDailog(context);
    }
  }

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }
}
