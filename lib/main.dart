import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ltcapp/features/home/viewmodel/HomePageViewModel.dart';
import 'package:ltcapp/features/login/viewmodel/LoginPageVM.dart';
import 'package:ltcapp/features/mileage/viewmodel/MileageViewModel.dart';
import 'package:ltcapp/features/registration/viewmodel/RegistrationViewModel.dart';
import 'package:ltcapp/features/vehiclebookout/viewmodel/VehicleBookOutViewModel.dart';
import 'package:sqljocky5/sqljocky.dart';
//import 'package:ltcapp/utils/database_linker.dart';
//import 'package:ltcapp/utils/individual_identity.dart';
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
