

import 'package:flutter/cupertino.dart';
import 'package:ltcapp/features/home/view/pages/HomePage.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePageViewModel extends ChangeNotifier {
  ///TODO implement database getters here thx aaron <3
  final name = '';
  final nric = '';

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
    const url = "https://docs.google.com/forms/d/e/1FAIpQLSfOG1IHwj2B9zXGpRrpjdb5quiKBEmhyUF3-QvhQdS0o2C60Q/viewform";
    if (await canLaunch(url)) {
      launch(url, forceWebView: true, enableJavaScript: true);
    } else{
      throw "Error launching $url";
    }
  }
  shroFormURLPush() async {
    const url = "https://docs.google.com/forms/d/e/1FAIpQLSdPMik7Z8Zhy-RvmIb5Sc7rJnEbWQDt4lhbQBmoUgc3TuMuVQ/viewform";
    if (await canLaunch(url)) {
      launch(url, forceWebView: true, enableJavaScript: true);
    } else {
      throw "Error launching $url";
    }
  }
}
