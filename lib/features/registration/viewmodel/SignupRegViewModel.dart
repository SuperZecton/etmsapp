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
  final _numberController = TextEditingController();

  final _doeController = TextEditingController();
  final _ordController = TextEditingController();
  final _dopController = TextEditingController();

  GlobalKey get signUpFormKey => _signUpFormKey;
  TextEditingController get nameController => _nameController;
  TextEditingController get usernameController => _usernameController;
  TextEditingController get nricController => _nricController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get numberController => _numberController;
  TextEditingController get doeController => _doeController;
  TextEditingController get ordController => _ordController;
  TextEditingController get dopController => _dopController;

  ///Sign up Page Dropdown Values -> Default Values
  RankType? currentRankValue;
  PESType? currentPESValue;
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
      RegistrationService.instance.number = _numberController.text;
      RegistrationService.instance.email = _emailController.text;
      RegistrationService.instance.doe = _doeController.text;
      RegistrationService.instance.ord = _ordController.text;
      RegistrationService.instance.dop = _dopController.text;
      RegistrationService.instance.currentPESValue = currentPESValue.toString();
      RegistrationService.instance.currentVocationValue = currentVocationValue.toString();

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
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Success"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Your account has been created'),
                  ],
                ),
              ),
            );
          });
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
