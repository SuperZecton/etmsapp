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


  Future<List<List<String>>> getWPTVehicles() async {
    List<List<String>> _list = await db.getWPTVehicles();
    print(_list);
    if(_list == [[], []]){
      _isWPTEmpty = true;
      print("WPT IS EMPTY: ${_isWPTEmpty.toString()}");
    }
    return _list;
  }

  bool _isWPTEmpty = false;
  bool get isWPTEmpty => _isWPTEmpty;
  void floatingButtonPress(BuildContext context) {}


}
