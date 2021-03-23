import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ltcapp/features/home/viewmodel/HomePageViewModel.dart';
import 'package:ltcapp/features/login/viewmodel/LoginPageVM.dart';
import 'package:ltcapp/features/login/viewmodel/authentication.dart';
import 'package:ltcapp/features/registration/viewmodel/RegistrationViewModel.dart';
import 'package:ltcapp/features/vehiclebookout/viewmodel/VehicleBookOutViewModel.dart';

import 'package:ltcapp/utils/database_linker.dart';
import 'package:ltcapp/utils/individual_identity.dart';
import 'package:ltcapp/utils/personnel_database_linker.dart';

import 'package:provider/provider.dart';
import 'package:ltcapp/core/config/router.dart';

//void main() => runApp(MyApp());

PersonnelDatabaseHandler personnelDBHandle = new PersonnelDatabaseHandler();
FullDetailSet fDSTemp;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await personnelDBHandle.setDBInitParams(
      "main_personnel.db", "LtcPersonnelInfo");
  await personnelDBHandle.databaseCreationOptimizer();
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
        ChangeNotifierProvider<Authentication>(
            create: (context) => Authentication()),
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
