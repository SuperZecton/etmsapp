
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ltcapp/core/services/CurrentSession.dart';
import 'package:ltcapp/features/login/model/UUIDGetter.dart';
import 'package:stacked/stacked.dart';

class WelcomePageViewModel extends BaseViewModel {
  void loginPush(BuildContext context){
    Navigator.pushNamed(context, '/login');
  }

  void registrationPush(BuildContext context){
    Navigator.pushNamed(context, '/signUp');
  }
}