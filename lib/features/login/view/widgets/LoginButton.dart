
import 'package:flutter/material.dart';
import 'package:ltcapp/core/config/Globals.dart';
import 'package:ltcapp/features/login/viewmodel/WelcomePageViewModel.dart';
import 'package:stacked/stacked.dart';

class LoginButton extends ViewModelWidget<WelcomePageViewModel> {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WelcomePageViewModel model) {
    return InkWell(
      onTap: () => model.loginPush(context),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: darkSecondaryColor),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 20, color: darkTextColor),
        ),
      ),
    );
  }
}
