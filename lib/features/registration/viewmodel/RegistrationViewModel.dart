import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ltcapp/features/registration/model/individual_identity.dart';
import 'package:ltcapp/main.dart';
import 'package:ltcapp/core/services/DatabaseConnector.dart';
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
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get addressController => _addressController;
  TextEditingController get numberController => _numberController;
  TextEditingController get homeNumberController => _homeNumberController;
  TextEditingController get drugAllergyController => _drugAllergyController;
  TextEditingController get foodAllergyController => _foodAllergyController;
  TextEditingController get nokController => _nokController;
  TextEditingController get nokAddressController => _nokAddressController;
  TextEditingController get nokNumberController => _nokNumberController;
  TextEditingController get medicalConditionController =>
      _medicalConditionController;
  TextEditingController get doeController => _doeController;
  TextEditingController get dobController => _dobController;
  TextEditingController get ordController => _ordController;
  TextEditingController get dopController => _dopController;

  ///Sign up Page Dropdown Values -> Default Values
  RankType? currentRankValue;
  PESType? currentPESValue;
  RaceType? currentRaceValue;
  ReligionType? currentReligionValue;
  BloodType? currentBloodValue;
  VocationType? currentVocationValue;

  ///Sign up Page Dropdown Functions
  void rankDropDownOnChanged(RankType value) {
    currentRankValue = value;
    notifyListeners();
  }

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
      print(
          "Username is ${_usernameController.text}, Password is ${_passwordController.text}, Rank is ${currentRankValue.toString()}, PES is ${currentPESValue.toString()} ");

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
      print(
          "Username is ${_usernameController.text}, Password is ${_passwordController.text}, Rank is ${currentRankValue.toString()}, PES is ${currentPESValue.toString()} ");
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
  final _educationRegFormKey = GlobalKey<FormState>();
  final _educationLevelController = TextEditingController();
  final _streamCourseController = TextEditingController();
  final _ccaController = TextEditingController();
  final _schoolController = TextEditingController();

  GlobalKey get educationRegFormKey => _educationRegFormKey;
  TextEditingController get educationLevelController =>
      _educationLevelController;
  TextEditingController get streamCourseController => _streamCourseController;
  TextEditingController get ccaController => _ccaController;
  TextEditingController get schoolController => _schoolController;

  void educationSignUpValidation(BuildContext context) {
    if (_educationRegFormKey.currentState!.validate()) {
      _educationRegFormKey.currentState!.save();
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

      ///Last page -> Create user
      db.createUserAccount(
          currentRankValue.toString(),
          _nameController.text,
          _nricController.text,
          _addressController.text,
          _numberController.text,
          _homeNumberController.text,
          _emailController.text,
          _dobController.text,
          _doeController.text,
          _ordController.text,
          _dopController.text,
          currentPESValue.toString(),
          currentReligionValue.toString(),
          currentRaceValue.toString(),
          currentBloodValue.toString(),
          _drugAllergyController.text,
          _foodAllergyController.text,
          _nokController.text,
          _nokNumberController.text,
          _nokAddressController.text,
          currentVocationValue.toString(),
          'Stay-In',
          _medicalConditionController.text,
          _trgFrameController.text,
          _trgPeriodController.text,
          _noAttemptsController.text,
          _militaryLicenseController.text,
          _militaryLicenseTypeController.text,
          _doiController.text,
          'Not Started',
          'CAT D',
          _educationLevelController.text,
          _streamCourseController.text,
          _ccaController.text,
          _schoolController.text,
          _hobbiesController.text,
          _civilianLicenseController.text,
          _civilianLicenseNoController.text,
          _civilianLicenseDOIController.text,
          'No',
          personalVehicleController.text,
          '',
          '',
          '',
          '',
          '',
          _usernameController.text,
          _passwordController.text,
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
