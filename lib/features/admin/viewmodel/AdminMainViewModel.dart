import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ltcapp/core/services/CurrentSession.dart';
import 'package:ltcapp/core/services/DatabaseConnector.dart';
import 'package:stacked/stacked.dart';

class AdminMainViewModel extends MultipleFutureViewModel {
  DatabaseHandler db = DatabaseHandler();
  static const String _StrengthDelayedFuture = "strength";
  List<String> get fetchedStrength => dataMap![_StrengthDelayedFuture];
  bool get fetchingStrength => busy(_StrengthDelayedFuture);

  @override
  Map<String, Future Function()> get futuresMap => {
        _StrengthDelayedFuture: getStrength,
      };

  Future<List<String>> getStrength() async {
    List<List<String>> _list = await db.getParadeState();
    int _currentStrength = 0;
    int _totalStrength = _list.length;
    List<String> _strength = [];
    for (int i = 0; i < _list.length; i++) {
      if (_list[i][1].isNotEmpty && _list[i][1].length != 0) {
        _currentStrength++;
      }
    }
    _strength.addAll([_currentStrength.toString(), _totalStrength.toString()]);
    return _strength;
  }

  void onOffPassPush(BuildContext context) {
    ///Implement Permission check here
    Navigator.pushNamed(context, '/adminOffPass');

  }

  void onParadePush(BuildContext context) {
    Navigator.pushNamed(context, '/adminParadeState');
  }

  void floatingButtonPress(BuildContext context) {}
}
