import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ltcapp/features/home/viewmodel/HomePageViewModel.dart';
import 'package:ltcapp/features/login/model/CurrentSession.dart';
import 'package:ltcapp/features/login/viewmodel/LoginPageVM.dart';
import 'package:ltcapp/features/mileage/viewmodel/MileageViewModel.dart';
import 'package:ltcapp/features/registration/viewmodel/RegistrationViewModel.dart';
import 'package:ltcapp/features/vehiclebookout/viewmodel/VehicleBookOutViewModel.dart';
import 'package:sqljocky5/sqljocky.dart';
import 'package:ltcapp/newdbutils/database_connector.dart';
import 'package:provider/provider.dart';
import 'package:ltcapp/core/config/router.dart';

import 'core/services/permissions.dart';

//void main() => runApp(MyApp());

DatabaseHandler personnelDBHandle = new DatabaseHandler();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /*await personnelDBHandle.setDBInitParams(
      "main_personnel.db", "LtcPersonnelInfo", "ltcapp", "LTC_PERSONNEL_INFO");
  await personnelDBHandle.databaseCreationOptimizer();*/
  ///Debugging nonsense
  /*var tof =
      await personnelDBHandle.verifyLoginCreds("dlze2001@gmail.com", "nicetry");
  print(tof);*/
  Permissions lol = Permissions();
  var testPermissions = await lol.getPermissionLevel("damonlim");
  print(testPermissions);
  var notquitenow = DateTime.now();
  var now = DateTime.parse(notquitenow.toString()+'-08:00');
  var date = now.day.toString().padLeft(2, '0') + "/" + now.month.toString().padLeft(2, '0') + "/" + now.year.toString();
  print(date);
  var time = now.hour.toString().padLeft(2, '0') + now.minute.toString().padLeft(2, '0') + now.second.toString().padLeft(2, '0');
  print(time);
  personnelDBHandle.findLoginEntry("android1123");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginPageViewModel>(
            create: (context) => LoginPageViewModel()),
        ChangeNotifierProvider<HomePageViewModel>(
            create: (context) => HomePageViewModel()),
        ChangeNotifierProvider<RegistrationViewModel>(
            create: (context) => RegistrationViewModel()),
        ChangeNotifierProvider<VehicleBookOutViewModel>(
            create: (context) => VehicleBookOutViewModel()),
        ChangeNotifierProvider<LoginPageViewModel>(
            create: (context) => LoginPageViewModel()),
        ChangeNotifierProvider<MileageViewModel>(
            create: (context) => MileageViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'LTC App',
        initialRoute: '/',
        onGenerateRoute: Routers.generateRoute,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
