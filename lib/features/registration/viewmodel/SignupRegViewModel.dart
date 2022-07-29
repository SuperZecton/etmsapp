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
  final _confirmPasswordController = TextEditingController();
  final _numberController = TextEditingController();
  final _class3MileageController = TextEditingController();
  final _class4MileageController = TextEditingController();

  final _doeController = TextEditingController();
  final _ordController = TextEditingController();
  final _dopController = TextEditingController();

  GlobalKey get signUpFormKey => _signUpFormKey;
  TextEditingController get nameController => _nameController;
  TextEditingController get usernameController => _usernameController;
  TextEditingController get nricController => _nricController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;
  TextEditingController get numberController => _numberController;
  TextEditingController get doeController => _doeController;
  TextEditingController get ordController => _ordController;
  TextEditingController get dopController => _dopController;
  TextEditingController get class3MileageController => _class3MileageController;
  TextEditingController get class4MileageController => _class4MileageController;

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

  String? confirmPasswordValidation(String? input) {
    if (_passwordController.text.isNotEmpty) {
      if (input == _passwordController.text) {
        return null;
      } else {
        return "Passwords do not match";
      }
    } else {
      return "Please fill out password first!";
    }
  }

  /// ADD NULL CHECKS HERE
  signUpValidation(BuildContext context) {
    if (_signUpFormKey.currentState!.validate() && _usernameController.text.isNotEmpty && _nricController.text.isNotEmpty) {
      if (_passwordController.text == _confirmPasswordController.text) {
        _signUpFormKey.currentState!.save();
        RegistrationService.instance.currentRankValue =
            currentRankValue.toString();
        RegistrationService.instance.name = _nameController.text;
        RegistrationService.instance.username = _usernameController.text;
        RegistrationService.instance.nric = _nricController.text;
        RegistrationService.instance.password = _passwordController.text;
        RegistrationService.instance.number = _numberController.text;
        RegistrationService.instance.email = _emailController.text;
        RegistrationService.instance.doe = _doeController.text;
        RegistrationService.instance.ord = _ordController.text;
        RegistrationService.instance.dop = _dopController.text;
        RegistrationService.instance.currentPESValue =
            currentPESValue.toString();
        RegistrationService.instance.currentVocationValue =
            currentVocationValue.toString();
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
            _class3MileageController.text, //class 3 mileage
            _class4MileageController.text, //class 4 mileage
            '',
            'false',
            'false',
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
                      Text('Passwords do not match'),
                    ],
                  ),
                ),
              );
            });
      }
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
