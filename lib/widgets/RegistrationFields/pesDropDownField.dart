import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ltcapp/utils/globals.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/utils/individual_identity.dart';

class PESDropDownField extends StatefulWidget {
  const PESDropDownField({Key key}) : super(key: key);

  _PESDropDownFieldState createState() => _PESDropDownFieldState();
}

class _PESDropDownFieldState extends State<PESDropDownField> {
  PESType _currentSelectedValue;
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
            Icons.fitness_center,
            color: Colors.white,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<PESType>(
            value: _currentSelectedValue,
            hint: Text(
              "PES",
              style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.headline4,
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Color(0xffffffff),
              ),
            ),
            isDense: true,
            onChanged: (PESType newValue) {
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
            items: PESType.getValues().map((PESType pesType) {
              return DropdownMenuItem<PESType>(
                value: pesType,
                child: Text(
                  pesType.toString(),
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
