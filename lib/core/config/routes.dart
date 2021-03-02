import 'package:flutter/material.dart';
import 'package:ltcapp/features/bibo/view/pages/bookInOutPage.dart';
import 'package:ltcapp/features/home/view/pages/homePage.dart';
import 'package:ltcapp/features/login/view/pages/loginPage.dart';
import 'package:ltcapp/features/login/view/pages/welcomePage.dart';

import 'package:ltcapp/features/registration/view/pages/educationRegPage.dart';
import 'package:ltcapp/features/registration/view/pages/otherInfoRegPage.dart';
import 'package:ltcapp/features/registration/view/pages/signupPage.dart';
import 'package:ltcapp/features/registration/view/pages/trainingRegPage.dart';
import 'package:ltcapp/features/vehiclebookout/view/pages/vehicleBookOutPage.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  '/': (BuildContext context) => WelcomePage(),
  '/login': (BuildContext context) => LoginPage(),
  '/signup': (BuildContext context) => SignUpPage(),
  '/home': (BuildContext context) => HomePage(),
  '/trgreg': (BuildContext context) => TrainingRegistrationPage(),
  '/edureg': (BuildContext context) => EducationRegistrationPage(),
  '/othrreg': (BuildContext context) => OtherInfoRegistrationPage(),
  '/bookinout': (BuildContext context) => BookInOutPage(),
  '/vehiclebookout': (BuildContext context) => VehicleBookOutPage(),
};
