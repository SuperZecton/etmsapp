import 'package:flutter/material.dart';
import 'package:ltcapp/features/bibo/presentation/pages/bookInOutPage.dart';
import 'package:ltcapp/features/home/presentation/pages/homePage.dart';
import 'package:ltcapp/features/login/presentation/pages/loginPage.dart';
import 'package:ltcapp/features/login/presentation/pages/welcomePage.dart';

import 'package:ltcapp/features/registration/presentation/pages/educationRegPage.dart';
import 'package:ltcapp/features/registration/presentation/pages/otherInfoRegPage.dart';
import 'package:ltcapp/features/registration/presentation/pages/signupPage.dart';
import 'package:ltcapp/features/registration/presentation/pages/trainingRegPage.dart';



final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  '/': (BuildContext context) => WelcomePage(),
  '/login': (BuildContext context) => LoginPage(),
  '/signup': (BuildContext context) => SignUpPage(),
  '/home': (BuildContext context) => HomePage(),
  '/trgreg': (BuildContext context) => TrainingRegistrationPage(),
  '/edureg': (BuildContext context) => EducationRegistrationPage(),
  '/othrreg': (BuildContext context) => OtherInfoRegistrationPage(),
  '/bookinout': (BuildContext context) => BookInOutPage(),


};