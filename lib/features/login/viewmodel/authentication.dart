
import 'package:flutter/material.dart';
import 'package:ltcapp/features/login/view/widgets/LoadingIndicator.dart';
import 'package:ltcapp/features/login/viewmodel/LoginPageVM.dart';
import 'package:ltcapp/main.dart';
import 'package:provider/provider.dart';

class Authentication with ChangeNotifier {
  
  String email = LoginPageViewModel().email;
  String password = LoginPageViewModel().password;


  Future verifyLoginData(BuildContext context, bool loginCreds) async {
    loginCreds = await personnelDBHandle.verifyLoginCreds(
        email, password);
    await new Future.delayed(const Duration(seconds: 2),);
    if (loginCreds == true) {
      Navigator.pushNamed(context, '/home');
      print((await personnelDBHandle.getFullRowFromEmail(email)).toString());
    }
  }
}