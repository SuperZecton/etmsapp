
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

class CheckInOutViewModel extends BaseViewModel {

  static String _formattedTime = DateFormat("jm").format(DateTime.now().toLocal());
  String get formattedTime => _formattedTime;
  static final List<String> chartDropdownItems = [
    'Book In',
    'Book Out',
  ];

  static String actualDropdown = chartDropdownItems[0];
  static int actualChart = 0;

}