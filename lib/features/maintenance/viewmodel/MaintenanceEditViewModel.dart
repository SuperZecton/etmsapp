import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ltcapp/core/services/CurrentSession.dart';
import 'package:ltcapp/core/services/DatabaseConnector.dart';
import 'package:ltcapp/core/services/TelebotConnector.dart';
import 'package:ltcapp/core/widgets/ErrorDialogs.dart';
import 'package:stacked/stacked.dart';

class MaintenanceEditViewModel extends BaseViewModel {
  DatabaseHandler db = DatabaseHandler();
  void initialise() async {
    _totalVehicles = await getAllVehicles();
    notifyListeners();
  }

  String? _currentVehicleNo;
  String? get currentVehicleNo => _currentVehicleNo;

  List<String?> _totalVehicles = [""];
  List<String?> get totalVehicles => _totalVehicles;

  TextEditingController _aviDate = TextEditingController();
  TextEditingController _civiPlate = TextEditingController();
  TextEditingController get aviDate => _aviDate;
  TextEditingController get civiPlate => _civiPlate;

  List<String> _vehicleHolding = [
    "In BPC",
    "In LTC",
    "VOR",
    "T-Loaned",
    "Attached out"
  ];
  List<String?> get vehicleHolding => _vehicleHolding;
  String? _currentVehicleHolding;
  String? get currentVehicleHolding => _currentVehicleHolding;

  Future<List<String?>> getAllVehicles() async {
    List<List<String>> _fullList = await db.getAllVehicles();

    List<String?> _vehicleNumberList = _fullList.map((s) => s[1]).toList();
    return _vehicleNumberList;
  }

  void vehicleOnChanged(String value) {
    _currentVehicleNo = value;
    notifyListeners();
  }

  void vehicleHoldingOnChanged(String value) {
    _currentVehicleHolding = value;
    notifyListeners();
  }

  void submitPush(BuildContext context) async {
    if (_currentVehicleNo != null) {
      if (_aviDate.text.isNotEmpty) {
        db.changeAVIDate(_currentVehicleNo!);
      }
      if (_currentVehicleHolding.toString().isNotEmpty &&
          _currentVehicleHolding != null) {
        db.editSingleDataEntry("Vehicles", "vehicleNo", _currentVehicleNo!,
            "status", _currentVehicleHolding.toString());
      }

      ///
      db.editSingleDataEntry("Vehicles", "vehicleNo", _currentVehicleNo!,
          "additionalPlate", _civiPlate.text);
      Navigator.pushNamed(context, '/maintenanceMain');
    } else {
      ErrorDialogs.normalAlertDialog(
          context, "Missing Fields", "Vehicle No. is required");
    }
  }

  ///Date picker logic
  String selectedDate = "";
  Future<void> selectDate(
      BuildContext context, TextEditingController controller) async {
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
