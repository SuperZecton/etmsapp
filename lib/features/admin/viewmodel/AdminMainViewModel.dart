import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ltcapp/core/services/CurrentSession.dart';
import 'package:ltcapp/core/services/DatabaseConnector.dart';
import 'package:stacked/stacked.dart';

class AdminMainViewModel extends BaseViewModel {

  void onOffPush (BuildContext context){

  }

  void onParadePush (BuildContext context){
  Navigator.pushNamed(context, '/adminParadeState');

  }
  void floatingButtonPress(BuildContext context) {}
}
