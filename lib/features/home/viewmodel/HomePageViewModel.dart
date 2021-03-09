import 'package:flutter/cupertino.dart';
import 'package:ltcapp/features/home/view/pages/HomePage.dart';
import 'package:provider/provider.dart';

class HomePageViewModel extends ChangeNotifier {
  //TODO

  static final List<String> campDropdownItems = [
    'LTC',
    'BPC',
  ];
  String campDropdown = campDropdownItems[0];
  int campChartNo = 0;

  void campDropdownUpdate(String value) {
    campDropdown = value;
    campChartNo = campDropdownItems.indexOf(value);

    notifyListeners();
  }
}
