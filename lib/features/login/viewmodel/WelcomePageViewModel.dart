import 'package:flutter/widgets.dart';
import 'package:ltcapp/core/services/CurrentSession.dart';
import 'package:ltcapp/core/utils/database_connector.dart';
import 'package:ltcapp/features/login/model/UUIDGetter.dart';
import 'package:ltcapp/features/login/view/widgets/LoginLoadingDialog.dart';
import 'package:stacked/stacked.dart';

class WelcomePageViewModel extends BaseViewModel {
  DeviceUUID deviceID = new DeviceUUID();
  String _deviceID = CurrentUser.instance.deviceID!;
  DatabaseHandler db = DatabaseHandler();

  String? globalRememberedUser = CurrentUser.instance.rememberedUser;
  String? globalRememberedPassword = CurrentUser.instance.rememberedPassword;
  void loginPush(BuildContext context) async {
    LoginLoadingDialog.loginLoadingDialog(context);
    List<dynamic> _futureEntry = await db.findLoginEntry(_deviceID);
    print("login entry is " + _futureEntry.toString());
    List<dynamic> _localEntry;
    if (_futureEntry.isNotEmpty) {
      print("Login entry is successful");
      _localEntry = _futureEntry;
      globalRememberedUser = _localEntry[0];
      globalRememberedPassword = _localEntry[1];
      print(
          'Remembered user is $globalRememberedUser remembered pass is $globalRememberedPassword');
      Navigator.pop(context);
      Navigator.pushNamed(context, '/login');
    } else {
      print("Login entry is empty");
      _localEntry = ["", ""];
      globalRememberedUser = _localEntry[0];
      globalRememberedPassword = _localEntry[1];
      Navigator.pop(context);
      Navigator.pushNamed(context, '/login');
    }
  }
}
