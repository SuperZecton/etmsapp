import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/core/config/Globals.dart';

class VehicleEntryField extends StatefulWidget {
  const VehicleEntryField(this.mainText, {Key? key}) : super(key: key);

  final String mainText;

  @override
  _VehicleEntryFieldState createState() => _VehicleEntryFieldState();
}

class _VehicleEntryFieldState extends State<VehicleEntryField> {
  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorColor: Colors.black,
        style: GoogleFonts.roboto(
          textStyle: Theme.of(context).textTheme.headline4,
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: Colors.black54,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white24,
          labelText: widget.mainText,
          labelStyle: TextStyle(
            color: Colors.black54,
          ),

          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
          ),
        ),
      ),
    );
  }
}
