import 'package:flutter/cupertino.dart';
import 'package:ltcapp/core/services/CurrentSession.dart';
import 'package:ltcapp/core/services/DatabaseConnector.dart';
import 'package:stacked/stacked.dart';

class MaintenanceWPTViewModel extends MultipleFutureViewModel {
  DatabaseHandler db = DatabaseHandler();
  static const String _WPTVehicleListDelayedFuture = "wpt";
  List<List<String>> get fetchedWPT => dataMap![_WPTVehicleListDelayedFuture];
  bool get fetchingWPT => busy(_WPTVehicleListDelayedFuture);

  @override
  Map<String, Future Function()> get futuresMap => {
    _WPTVehicleListDelayedFuture: getWPTVehicles,
  };
  ///TODO SPLIT WPT 1 AND 2

  Future<List<List<String>>> getWPTVehicles() async {
    List<List<String>> _list = await db.getWPTVehicles();
    print(_list);
    _wptLength = _list[0].length + _list[1].length;
    print("There are " + _list[0].length.toString() + " WPT 1 and " + _list[1].length.toString() + " WPT 2");
    if(_list[0].length == 0){
      _isWPTEmpty = true;
      print("WPT1 IS EMPTY: ${_isWPTEmpty.toString()}");
    }
    if(_list[1].length == 0){
      _isWPT2Empty = true;
      print("WPT2 IS EMPTY: ${_isWPT2Empty.toString()}");
    }
    return _list;
  }
  int _wptLength = 0;
  int get wptLength => _wptLength;
  bool _isWPTEmpty = false;
  bool get isWPTEmpty => _isWPTEmpty;
  bool _isWPT2Empty = false;
  bool get isWPT2Empty => _isWPT2Empty;
  void floatingButtonPress(BuildContext context) {}


}
