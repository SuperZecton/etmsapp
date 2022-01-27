import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/core/widgets/LoadingIndicator.dart';

class LoginLoadingDialog {
  static void loginLoadingDialog(BuildContext context){
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

}

