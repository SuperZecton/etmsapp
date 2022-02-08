
import 'package:flutter/material.dart';
import 'package:ltcapp/features/registration/model/RegistrationService.dart';
import 'package:stacked/stacked.dart';

class EducationRegViewModel extends BaseViewModel {

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
      RegistrationService.instance.educationLevel = _educationLevelController.text;
      RegistrationService.instance.streamCourse = _streamCourseController.text;
      RegistrationService.instance.cca = _ccaController.text;
      RegistrationService.instance.school = _schoolController.text;
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


}