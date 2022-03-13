import 'package:flutter/cupertino.dart';
import 'package:ltcapp/core/services/CurrentSession.dart';
import 'package:ltcapp/core/services/DatabaseConnector.dart';
import 'package:ltcapp/features/home/view/pages/HomePage.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class MileageViewModel extends MultipleFutureViewModel {
  DatabaseHandler db = DatabaseHandler();
  //Input all the mileage getters and setters here
  //Database linkers will be in model folder
  static const String _MileageListDelayedFuture = "mileage";
  static const String _BonusDelayedFuture = "bonus";
  List<List<String>> get fetchedMileageList => dataMap![_MileageListDelayedFuture];
  List<dynamic> get fetchedBonus => dataMap![_BonusDelayedFuture];
  bool get fetchingMileageList => busy(_MileageListDelayedFuture);
  bool get fetchingBonusList => busy(_BonusDelayedFuture);

  @override
  Map<String, Future Function()> get futuresMap => {
    _MileageListDelayedFuture: getDataListFromDB,
    _BonusDelayedFuture: getBonusData,
  };



  ///Gets data needed for bonus calculations, including total class 3 and 4 mileages
  ///0:class3  1:class4  2:total  3:decimal  4:percentage  5:tillnextbonus
  Future<List<dynamic>> getBonusData() async {
    List<dynamic> _returnList = [];
    String? _username = CurrentUser.instance.username;
    if (_username != null) {
      String _class3 = await db.singleDataPull(
          "Users", "username", _username, "totalClass3Mileage");
      String _class4 = await db.singleDataPull(
          "Users", "username", _username, "totalClass4Mileage");
      int _class3Int = int.parse(_class3);
      int _class4Int = int.parse(_class4);
      int _totalInt = _class3Int + _class4Int;
      String _total = _totalInt.toString();
      ///To account for any bonuses already taken
      int _remainder = _totalInt % 3000;
      double _bonusDecimal = _remainder / 3000;
      double _math = _bonusDecimal * 100;
      int _bonusPercentage = _math.floor();
      int _leftTillBonusInt = 3000 - _remainder ;
      String _leftTillBonus = _leftTillBonusInt.toString();
      _returnList.addAll([_class3, _class4, _total, _bonusDecimal, _bonusPercentage, _leftTillBonus]);
      return _returnList;
    } else {
      print("Username not found in getBonusData()");
      return Future.error("Username not found");
    }

  }
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
