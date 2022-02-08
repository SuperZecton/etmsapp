import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ltcapp/core/utils/locator.dart';
import 'package:ltcapp/features/home/viewmodel/HomePageViewModel.dart';
import 'package:ltcapp/core/services/CurrentSession.dart';
import 'package:ltcapp/features/login/model/UUIDGetter.dart';
import 'package:ltcapp/features/login/viewmodel/LoginPageViewModel.dart';
import 'package:ltcapp/features/mileage/viewmodel/MileageViewModel.dart';
import 'package:ltcapp/features/registration/viewmodel/RegistrationViewModel.dart';
import 'package:ltcapp/features/vehiclebookout/viewmodel/VehicleBookOutViewModel.dart';
import 'package:ltcapp/core/utils/database_connector.dart';
import 'package:provider/provider.dart';
import 'package:ltcapp/core/config/Router.dart';

import 'core/config/ThemeClass.dart';
import 'core/services/Permissions.dart';

//void main() => runApp(MyApp());

DatabaseHandler personnelDBHandle = new DatabaseHandler();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ///Debugging nonsense
  Permissions permDebug = Permissions();
  var testPermissions = await permDebug.getPermissionLevel("damonlim");
  print(testPermissions);
  personnelDBHandle.DBFunctionTemplate("damonlim");
  DeviceUUID deviceID = DeviceUUID();
  String _uuid = await deviceID.getUUID();
  print('Device ID is >> $_uuid' );
  CurrentUser.instance.deviceID = _uuid;
  /*
  var demolist = await personnelDBHandle.getMileageHistory("damonlim");
  for (int x = 0; x < demolist.length; x++){
    print("Vehicle Number: " + demolist[x][0]);
    print("Date: " + demolist[x][1]);
    print("Odometer Start: " + demolist[x][2]);
    print("Odometer End: " + demolist[x][3]);
    print("Mileage: " + demolist[x][4]);
  }
  */
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'LTC App',
        initialRoute: '/',
        onGenerateRoute: Routers.generateRoute,
        theme: ThemeClass.darkTheme,
      );

  }
}
