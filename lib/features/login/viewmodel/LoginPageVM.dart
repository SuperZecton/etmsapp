import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/features/login/view/widgets/LoadingIndicator.dart';
import 'package:ltcapp/newdbutils/database_connector.dart';

class LoginPageViewModel extends ChangeNotifier {
  String get user => usernameController.text;
  String get password => passwordController.text;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  DatabaseHandler db = DatabaseHandler();

  Future verifyLoginData(BuildContext context, bool loginCreds) async {
    loginCreds = await db.verifyLoginCreds(user, password);
    LoginPageViewModel().onLoading(context);
    await new Future.delayed(
      const Duration(seconds: 2),
    );
    if (loginCreds == true) {
      Navigator.pushNamed(context, '/home');
      //    print((await personnelDBHandle.getFullRowFromEmail(email)).toString());
    }
  }


  void onLoading(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              height: 200,
              width: 200,
              padding: EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LoadingIndicator(),
                  Text("Loading..",
                      style: GoogleFonts.roboto(
                          color: Colors.black, fontSize: 24.0))
                ],
              ),
            ),
          );
        });
  }

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }
}
