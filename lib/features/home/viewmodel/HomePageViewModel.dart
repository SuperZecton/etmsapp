import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ltcapp/features/home/model/HomePageModel.dart';
import 'package:ltcapp/features/home/view/pages/HomePage.dart';
import 'package:ltcapp/core/services/CurrentSession.dart';
import 'package:ltcapp/core/services/DatabaseConnector.dart';
import 'package:ltcapp/features/home/view/widgets/HomePageDialog.dart';
import 'package:provider/provider.dart';
import 'package:ltcapp/main.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePageViewModel extends MultipleFutureViewModel {
  final currentUsername = CurrentUser.instance.username;
  static const _nameDelayedFuture = "Name";
  static const _nricDelayedFuture = "NRIC";
  static const _rankDelayedFuture = "Rank";
  static const _class3DelayedFuture = "CLass 3";
  static const _class4DelayedFuture = "Class 4";
  String get fetchedName => dataMap![_nameDelayedFuture];
  String get fetchedNRIC => dataMap![_nricDelayedFuture];
  String get fetchedRank => dataMap![_rankDelayedFuture];
  String get fetchedClass3 => dataMap![_class3DelayedFuture];
  String get fetchedClass4 => dataMap![_class4DelayedFuture];
  bool get fetchingName => busy(_nameDelayedFuture);
  bool get fetchingNRIC => busy(_nricDelayedFuture);
  bool get fetchingRank => busy(_rankDelayedFuture);
  bool get fetchingClass3 => busy(_class3DelayedFuture);
  bool get fetchingClass4 => busy(_class4DelayedFuture);

  @override
  Map<String, Future Function()> get futuresMap => {
    _nameDelayedFuture: getFullName,
    _nricDelayedFuture: getNRIC,
    _rankDelayedFuture: getRank,
    _class3DelayedFuture: getClass3Mileage,
    _class4DelayedFuture: getClass4Mileage,
  };

  Future<String> getFullName() async {
    String _username;
    if (currentUsername != null) {
      _username = currentUsername as String;
      return await db.singleDataPull(
          "Users", "username", _username, "fullName");
    } else {
      print("Username from DB is empty when searching");
      _username = "";
      return Future.error("No Name found");
    }
  }

  Future<String> getRank() async {
    String? _username = CurrentUser.instance.username;
    if(_username != null) {
      return db.singleDataPull("Users", "username", _username, "rank");
    } else {
      return Future.error("Error");
    }
  }

  Future<String> getNRIC() async {
    String _username;
    if (currentUsername != null) {
      _username = currentUsername as String;
      return await db.singleDataPull(
          "Users", "username", _username, "nricLast4Digits");
    } else {
      print("NRIC from DB is empty when searching");
      _username = "";
      return Future.error("No NRIC found");
    }
  }

  Future<String> getClass3Mileage() async {
    String _username;
    if (currentUsername != null) {
      _username = currentUsername as String;
      return await db.singleDataPull(
          "Users", "username", _username, "totalClass3Mileage");
    } else {
      print("Class 3 Mileage not found from DB");
      return Future.error("Class 3 mileage Error");
    }
  }

  Future<String> getClass4Mileage() async {
    String _username;
    if (currentUsername != null) {
      _username = currentUsername as String;
      return await db.singleDataPull(
          "Users", "username", _username, "totalClass4Mileage");
    } else {
      print("Class 4 Mileage not found from DB");
      return Future.error("Class 4 mileage Error");
    }
  }




  ///Future Getters

  DatabaseHandler db = DatabaseHandler();


  Future<List<String?>> ensureCurrentTripData() async {
    String? _tripID = CurrentUser.instance.currentTripID;
    if (_tripID != null) {
      print("Ensuring Current Trip Data");
      List<dynamic> _dynList = await db.multiDataPullRow("Logging", "UUID", _tripID);
      List<String?> _dataList = _dynList.map((s) => s as String?).toList();
      print(_dataList);
      return _dataList;

    } else {
      print("Ensure Current Trip Data failed to get data from DB");
      return Future.error("No data");
    }
  }


  /// <--------- State Logic --------->
  /// Variable Initialization


  void onBackButtonTap(BuildContext context){
    Navigator.pushNamed(context, '/afterLogin');
  }
  /// CampDropDown
  static final List<String> campDropdownItems = [
    'LTC',
    'BPC',
  ];
  String campDropdown = campDropdownItems[0];
  int campChartNo = 0;

  void campDropDownUpdate(String? value) {
    if (value != null) {
      campDropdown = value;
      campChartNo = campDropdownItems.indexOf(value);
    } else {
      print("Null value for campDrownDownUpdate");
    }

    notifyListeners();
  }

  static final List<String> dateDropdownItems = [
    'Total',
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  String dateDropdown = dateDropdownItems[0];
  int dateChartNo = 0;

  void dateDropDownUpdate(String? value) {
    if (value != null) {
      dateDropdown = value;
      dateChartNo = dateDropdownItems.indexOf(value);
    } else {
      print("Null value for dateDropDownUpdate");
    }
    notifyListeners();
  }


  void shroFormURLPush() async {
    const url =
        "https://docs.google.com/forms/d/e/1FAIpQLSdaPpHhO8dO2qnyLonsLO41b1eTDfZdkwzmBksOQKbLNrgcTg/viewform";
    if (await canLaunch(url)) {
      launch(url, forceWebView: true, enableJavaScript: true);
    } else {
      throw "Error launching $url";
    }
  }

  void startTripPush(BuildContext context) {
    if(CurrentUser.instance.currentTripID != null){
      HomePageDialog.startTripDeniedDialog(context);

    } else {
      Navigator.pushNamed(context, '/vehicleStartTrip');
    }

  }

  void endTripPush(BuildContext context) {
    if(CurrentUser.instance.currentTripID == null){
      HomePageDialog.endTripDeniedDialog(context);
    } else {
      Navigator.pushNamed(context, '/vehicleEndTrip');
    }
  }



}


