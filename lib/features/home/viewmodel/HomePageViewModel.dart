import 'package:flutter/cupertino.dart';
import 'package:ltcapp/features/home/model/HomePageModel.dart';
import 'package:ltcapp/features/home/view/pages/HomePage.dart';
import 'package:ltcapp/features/login/model/CurrentSession.dart';
import 'package:provider/provider.dart';
import 'package:ltcapp/main.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePageViewModel extends BaseViewModel {
  /// Fetch current user from Singleton
  //final username = CurrentUser.instance.username;

  ///Incomplete code for getting fullname from model
  /*HomePageModel model = HomePageModel();
  String fullName;
  fullNameGetter(){
    print("FullNameGetter debug test");
    fullName = model.getName();
  }*/
  ///TODO Implement fullname getter here
  final String _fullName = "";
  String get fullName => _fullName;

  /// CampDropDown
  static final List<String> campDropdownItems = [
    'LTC',
    'BPC',
  ];
  String campDropdown = campDropdownItems[0];
  int campChartNo = 0;

  void campDropDownUpdate(String value) {
    campDropdown = value;
    campChartNo = campDropdownItems.indexOf(value);

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

  void dateDropDownUpdate(String value) {
    dateDropdown = value;
    dateChartNo = dateDropdownItems.indexOf(value);
    notifyListeners();
  }

  racFormURLPush() async {
    const url = "https://mtrac.ado.sg/login";
    if (await canLaunch(url)) {
      launch(url, enableJavaScript: true);
    } else {
      throw "Could not launch $url";
    }
  }

  safeEntryURLPush() async {
    const url =
        "https://docs.google.com/forms/d/e/1FAIpQLSfOG1IHwj2B9zXGpRrpjdb5quiKBEmhyUF3-QvhQdS0o2C60Q/viewform";
    if (await canLaunch(url)) {
      launch(url, forceWebView: true, enableJavaScript: true);
    } else {
      throw "Error launching $url";
    }
  }

  shroFormURLPush() async {
    const url =
        "https://docs.google.com/forms/d/e/1FAIpQLSdaPpHhO8dO2qnyLonsLO41b1eTDfZdkwzmBksOQKbLNrgcTg/viewform";
    if (await canLaunch(url)) {
      launch(url, forceWebView: true, enableJavaScript: true);
    } else {
      throw "Error launching $url";
    }
  }


}
