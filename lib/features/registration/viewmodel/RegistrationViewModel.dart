import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ltcapp/features/registration/model/individual_identity.dart';
import 'package:ltcapp/main.dart';
import 'package:ltcapp/newdbutils/database_connector.dart';
import 'package:stacked/stacked.dart';

class RegistrationViewModel extends BaseViewModel {
  ///DB Instance initialized here
  DatabaseHandler db = DatabaseHandler();

  ///Sign Up Page Controllers
  final signUpFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final nricController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();
  final numberController = TextEditingController();
  final homeNumberController = TextEditingController();

  final drugAllergyController = TextEditingController();
  final foodAllergyController = TextEditingController();
  final nokController = TextEditingController(); // full name
  final nokAddressController = TextEditingController();
  final nokNumberController = TextEditingController();

  final medicalConditionController = TextEditingController();
  final doeController = TextEditingController();
  final dobController = TextEditingController();
  final ordController = TextEditingController();
  final dopController = TextEditingController();

  ///Sign up Page Dropdown Values -> Default Values
  PESType currentPESValue = PESType.A;
  RaceType currentRaceValue = RaceType.Chinese;
  ReligionType currentReligionValue = ReligionType.Christianity;
  BloodType currentBloodValue = BloodType.O_MINUS;
  VocationType currentVocationValue = VocationType.STO;

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
    if (signUpFormKey.currentState!.validate()) {
      signUpFormKey.currentState!.save();
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
/*
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
