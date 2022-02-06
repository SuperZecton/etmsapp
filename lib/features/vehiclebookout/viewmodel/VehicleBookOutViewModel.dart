import 'package:flutter/material.dart';
import 'package:ltcapp/features/vehiclebookout/model/individual_vehicle.dart';
import 'package:stacked/stacked.dart';

class VehicleBookOutViewModel extends BaseViewModel {
  ///Text Editing Controller default
  TextEditingController _startingOdometer = TextEditingController();
  TextEditingController _purposeOfTrip = TextEditingController();

  ///Automated get from DateTime.now()
  TextEditingController _timeStarted = TextEditingController();

  GlobalKey _startTripKey = GlobalKey<FormState>();
  GlobalKey get startTripKey => _startTripKey;

  CarType? _currentCarTypeValue;
  CarType? get currentCarValue => _currentCarTypeValue;

  String? _currentVehicleNo;
  String? get currentVehicleNo => _currentVehicleNo;

  void carTypeDropDownOnChanged(CarType value) {
    _currentCarTypeValue = value;
    notifyListeners();
  }

  void vehicleNoDropDownOnChanged(String value) {
    _currentVehicleNo = value;
    notifyListeners();
  }

  List<String> vehicleNumbers = [""];

  /*Future<List<String>> getVehicleNumbers(CarType? carType) async {
    String? _carType = carType.toString();
    await personnelDBHandle.vehiclesBasedOnCarType(_carType);

  }*/

}
