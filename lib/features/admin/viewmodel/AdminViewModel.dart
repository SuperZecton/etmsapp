import 'package:flutter/cupertino.dart';
import 'package:ltcapp/core/services/CurrentSession.dart';
import 'package:ltcapp/core/services/DatabaseConnector.dart';
import 'package:stacked/stacked.dart';

class AdminViewModel extends MultipleFutureViewModel {



  DatabaseHandler db = DatabaseHandler();
  static const String _ParadeStateDelayedFuture = "paradeState";
  List<List<String>> get fetchedParadeState=> dataMap![_ParadeStateDelayedFuture];
  bool get fetchingParadeState => busy(_ParadeStateDelayedFuture);

  @override
  Map<String, Future Function()> get futuresMap => {
    _ParadeStateDelayedFuture: getParadeState,
  };


  Future<List<List<String>>> getParadeState() async {
    List<List<String>> _list = await db.getParadeState();
    print("List of parade state is $_list");
    return _list;
  }


  void floatingButtonPress(BuildContext context) {}
}
