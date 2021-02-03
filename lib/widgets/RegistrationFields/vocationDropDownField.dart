import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ltcapp/utils/globals.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/utils/individual_identity.dart';

class VocationDropDownField extends StatefulWidget {
  const VocationDropDownField({Key key}) : super(key: key);

  _VocationDropDownFieldState createState() => _VocationDropDownFieldState();
}

class _VocationDropDownFieldState extends State<VocationDropDownField> {
  VocationType _currentSelectedValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 0, bottom: 20, left: 5, right: 5),
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
      height: 75,
      child: InputDecorator(
        decoration: InputDecoration(
          fillColor: secondaryColor,
          filled: true,
          prefixIcon: Icon(
            FontAwesomeIcons.briefcase,
            color: Colors.white,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<VocationType>(
            value: _currentSelectedValue,
            hint: Text(
              "Vocation",
              style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.headline4,
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Color(0xffffffff),
              ),
            ),
            isDense: true,
            onChanged: (VocationType newValue) {
              setState(() {
                _currentSelectedValue = newValue;
              });
            },
            selectedItemBuilder: (BuildContext context) {
              return PESType.getValues().map((PESType pesType) {
                return Text(
                  pesType.toString(),
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color(0xffffffff),
                  ),
                );
              }).toList();
            },
            items: VocationType.getValues().map((VocationType vocationType) {
              return DropdownMenuItem<VocationType>(
                value: vocationType,
                child: Text(
                  vocationType.toString(),
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
