import 'package:flutter/cupertino.dart';
import 'package:ltcapp/core/services/CurrentSession.dart';
import 'package:ltcapp/core/services/DatabaseConnector.dart';
import 'package:ltcapp/features/home/view/pages/HomePage.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class MileageViewModel extends FutureViewModel {
  //Input all the mileage getters and setters here
  //Database linkers will be in model folder
  Future<List<List<String>>> futureToRun() => getDataListFromDB();

  DatabaseHandler db = DatabaseHandler();
  Future<List<List<String>>> getDataListFromDB() async {
    List<List<String>> _returnList = [];
    String? _username = CurrentUser.instance.username;
    if (_username != null) {
      List<List<dynamic>> _dynList = await db.getMileageHistory(_username);
      for (int i = 0; i < _dynList.length; i++) {
        List<String> _individualList =
            _dynList[i].map((s) => s as String).toList();
        _returnList.add(_individualList);
      }
      print("This is the results from getDataListFromDB >> $_returnList");
      return _returnList;
    }
    else {
      print("Can't get DatabaseList from DB");
      return Future.error("error");
    }
  }
}
