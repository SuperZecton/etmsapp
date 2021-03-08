import 'package:flutter/material.dart';
import 'package:ltcapp/features/bibo/view/pages/BookInOutPage.dart';
import 'package:ltcapp/features/home/view/pages/HomePage.dart';
import 'package:ltcapp/features/login/view/pages/LoginPage.dart';
import 'package:ltcapp/features/login/view/pages/WelcomePage.dart';

import 'package:ltcapp/features/registration/view/pages/EducationRegPage.dart';
import 'package:ltcapp/features/registration/view/pages/OtherInfoRegPage.dart';
import 'package:ltcapp/features/registration/view/pages/SignupPage.dart';
import 'package:ltcapp/features/registration/view/pages/TrainingRegPage.dart';
import 'package:ltcapp/features/vehiclebookout/view/pages/VehicleBookOutPage.dart';

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
