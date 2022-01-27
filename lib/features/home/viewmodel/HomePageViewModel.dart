import 'package:flutter/cupertino.dart';
import 'package:ltcapp/features/home/model/HomePageModel.dart';
import 'package:ltcapp/features/home/view/pages/HomePage.dart';
import 'package:ltcapp/features/login/model/CurrentSession.dart';
import 'package:provider/provider.dart';
import 'package:ltcapp/main.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePageViewModel extends BaseViewModel {
  HomePageViewModel(){
    _fullName = HomePageViewModel().getFullName();
  }

  ///Incomplete code for getting fullname from model
  HomePageModel model = HomePageModel();
  String getFullName(){
    print("getFullName Function ran");
    String _name = model.fullName;
    return _name;
  }

  String _fullName = "";
  String get fullName => _fullName;

  void initialise() {
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


}
