import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/core/widgets/LoadingIndicator.dart';

class LoginFailDialog {
  static void loginFailDailog(BuildContext context) {
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
