import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/core/config/Globals.dart';

class MaintenanceReportField extends StatelessWidget {
  const MaintenanceReportField(
    this.mainText,
    this.controller, {
    Key? key,
    required this.maxLength,
    this.validationAction,
  }) : super(key: key);

  final TextEditingController controller;
  final String mainText;
  final int maxLength;
  final String? Function(String?)? validationAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.multiline,
        minLines: 1,
        maxLines: 20,
        validator: validationAction,
        controller: controller,
        cursorColor: Colors.grey,
        maxLength: maxLength,
        style: GoogleFonts.roboto(
          textStyle: Theme.of(context).textTheme.headline4,
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: darkTextColor,
        ),
        decoration: InputDecoration(
          fillColor: darkPrimary700,
          filled: true,
          labelText: mainText,
          labelStyle: GoogleFonts.roboto(
            fontSize: 14.0,
            color: darkTextColor,
          ),
          helperStyle: TextStyle(
            color: darkTextColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: darkPrimary300),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
          ),
        ),
      ),
    );
  }
}
