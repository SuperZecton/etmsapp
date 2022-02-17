import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/core/config/Globals.dart';

class VehicleCheckBox extends StatelessWidget {
  const VehicleCheckBox(
      {Key? key,
      required this.mainText,
      this.value = false,
      required this.onChanged})
      : super(key: key);
  final String mainText;
  final bool? value;
  final void Function(bool?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 0),
      child: CheckboxListTile(
        activeColor: darkGreenAccent,
        contentPadding: EdgeInsets.zero,
        title: Text(
          mainText,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w400,
            fontSize: 18.0,
          ),
        ),
        value: value,
        onChanged: onChanged,
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}
