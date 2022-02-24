import 'package:flutter/cupertino.dart';
import 'package:ltcapp/core/services/CurrentSession.dart';
import 'package:ltcapp/core/services/DatabaseConnector.dart';
import 'package:stacked/stacked.dart';

class MaintenanceVehicleViewModel extends MultipleFutureViewModel {
  DatabaseHandler db = DatabaseHandler();
  static const String _AllVehicleListDelayedFuture = "all";
  List<List<String>> get fetchedAllList => dataMap![_AllVehicleListDelayedFuture];
  bool get fetchingAllList => busy(_AllVehicleListDelayedFuture);

  @override
  Map<String, Future Function()> get futuresMap => {
    _AllVehicleListDelayedFuture: getAllVehicles,
  };


  Future<List<List<String>>> getAllVehicles() async {
    List<List<String>> _list = await db.getAllVehicles();

    print(_list);
    return _list;
  }


  void floatingButtonPress(BuildContext context) {}






}
