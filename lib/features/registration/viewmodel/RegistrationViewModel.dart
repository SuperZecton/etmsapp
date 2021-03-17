import 'package:flutter/cupertino.dart';
import 'package:ltcapp/utils/individual_identity.dart';

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
}
