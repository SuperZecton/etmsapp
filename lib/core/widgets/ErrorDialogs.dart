
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/core/config/Globals.dart';

class ErrorDialogs {
  static void functionMissingDialog(BuildContext context){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Function Not Available Yet"),
        );
      },
    );
  }

  static void normalAlertDialog(BuildContext context, String title, String subtitle) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
          contentPadding: EdgeInsets.all(10.0),
          title: Text(
            title,
            style: GoogleFonts.roboto(
              color: darkTextColor,
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          content: Container(
            padding: EdgeInsets.symmetric(horizontal:15, vertical: 10),
            margin: EdgeInsets.all(2.0),
            child: Text(
              subtitle,
              style: GoogleFonts.roboto(
                color: darkTextColor,
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text("OK", style: GoogleFonts.roboto(
                color: Colors.blueAccent,
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
              ),),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}