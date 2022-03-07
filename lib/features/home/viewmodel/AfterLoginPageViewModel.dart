import 'package:flutter/material.dart';
import 'package:ltcapp/core/services/CurrentSession.dart';
import 'package:ltcapp/core/services/DatabaseConnector.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class AfterLoginViewModel extends MultipleFutureViewModel {
  AfterLoginViewModel() {
    DateTime currentDateTime = DateTime.now();
    var now = DateTime.parse(currentDateTime.toString() + '-08:00');
    this._currentDate = now.day.toString().padLeft(2, '0') +
        "/" +
        now.month.toString().padLeft(2, '0') +
        "/" +
        now.year.toString();
  }
  String? _currentDate;
  String? get currentDate => _currentDate;
  DatabaseHandler db = DatabaseHandler();
  static const String _nameDelayedFuture = 'FullName';
  static const String _nricDelayedFuture = 'NRIC';
  static const String _vocationDelayedFuture = 'Vocation';
  static const String _rankDelayedFuture = 'Rank';
  String get fetchedName => dataMap![_nameDelayedFuture];
  String get fetchedNRIC => dataMap![_nricDelayedFuture];
  String get fetchedVocation => dataMap![_vocationDelayedFuture];
  String get fetchedRank => dataMap![_rankDelayedFuture];

  bool get fetchingName => busy(_nameDelayedFuture);
  bool get fetchingNRIC => busy(_nricDelayedFuture);
  bool get fetchingVocation => busy(_vocationDelayedFuture);
  bool get fetchingRank => busy(_rankDelayedFuture);
  @override
  Map<String, Future Function()> get futuresMap => {
        _nameDelayedFuture: getNameFromDB,
        _nricDelayedFuture: getNRICFromDB,
        _vocationDelayedFuture: getVocationFromDB,
        _rankDelayedFuture: getRankFromDB,
      };
  Future<String> getNameFromDB() async {
    String? _username = CurrentUser.instance.username;
    if (_username != null) {
      return db.singleDataPull("Users", "username", _username, "fullName");
    } else {
      return Future.error("Error");
    }
  }

  Future<String> getNRICFromDB() async {
    String? _username = CurrentUser.instance.username;
    if (_username != null) {
      return db.singleDataPull(
          "Users", "username", _username, "nricLast4Digits");
    } else {
      return Future.error("Error");
    }
  }

  Future<String> getVocationFromDB() async {
    String? _username = CurrentUser.instance.username;
    if (_username != null) {
      return db.singleDataPull("Users", "username", _username, "vocationType");
    } else {
      return Future.error("Error");
    }
  }

  Future<String> getRankFromDB() async {
    String? _username = CurrentUser.instance.username;
    if (_username != null) {
      return db.singleDataPull("Users", "username", _username, "rank");
    } else {
      return Future.error("Error");
    }
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  void onDrawerMenuTap() {
    _scaffoldKey.currentState!.openDrawer();
    notifyListeners();
  }

  void TOPush(BuildContext context) {
    Navigator.pushNamed(context, '/home');
  }

  void maintenancePush(BuildContext context) {
    Navigator.pushNamed(context, '/maintenanceMain');
  }

  void racFormURLPush() async {
    const url = "https://mtrac.ternary.digital/login";
    if (await canLaunch(url)) {
      launch(url, enableJavaScript: true);
    } else {
      throw "Could not launch $url";
    }
  }

  void adminPush(BuildContext context){
    Navigator.pushNamed(context, '/adminMain');
  }

  void checkInOutPush(BuildContext context) async {
    ///Insert logic here
    String? _username = CurrentUser.instance.username;
    if (_username != null) {
      String? currentStatus = await db.checkCheckedIn(_username);
      switch (currentStatus) {
        case 'NotCheckedIn':
          {
            Navigator.pushNamed(context, '/checkIn');
          }
          break;
        case 'CheckedOut':
          {
            Navigator.pushNamed(context, '/checkStatus');
          }
          break;
        case 'NotCheckedOut':
          {
            Navigator.pushNamed(context, '/checkOut');
          }
          break;
        default: {
          print("Check In Push Error");
        } break;

    }
    }

  }
}
