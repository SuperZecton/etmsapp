import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ltcapp/utils/globals.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/utils/individual_identity.dart';

class RaceDropDownField extends StatefulWidget {
  const RaceDropDownField({Key key}) : super(key: key);
  String getValue(){
    return _RaceDropDownFieldState()._currentSelectedValue.toString();
  }

  _RaceDropDownFieldState createState() => _RaceDropDownFieldState();
}

class _RaceDropDownFieldState extends State<RaceDropDownField> {
  RaceType _currentSelectedValue;
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
            Icons.recent_actors,
            color: Colors.white,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<RaceType>(
            value: _currentSelectedValue,
            hint: Text(
              "Race",
              style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.headline4,
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Color(0xffffffff),
              ),
            ),
            isDense: true,
            onChanged: (RaceType newValue) {
              setState(() {
                _currentSelectedValue = newValue;
              });
            },
            selectedItemBuilder: (BuildContext context) {
              return RaceType.getValues().map((RaceType raceType) {
                return Text(
                  raceType.toString(),
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color(0xffffffff),
                  ),
                );
              }).toList();
            },
            items: RaceType.getValues().map((RaceType raceType) {
              return DropdownMenuItem<RaceType>(
                value: raceType,
                child: Text(
                  raceType.toString(),
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
