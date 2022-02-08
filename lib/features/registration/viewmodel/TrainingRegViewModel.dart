
import 'package:flutter/material.dart';
import 'package:ltcapp/features/registration/model/RegistrationService.dart';
import 'package:stacked/stacked.dart';

class TrainingRegViewModel extends BaseViewModel {
  ///Training Page Controllers
  final _trainingRegFormKey = GlobalKey<FormState>();
  final _trgFrameController = TextEditingController();
  final _trgPeriodController = TextEditingController();
  final _noAttemptsController = TextEditingController();
  final _militaryLicenseController = TextEditingController();
  final _militaryLicenseTypeController = TextEditingController();
  final _doiController = TextEditingController();

  GlobalKey get trainingRegFormKey => _trainingRegFormKey;
  TextEditingController get trgFrameController => _trgFrameController;
  TextEditingController get trgPeriodController => _trgPeriodController;
  TextEditingController get noAttemptsController => _noAttemptsController;
  TextEditingController get militaryLicenseController =>
      _militaryLicenseController;
  TextEditingController get militaryLicenseTypeController =>
      _militaryLicenseTypeController;
  TextEditingController get doiController => _doiController;

  trainingSignUpValidation(BuildContext context) {
    if (_trainingRegFormKey.currentState!.validate()) {
      _trainingRegFormKey.currentState!.save();
      RegistrationService.instance.trgFrame = _trgFrameController.text;
      RegistrationService.instance.trgPeriod = _trgPeriodController.text;
      RegistrationService.instance.noAttempts = _noAttemptsController.text;
      RegistrationService.instance.militaryLicense = militaryLicenseController.text;
      RegistrationService.instance.militaryLicenseType = _militaryLicenseTypeController.text;
      RegistrationService.instance.doi = _doiController.text;
      Navigator.pushNamed(context, '/educationReg');
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Please fill out all the required fields'),
                  ],
                ),
              ),
            );
          });
    }
  }
}