import 'package:flutter/material.dart';
import 'package:ltcapp/core/config/Globals.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationTextField extends StatelessWidget {
  const RegistrationTextField(
    this.mainText,
    this.icon,
    this.controller, {
    Key? key,
    this.isPassword = false,
    this.helperText = "",
    this.maxLength,
    this.validationAction,
  }) : super(key: key);

  final IconData icon;
  final TextEditingController controller;
  final String mainText;
  final bool isPassword;
  final String helperText;
  final int? maxLength;
  final String? Function(String?)? validationAction;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validationAction,
        controller: controller,
        obscureText: isPassword,
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
          prefixIcon: Icon(
            icon,
            color: darkTextColor,
          ),
          labelText: mainText,
          labelStyle: TextStyle(
            color: darkTextColor,
          ),
          helperStyle: TextStyle(
            color: darkTextColor,
          ),
          helperText: helperText,
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
