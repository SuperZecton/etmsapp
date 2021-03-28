import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/features/login/view/widgets/LoadingIndicator.dart';

class LoginPageViewModel extends ChangeNotifier {
  String get email => emailController.text;
  String get password => passwordController.text;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void authenticateUserCredentials() {
    bool canLogin;
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
                children: [LoadingIndicator(), Text("Loading..", style: GoogleFonts.roboto(color: Colors.black, fontSize: 24.0))],
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
