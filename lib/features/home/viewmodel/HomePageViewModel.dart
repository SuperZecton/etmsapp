import 'package:flutter/cupertino.dart';
import 'package:ltcapp/features/home/view/pages/HomePage.dart';
import 'package:provider/provider.dart';

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



}
