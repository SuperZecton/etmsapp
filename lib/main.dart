import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:ltcapp/utils/database_linker.dart';
import 'package:ltcapp/core/config/routes.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LTC App',
      initialRoute: '/',
      routes: routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

