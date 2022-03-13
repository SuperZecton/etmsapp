import 'package:flutter/material.dart';
import 'package:ltcapp/features/admin/view/pages/AdminMainPage.dart';
import 'package:ltcapp/features/admin/view/pages/ParadeStatePage.dart';
import 'package:ltcapp/features/bibo/view/pages/CheckInPage.dart';
import 'package:ltcapp/features/bibo/view/pages/CheckOutPage.dart';
import 'package:ltcapp/features/bibo/view/pages/CheckStatusPage.dart';
import 'package:ltcapp/features/home/view/pages/AfterLoginPage.dart';
import 'package:ltcapp/features/home/view/pages/HomePage.dart';
import 'package:ltcapp/features/home/view/pages/SettingsPage.dart';
import 'package:ltcapp/features/login/view/pages/LoginPage.dart';
import 'package:ltcapp/features/login/view/pages/WelcomePage.dart';
import 'package:ltcapp/features/maintenance/view/pages/MaintenanceMainPage.dart';
import 'package:ltcapp/features/mileage/view/pages/MileageMainPage.dart';
import 'package:ltcapp/features/registration/view/pages/SignupPage.dart';
import 'package:ltcapp/features/vehiclebookout/view/pages/VehicleEndTripPage.dart';
import 'package:ltcapp/features/vehiclebookout/view/pages/VehicleStartTripPage.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => WelcomePage());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/afterLogin':
        return MaterialPageRoute(builder: (_) => AfterLoginPage());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/settings':
        return MaterialPageRoute(builder: (_) => SettingsPage());
      case '/signUp':
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case '/checkIn':
        return MaterialPageRoute(builder: (_) => CheckInPage());
      case '/checkOut':
        return MaterialPageRoute(builder: (_) => CheckOutPage());
      case '/checkStatus':
        return MaterialPageRoute(builder: (_) => CheckStatusPage());
      case '/vehicleStartTrip':
        return MaterialPageRoute(builder: (_) => VehicleStartTripPage());
      case '/vehicleEndTrip':
        return MaterialPageRoute(builder: (_) => VehicleEndTripPage());
      case '/mileageMain':
        return MaterialPageRoute(builder: (_) => MileageMainPage());
      case '/maintenanceMain':
        return MaterialPageRoute(builder: (_) => MaintenanceMainPage());
      case '/adminMain':
        return MaterialPageRoute(builder: (_) => AdminMainPage());
      case '/adminParadeState':
        return MaterialPageRoute(builder: (_) => ParadeStatePage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                    body: Center(
                  child: Text('No route defined for ${settings.name}'),
                )));
    }
  }
}
