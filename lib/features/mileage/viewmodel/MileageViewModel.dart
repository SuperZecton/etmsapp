import 'package:flutter/cupertino.dart';
import 'package:ltcapp/core/services/CurrentSession.dart';
import 'package:ltcapp/core/services/DatabaseConnector.dart';
import 'package:ltcapp/features/home/view/pages/HomePage.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class MileageViewModel extends FutureViewModel {
  //Input all the mileage getters and setters here
  //Database linkers will be in model folder
  @override
  Future<List<List<String>>> futureToRun() => getDataListFromDB();

  Future<dynamic> initialise() async {
    String? _username = CurrentUser.instance.username;
    if (_username != null) {
      String _class3 = await db.singleDataPull(
          "Users", "username", _username, "totalClass3Mileage");
      String _class4 = await db.singleDataPull(
          "Users", "username", _username, "totalClass4Mileage");
      class3Int = int.parse(_class3);
      class4Int = int.parse(_class4);
      _mileageList = await getDataListFromDB();
    }
  }

  static List<List<String>> _mileageList = [[]];
  List<List<String>> mileageList = _mileageList;
  MileageViewModel() {
    int _localMileage = class3Int + class4Int;
    _totalMileage = _localMileage;
    _bonusDecimal = _totalMileage / 3000;
    double _math = _bonusDecimal * 100;
    _bonusPercentage = _math.floor();
    print(
        "decimal $_bonusDecimal and percent $_bonusPercentage and class 3 is $class3Int");
  }

  static int class3Int = 0;
  static int class4Int = 0;
  static double _bonusDecimal = 0.0;
  double get bonusDecimal => _bonusDecimal;
  static int _bonusPercentage = 0;
  int get bonusPercentage => _bonusPercentage;
  DatabaseHandler db = DatabaseHandler();
  static int _totalMileage = 0;
  int get totalMileage => _totalMileage;
  Future<List<List<String>>> getDataListFromDB() async {
    List<List<String>> _returnList = [];
    String? _username = CurrentUser.instance.username;
    if (_username != null) {
      List<List<dynamic>> _dynList = await db.getMileageHistory(_username);
      for (int i = 0; i < _dynList.length; i++) {
        List<String> _individualList =
            _dynList[i].map((s) => s as String).toList();
        _returnList.add(_individualList);
      }
      print("This is the results from getDataListFromDB >> $_returnList");
      return _returnList;
    } else {
      print("Can't get DatabaseList from DB");
      return Future.error("error");
    }
  }

  String _currentMonth = DateTime.now().month.toString();
  String get currentMonth => _currentMonth;
  String _currentYear = DateTime.now().year.toString();
  String get currentYear => _currentYear;

  DateTime? _selectedDate;
  DateTime? get selectedDate => _selectedDate;
  static final initialDate = DateTime.now();
  void floatingButtonPress(BuildContext context) {
    showMonthPicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 1, 5),
      lastDate: DateTime(DateTime.now().year + 1, 9),
      initialDate: selectedDate ?? initialDate,
      locale: Locale("en"),
    ).then((date) {
      if (date != null) {
        _selectedDate = date;
        _currentMonth = date.month.toString();
        _currentYear = date.year.toString();
        notifyListeners();
      }
    });
  }
}
