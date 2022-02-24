
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ltcapp/core/services/CurrentSession.dart';
import 'package:ltcapp/core/services/DatabaseConnector.dart';
import 'package:ltcapp/core/services/TelebotConnector.dart';
import 'package:ltcapp/core/widgets/ErrorDialogs.dart';
import 'package:stacked/stacked.dart';

class MaintenanceReportViewModel extends BaseViewModel {
  TextEditingController _vehicleNo = TextEditingController();
  TextEditingController _date = TextEditingController();
  TextEditingController _time = TextEditingController();
  TextEditingController _report = TextEditingController();
  TextEditingController get vehicleNo => _vehicleNo;
  TextEditingController get date => _date;
  TextEditingController get time => _time;
  TextEditingController get report => _report;

  List<String> _reportType = [
    "Reversing without care",
    "Grazing",
    "Failure to give way",
    "Rear Ended",
    "Poor judgment",
    "Near miss",
    "Head on collision",
    "Speeding",
    "Dozing off",
  ];
  List<String?> get reportType => _reportType;
  String? _currentReportType;
  String? get currentReportType => _currentReportType;

  void reportTypeOnChanged(String value) {
    _currentReportType = value;
    notifyListeners();
  }

  DatabaseHandler db = DatabaseHandler();
  TelebotConnector tele = TelebotConnector();
  void submitPush(BuildContext context) async {
    String? _username = CurrentUser.instance.username;
    if (_vehicleNo.text.isNotEmpty &&
        _date.text.isNotEmpty &&
        _time.text.isNotEmpty &&
        _currentReportType != null &&
        _username != null) {
      String _fullName =
          await db.singleDataPull("Users", "username", _username, "fullName");
      db.createIncidentReport(_username, _vehicleNo.text, _date.text,
          _time.text, _currentReportType.toString(), _report.text);
      tele.sendIncidentReport(_fullName, _vehicleNo.text, _date.text,
          _time.text, _currentReportType.toString(), _report.text);
      Navigator.pushNamed(context,"/afterLogin");
    } else {
      ErrorDialogs.normalAlertDialog(
          context, "Missing Fields", "Please fill out all required fields");
    }
  }



  String selectedDate = "";

  Future<void> selectDate(BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != DateTime.now()) {
      selectedDate = DateFormat.yMd("en_US").format(picked);
      controller.text = selectedDate;
      notifyListeners();
    }
  }


}
