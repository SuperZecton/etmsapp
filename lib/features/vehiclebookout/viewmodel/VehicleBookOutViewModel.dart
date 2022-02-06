

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class VehicleBookOutViewModel extends BaseViewModel {
  ///Drop Down Fields, get from kouhai damon
  TextEditingController _vehicleNumber = TextEditingController();
  TextEditingController _vehType = TextEditingController();

  ///Text Editing Controller default
  TextEditingController _startingOdometer = TextEditingController();
  TextEditingController _purposeOfTrip = TextEditingController();

  ///Automated get from DateTime.now()
  TextEditingController _timeStarted = TextEditingController();




}