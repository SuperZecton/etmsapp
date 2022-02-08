
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AfterLoginViewModel extends BaseViewModel {
  ///Implement VM Here

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  void onDrawerMenuTap() {
    _scaffoldKey.currentState!.openDrawer();
    notifyListeners();
  }


  void onTOPush(BuildContext context){
    Navigator.pushNamed(context, '/home');
  }

}