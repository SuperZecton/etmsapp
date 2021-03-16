
import 'package:flutter/material.dart';
import 'package:ltcapp/features/login/viewmodel/LoginPageVM.dart';
import 'package:ltcapp/main.dart';
import 'package:provider/provider.dart';

class Authentication with ChangeNotifier {
  String email = LoginPageViewModel().email;
  String password = LoginPageViewModel().password;

  Future verifyLoginData(bool lC, BuildContext context) async {
    lC = await personnelDBHandle.verifyLoginCreds(
        email, password);
    await new Future.delayed(const Duration(seconds: 2));
    if (lC == true) {
      Navigator.pushNamed(context, '/home');
    }
  }

}