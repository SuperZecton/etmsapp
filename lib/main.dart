import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ltcapp/features/home/viewmodel/HomePageViewModel.dart';
import 'package:ltcapp/features/login/viewmodel/LoginPageVM.dart';

import 'package:ltcapp/utils/database_linker.dart';
import 'package:ltcapp/core/config/routes.dart';
import 'package:provider/provider.dart';

//void main() => runApp(MyApp());

DatabaseHandler mainHandle = new DatabaseHandler(dbName: "main_personnel.db");

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  mainHandle.databaseCreation_Optimizer();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginPageViewModel>(create: (context) =>LoginPageViewModel()),
        ChangeNotifierProvider<HomePageViewModel>(create: (context) => HomePageViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'LTC App',
        initialRoute: '/',
        routes: routes,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}

