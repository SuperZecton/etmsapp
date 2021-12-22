import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/features/login/view/widgets/LoadingIndicator.dart';
import 'package:ltcapp/newdbutils/database_connector.dart';
import 'package:ltcapp/features/login/model/CurrentSession.dart';
import 'package:ltcapp/core/config/globals.dart';
class LoginPageViewModel extends ChangeNotifier {
  DatabaseHandler db = DatabaseHandler();
  static String rememberedUsername = "damonlim";
  static String rememberedPassword = "pass1234";
  final usernameController = TextEditingController(text: rememberedUsername);
  final passwordController = TextEditingController(text: rememberedPassword);

  String get user => usernameController.text;
  String get password => passwordController.text;
/*
  Future verifyLoginData(BuildContext context) async {
    bool loginCredentials;
    loginCredentials = await db.verifyLoginCreds(user, password);
    if (loginCredentials == true) {
      /// Sets global user
      CurrentUser.instance.username = user;
      CurrentUser.instance.password = password;
      /// Redirects user to home page
      Navigator.pushNamed(context, '/home');
    } else {
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return Dialog(
              child: Container(
                height: 200,
                width: 200,
                padding: EdgeInsets.all(40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Login Failed!",
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 24.0,
                      ),
                    ),
                    Text(
                      "Please check your username/password again!",
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
    }
  }
*/
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
