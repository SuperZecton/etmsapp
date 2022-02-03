import 'package:flutter/material.dart';
import 'package:ltcapp/features/bibo/view/pages/BookInOutPage.dart';
import 'package:ltcapp/features/home/view/pages/HomePage.dart';
import 'package:ltcapp/features/login/view/pages/LoginPage.dart';
import 'package:ltcapp/features/login/view/pages/WelcomePage.dart';
import 'package:ltcapp/features/mileage/view/pages/MileageMainPage.dart';

import 'package:ltcapp/features/registration/view/pages/EducationRegPage.dart';
import 'package:ltcapp/features/registration/view/pages/OtherInfoRegPage.dart';
import 'package:ltcapp/features/registration/view/pages/SignupPage.dart';
import 'package:ltcapp/features/registration/view/pages/TrainingRegPage.dart';
import 'package:ltcapp/features/vehiclebookout/view/pages/VehicleEndTripPage.dart';
import 'package:ltcapp/features/vehiclebookout/view/pages/VehicleStartTripPage.dart';
import 'package:ltcapp/features/vehiclebookout/view/pages/VehicleBookOutPage.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => WelcomePage());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/signUp':
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case '/trainingReg':
        return MaterialPageRoute(builder: (_) => TrainingRegistrationPage());
      case '/educationReg':
        return MaterialPageRoute(builder: (_) => EducationRegistrationPage());
      case '/otherReg':
        return MaterialPageRoute(builder: (_) => OtherInfoRegistrationPage());
      case '/bookInOut':
        return MaterialPageRoute(builder: (_) => BookInOutPage());
      case '/vehicleManagement':
        return MaterialPageRoute(builder: (_) => VehicleBookOutPage());
      case '/vehicleStartTrip':
        return MaterialPageRoute(builder: (_) => VehicleStartTripPage());
      case '/vehicleEndTrip':
        return MaterialPageRoute(builder: (_) => VehicleEndTripPage());
      case '/mileageMain':
        return MaterialPageRoute(builder: (_) => MileageMainPage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                    body: Center(
                  child: Text('No route defined for ${settings.name}'),
                )));
    }
  }
}
