

import 'package:flutter/cupertino.dart';
import 'package:ltcapp/core/services/CurrentSession.dart';
import 'package:ltcapp/core/utils/database_connector.dart';
import 'package:ltcapp/features/home/view/pages/HomePage.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class MileageViewModel extends BaseViewModel {
  //Input all the mileage getters and setters here
  //Database linkers will be in model folder

  DatabaseHandler db = DatabaseHandler();
  /*List<String> getDataFromDB() async {
    List<String> _list;
    String? _username = CurrentUser.instance.username;
    if (_username != null){
      List<dynamic> _dynList = await db.m

    }

    return _list;

  }*/




}
