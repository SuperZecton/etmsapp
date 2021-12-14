import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ltcapp/features/registration/model/individual_identity.dart';
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
