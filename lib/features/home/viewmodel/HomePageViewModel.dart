import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ltcapp/features/home/model/HomePageModel.dart';
import 'package:ltcapp/features/home/view/pages/HomePage.dart';
import 'package:ltcapp/core/services/CurrentSession.dart';
import 'package:ltcapp/core/utils/database_connector.dart';
import 'package:provider/provider.dart';
import 'package:ltcapp/main.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePageViewModel extends BaseViewModel {
  HomePageViewModel();

  ///Incomplete code for getting fullname from model
  final currentUsername = CurrentUser.instance.username;
  DatabaseHandler db = DatabaseHandler();
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

  void initialise() {
    notifyListeners();
  }

  /// <--------- State Logic --------->
  /// Variable Initialization
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  void onDrawerMenuTap() {
    _scaffoldKey.currentState!.openDrawer();
    notifyListeners();
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

  void racFormURLPush() async {
    const url = "https://mtrac.ado.sg/login";
    if (await canLaunch(url)) {
      launch(url, enableJavaScript: true);
    } else {
      throw "Could not launch $url";
    }
  }

  void safeEntryURLPush() async {
    const url =
        "https://docs.google.com/forms/d/e/1FAIpQLSfOG1IHwj2B9zXGpRrpjdb5quiKBEmhyUF3-QvhQdS0o2C60Q/viewform";
    if (await canLaunch(url)) {
      launch(url, forceWebView: true, enableJavaScript: true);
    } else {
      throw "Error launching $url";
    }
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
    Navigator.pushNamed(context, '/vehicleStartTrip');
  }

  void endTripPush(BuildContext context) {
    Navigator.pushNamed(context, '/vehicleEndTrip');
  }
}
