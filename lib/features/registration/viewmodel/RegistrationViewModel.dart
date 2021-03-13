
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
  StayInStayOutType currentStayInStayOutValue;

}
