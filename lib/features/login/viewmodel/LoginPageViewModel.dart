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

class LoginPageViewModel extends FutureViewModel<List<dynamic>> {

  @override
  Future<dynamic> initialise() async{
    /*_loginEntry = await findRememberedAccount();
   rememberedUsername = _loginEntry[0];
   rememberedPassword = _loginEntry[1];
   print('something blah blah $rememberedUsername and $rememberedPassword');
   notifyListeners();*/
  }
  @override
  Future<List<dynamic>> futureToRun() => findRememberedAccount();
  List<dynamic> _loginEntry = ["",""];

  static String rememberedUsername = "";
  static String rememberedPassword = "";
  DeviceUUID deviceID = new DeviceUUID();
  String _deviceID = CurrentUser.instance.deviceID!;
  DatabaseHandler db = DatabaseHandler();

  Future<List<dynamic>> findRememberedAccount() async {
    List<dynamic> _futureEntry = await db.findLoginEntry(_deviceID);
    print("login entry is " + _futureEntry.toString());
    List<dynamic> _localEntry;
    if (_futureEntry.isNotEmpty) {
      print("Login entry is successful");
      _localEntry = _futureEntry;

      rememberedUsername = _localEntry[0];
      rememberedUsername = _localEntry[1];
      print('Remembered user is $rememberedUsername and remembered pass is $rememberedPassword');
      notifyListeners();
      return _localEntry;
    } else {
      print("Login entry is empty");
      _localEntry = ["", ""];
      notifyListeners();
      return _localEntry;
    }
  }

  final usernameController = TextEditingController(text: rememberedUsername);
  final passwordController = TextEditingController(text: rememberedPassword);

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
