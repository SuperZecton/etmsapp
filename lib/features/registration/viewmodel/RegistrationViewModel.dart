import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ltcapp/utils/individual_identity.dart';
import 'package:ltcapp/main.dart';

class RegistrationViewModel with ChangeNotifier {
  ///Sign Up Page Controllers

  final signUpFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final nricController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();
  final numberController = TextEditingController();
  final homeNumberController = TextEditingController();

  final drugAllergyController = TextEditingController();
  final foodAllergyController = TextEditingController();
  final nokController = TextEditingController();
  final nokAddressController = TextEditingController();
  final nokNumberController = TextEditingController();

  final medicalConditionController = TextEditingController();
  final doeController = TextEditingController();
  final dobController = TextEditingController();
  final ordController = TextEditingController();
  final dopController = TextEditingController();

  ///Sign up Page Dropdown Values
  PESType currentPESValue;
  RaceType currentRaceValue;
  ReligionType currentReligionValue;
  BloodType currentBloodValue;
  VocationType currentVocationValue;

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

  signUpValidation(BuildContext context) {
    if (signUpFormKey.currentState.validate()) {
      signUpFormKey.currentState.save();
      fDSTemp.sortPersonalData(
        nameController.text,
        nricController.text,
        addressController.text,
        numberController.text,
        homeNumberController.text,
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
        "Stay In",
        medicalConditionController.text,
      );
      fDSTemp.sortLoginData(emailController.text, passwordController.text);
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
    if (trainingRegFormKey.currentState.validate()) {
      trainingRegFormKey.currentState.save();
      fDSTemp.sortTrainingData(
        trgFrameController.text,
        trgPeriodController.text,
        int.parse(noAttemptsController.text),
        militaryLicenseController.text,
        militaryLicenseTypeController.text,
        doiController.text,
      );
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

  educationSignUpValidation(BuildContext context) {
    if (educationRegFormKey.currentState.validate()) {
      educationRegFormKey.currentState.save();
      fDSTemp.sortEducationData(
          educationLevelController.text,
          streamCourseController.text,
          ccaController.text,
          schoolController.text
      );
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
  final civilianLicenseController = TextEditingController();
  final civilianLicenseNoController = TextEditingController();
  final civilianLicenseDOIController = TextEditingController();
  final personalVehicleController = TextEditingController();

  otherSignUpValidation(BuildContext context) {
    if (otherRegFormKey.currentState.validate()) {
      otherRegFormKey.currentState.save();
      fDSTemp.sortMiscData(
          hobbiesController.text,
          civilianLicenseController.text,
          civilianLicenseNoController.text,
          civilianLicenseDOIController.text,
          "No",
          personalVehicleController.text,
          "Unknown",
          "M",
          50,
          50,
          9);
      personnelDBHandle.insertNewRow(fDSTemp);
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
