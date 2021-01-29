import 'package:flutter/material.dart';
import 'package:ltcapp/utils/globals.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationTextField extends StatelessWidget {
  const RegistrationTextField(this.mainText, this.icon, this.controller,
      {Key key, this.isPassword = false, this.helperText = "", this.maxLength})
      : super(key: key);

  final IconData icon;
  final TextEditingController controller;
  final String mainText;
  final bool isPassword;
  final String helperText;
  final int maxLength;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        cursorColor: Colors.grey,
        maxLength: maxLength,
        style: GoogleFonts.roboto(
          textStyle: Theme.of(context).textTheme.headline4,
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: Color(0xffffffff),
        ),
        decoration: InputDecoration(
          fillColor: secondaryColor,
          filled: true,
          prefixIcon: Icon(
            icon,
            color: Colors.white,
          ),
          labelText: mainText,
          labelStyle: TextStyle(
            color: Colors.white,
          ),
          helperStyle: TextStyle(
            color: Colors.white,
          ),
          helperText: helperText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
