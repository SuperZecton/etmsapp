import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ltcapp/utils/globals.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/utils/individual_identity.dart';

class StayInStayOutDropDownField extends StatefulWidget {
  const StayInStayOutDropDownField({Key key}) : super(key: key);
  String getValue(){
    return _StayInStayOutDropDownFieldState()._currentSelectedValue.toString();
  }


  _StayInStayOutDropDownFieldState createState() => _StayInStayOutDropDownFieldState();
}

class _StayInStayOutDropDownFieldState extends State<StayInStayOutDropDownField> {
  StayInStayOutType _currentSelectedValue;
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
            FontAwesomeIcons.houseUser,
            color: Colors.white,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<StayInStayOutType>(
            value: _currentSelectedValue,
            hint: Text(
              "Stay In/Stay Out",
              style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.headline4,
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Color(0xffffffff),
              ),
            ),
            isDense: true,
            onChanged: (StayInStayOutType newValue) {
              setState(() {
                _currentSelectedValue = newValue;
              });
            },
            selectedItemBuilder: (BuildContext context) {
              return StayInStayOutType.getValues().map((StayInStayOutType stayInStayOutType) {
                return Text(
                  stayInStayOutType.toString(),
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color(0xffffffff),
                  ),
                );
              }).toList();
            },
            items: StayInStayOutType.getValues().map((StayInStayOutType stayInStayOutType) {
              return DropdownMenuItem<StayInStayOutType>(
                value: stayInStayOutType,
                child: Text(
                  stayInStayOutType.toString(),
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
