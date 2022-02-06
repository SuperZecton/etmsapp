import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ltcapp/features/registration/model/individual_identity.dart';
import 'package:ltcapp/main.dart';
import 'package:ltcapp/core/utils/database_connector.dart';
import 'package:stacked/stacked.dart';

class RegistrationViewModel extends BaseViewModel {
  ///DB Instance initialized here
  DatabaseHandler db = DatabaseHandler();

  ///Sign Up Page Controllers
  final _signUpFormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _nricController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _addressController = TextEditingController();
  final _numberController = TextEditingController();
  final _homeNumberController = TextEditingController();

  final _drugAllergyController = TextEditingController();
  final _foodAllergyController = TextEditingController();
  final _nokController = TextEditingController(); // full name
  final _nokAddressController = TextEditingController();
  final _nokNumberController = TextEditingController();

  final _medicalConditionController = TextEditingController();
  final _doeController = TextEditingController();
  final _dobController = TextEditingController();
  final _ordController = TextEditingController();
  final _dopController = TextEditingController();

  GlobalKey get signUpFormKey => _signUpFormKey;
  TextEditingController get nameController => _nameController;
  TextEditingController get usernameController => _usernameController;
  TextEditingController get nricController => _nricController;
  TextEditingController get emailController=> _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get addressController => _addressController;
  TextEditingController get numberController => _numberController;
  TextEditingController get homeNumberController => _homeNumberController;
  TextEditingController get drugAllergyController => _drugAllergyController;
  TextEditingController get foodAllergyController => _foodAllergyController;
  TextEditingController get nokController  => _nokController;
  TextEditingController get nokAddressController => _nokAddressController;
  TextEditingController get nokNumberController => _nokNumberController;
  TextEditingController get medicalConditionController => _medicalConditionController;
  TextEditingController get doeController => _doeController;
  TextEditingController get dobController => _dobController;
  TextEditingController get ordController => _ordController;
  TextEditingController get dopController => _dopController;

  ///Sign up Page Dropdown Values -> Default Values
  PESType? currentPESValue;
  RaceType? currentRaceValue;
  ReligionType? currentReligionValue;
  BloodType? currentBloodValue;
  VocationType? currentVocationValue;

  ///Sign up Page Dropdown Functions
  void pesDropDownOnChanged(PESType value) {
    currentPESValue = value;
    notifyListeners();
  }

  void raceDropDownOnChanged(RaceType value) {
    currentRaceValue = value;
    notifyListeners();
  }

  void religionDropDownOnChanged(ReligionType value) {
    currentReligionValue = value;
    notifyListeners();
  }

  void bloodDropDownOnChanged(BloodType value) {
    currentBloodValue = value;
    notifyListeners();
  }

  void vocationDropDownOnChanged(VocationType value) {
    currentVocationValue = value;
    notifyListeners();
  }

  /// ADD NULL CHECKS HERE
  signUpValidation(BuildContext context) {
    if (_signUpFormKey.currentState!.validate()) {
      _signUpFormKey.currentState!.save();

      Navigator.pushNamed(context, '/trainingReg');
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

  ///Training Page Controllers
  final trainingRegFormKey = GlobalKey<FormState>();
  final trgFrameController = TextEditingController();
  final trgPeriodController = TextEditingController();
  final noAttemptsController = TextEditingController();
  final militaryLicenseController = TextEditingController();
  final militaryLicenseTypeController = TextEditingController();
  final doiController = TextEditingController();

  trainingSignUpValidation(BuildContext context) {
    if (trainingRegFormKey.currentState!.validate()) {
      trainingRegFormKey.currentState!.save();

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

  ///Education Page Controllers
  final educationRegFormKey = GlobalKey<FormState>();
  final educationLevelController = TextEditingController();
  final streamCourseController = TextEditingController();
  final ccaController = TextEditingController();
  final schoolController = TextEditingController();

  void educationSignUpValidation(BuildContext context) {
    if (educationRegFormKey.currentState!.validate()) {
      educationRegFormKey.currentState!.save();
      Navigator.pushNamed(context, '/otherReg');
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

  ///Other Info Page Controllers
  final otherRegFormKey = GlobalKey<FormState>();

  final hobbiesController = TextEditingController();
  final civilianLicenseController = TextEditingController(); // class 3 / 4
  final civilianLicenseNoController = TextEditingController();
  final civilianLicenseDOIController = TextEditingController();
  final personalVehicleController = TextEditingController();

  otherSignUpValidation(BuildContext context) {
    if (otherRegFormKey.currentState.validate()) {
      otherRegFormKey.currentState.save();

      ///Last page -> Create user
      db.createUserAccount(
          '',
          nameController.text,
          nricController.text,
          addressController.text,
          numberController.text,
          homeNumberController.text,
          emailController.text,
          dobController.text,
          doeController.text,
          ordController.text,
          dopController.text,
          currentPESValue.toString(),
          currentReligionValue.toString(),
          currentRaceValue.toString(),
          currentBloodValue.toString(),
          drugAllergyController.text,
          foodAllergyController.text,
          nokController.text,
          nokNumberController.text,
          nokAddressController.text,
          currentVocationValue.toString(),
          '',
          medicalConditionController.text,
          trgFrameController.text,
          trgPeriodController.text,
          noAttemptsController.text,
          militaryLicenseController.text,
          militaryLicenseTypeController.text,
          doiController.text,
          '',
          '',
          educationLevelController.text,
          streamCourseController.text,
          ccaController.text,
          schoolController.text,
          hobbiesController.text,
          civilianLicenseController.text,
          civilianLicenseNoController.text,
          civilianLicenseDOIController.text,
          '',
          personalVehicleController.text,
          '',
          '',
          '',
          '',
          '',
          usernameController.text,
          passwordController.text,
          '',
          '');

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
  }*/
}
