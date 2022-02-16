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
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
      child: CheckboxListTile(
        title: Text(
          mainText,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w400,
            fontSize: 16.0,
          ),
        ),
        value: value,
        onChanged: onChanged,
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}
