import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ltcapp/core/config/Globals.dart';

class VehicleBookOutCard extends StatelessWidget {
  final String time = DateFormat("jm").format(DateTime.now().toLocal());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 175,
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        color: darkPrimary500,
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
                        style: GoogleFonts.lato(
                            color: Colors.black, fontSize: 20.0),
                      )),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Odometer:',
                        style: GoogleFonts.lato(
                            color: Colors.black, fontSize: 20.0),
                      )),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Time started: $time',
                        style: GoogleFonts.lato(
                            color: Colors.black, fontSize: 20.0),
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
