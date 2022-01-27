import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  LoginPageViewModel() {
    Future futureUUID = deviceID.getUUID();
    futureUUID.then((result) {
      _uuid = result;
    });
    _loginEntry = findRememberedAccount();
    rememberedUsername = _loginEntry[0];
    rememberedPassword = _loginEntry[1];
  }

  void initialise() {
    notifyListeners();
  }

  String _uuid = "";
  List<dynamic> _loginEntry = [];
  static String rememberedUsername = "";
  static String rememberedPassword = "";
  DeviceUUID deviceID = new DeviceUUID();
  DatabaseHandler db = DatabaseHandler();

  List<dynamic> findRememberedAccount() {
    var _futureEntry = db.findLoginEntry(_uuid);
    List<dynamic> _usernpass = [];
    _futureEntry.then((result) {
      _usernpass = result;
    });
    print("login entry is " + _usernpass.toString());
    if (_usernpass.isEmpty) {
      print("Login entry is empty");
      return ["", ""];
    } else {
      print("Login entry is successful");
      return _usernpass;
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
      CurrentUser.instance.password = password;
      bool canFindLoginEntry = await db.checkLoginEntry(_uuid, user);
      if (canFindLoginEntry == true) {
        ///TODO For Damon to input
      }

      /// Redirects user to home page
      Navigator.pushNamed(context, '/home');
    } else {
      LoginFailDialog.loginFailDailog(context);
    }
  }

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }
}
