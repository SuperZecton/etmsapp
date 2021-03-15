import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/core/config/globals.dart';

class VehicleBookOutCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 175,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        elevation: 10,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Vehicle: ',
                        style: GoogleFonts.montserrat(fontSize: 20),
                      )),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Odometer:',
                        style: GoogleFonts.montserrat(fontSize: 20),
                      )),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Time started:',
                        style: GoogleFonts.montserrat(fontSize: 20),
                      )),
                ],
              ),
            ),
            /* ButtonBarTheme(
              data: ButtonBarThemeData(),
              child: ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                    child: const Text('Cancel',
                        style: TextStyle(color: Colors.black)),
                    onPressed: () {},
                  ),
                  TextButton(
                    child: const Text('End Trip',
                        style: TextStyle(color: Colors.black)),
                    onPressed: () {},
                  ),
                ],
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
