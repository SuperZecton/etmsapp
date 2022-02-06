import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/core/config/Globals.dart';
import 'package:ltcapp/core/widgets/LoadingIndicator.dart';

class HomePageDialog {
  static void startTripDeniedDialog(BuildContext context) {
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
            "Error Dialog",
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
              "Please end current trip first",
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

  static void endTripDeniedDialog(BuildContext context) {
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
            "Error Dialog",
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
              "Please start a trip before ending",
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
