import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ltcapp/features/registration/model/RegistrationService.dart';
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
      RegistrationService.instance.currentRankValue = currentRankValue.toString();
      RegistrationService.instance.name = _nameController.text;
      RegistrationService.instance.username = _usernameController.text;
      RegistrationService.instance.nric = _nricController.text;
      RegistrationService.instance.password = _passwordController.text;
      RegistrationService.instance.address = _addressController.text;
      RegistrationService.instance.number = _numberController.text;
      RegistrationService.instance.homeNumber = _homeNumberController.text;
      RegistrationService.instance.email = _emailController.text;
      RegistrationService.instance.dob = _dobController.text;
      RegistrationService.instance.doe = _doeController.text;
      RegistrationService.instance.ord = _ordController.text;
      RegistrationService.instance.dop = _dopController.text;
      RegistrationService.instance.currentPESValue = currentPESValue.toString();
      RegistrationService.instance.currentReligionValue = currentReligionValue.toString();
      RegistrationService.instance.currentRaceValue = currentRaceValue.toString();
      RegistrationService.instance.currentBloodValue = currentBloodValue.toString();
      RegistrationService.instance.drugAllergy = _drugAllergyController.text;
      RegistrationService.instance.foodAllergy = _foodAllergyController.text;
      RegistrationService.instance.nok = _nokController.text;
      RegistrationService.instance.nokNumber = _nokNumberController.text;
      RegistrationService.instance.nokAddress = _nokAddressController.text;
      RegistrationService.instance.currentVocationValue = currentVocationValue.toString();
      RegistrationService.instance.medicalCondition = _medicalConditionController.text;

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




}
