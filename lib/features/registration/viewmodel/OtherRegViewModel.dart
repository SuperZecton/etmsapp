
import 'package:flutter/material.dart';
import 'package:ltcapp/core/services/DatabaseConnector.dart';
import 'package:ltcapp/features/registration/model/RegistrationService.dart';
import 'package:stacked/stacked.dart';

class OtherRegViewModel extends BaseViewModel {
  DatabaseHandler db = DatabaseHandler();
  ///Other Info Page Controllers
  final _otherRegFormKey = GlobalKey<FormState>();
  final _hobbiesController = TextEditingController();
  final _civilianLicenseController = TextEditingController(); // class 3 / 4
  final _civilianLicenseNoController = TextEditingController();
  final _civilianLicenseDOIController = TextEditingController();
  final _personalVehicleController = TextEditingController();

  GlobalKey get otherRegFormKey => _otherRegFormKey;
  TextEditingController get hobbiesController => _hobbiesController;
  TextEditingController get civilianLicenseController =>
      _civilianLicenseController;
  TextEditingController get civilianLicenseNoController =>
      _civilianLicenseNoController;
  TextEditingController get civilianLicenseDOIController =>
      _civilianLicenseDOIController;
  TextEditingController get personalVehicleController =>
      _personalVehicleController;

  otherSignUpValidation(BuildContext context) {
    if (_otherRegFormKey.currentState!.validate()) {
      _otherRegFormKey.currentState!.save();
      RegistrationService.instance.hobbies = _hobbiesController.text;
      RegistrationService.instance.civilianLicense = _civilianLicenseController.text;
      RegistrationService.instance.civilianLicenseNo = _civilianLicenseNoController.text;
      RegistrationService.instance.civilianLicenseDOI = _civilianLicenseDOIController.text;
      RegistrationService.instance.personalVehicle = _personalVehicleController.text;
      ///Last page -> Create user
      db.createUserAccount(
          RegistrationService.instance.currentRankValue!,
          RegistrationService.instance.name!,
          RegistrationService.instance.nric!,
          RegistrationService.instance.number!,
          RegistrationService.instance.email!,
          RegistrationService.instance.doe!,
          RegistrationService.instance.ord!,
          RegistrationService.instance.dop!,
          RegistrationService.instance.currentPESValue!,
          RegistrationService.instance.currentVocationValue!,
          'Stay-In',
          'CAT D',
          RegistrationService.instance.username!,
          RegistrationService.instance.password!,
          '0',
          '0',
          '0',
          '0',
          '0',
          '0',
          '');
      print("Registration successful");

      Navigator.pushNamed(context, '/');
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