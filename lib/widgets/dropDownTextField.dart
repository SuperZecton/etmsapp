import 'package:flutter/material.dart';
import 'package:ltcapp/utils/globals.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationDropDownField extends StatefulWidget {
  const RegistrationDropDownField(this.icon, this.mainText,
      {Key key, this.helperText = "",})
      : super(key: key);

  final IconData icon;
  final String helperText;
  final String mainText;
  _RegistrationDropDownFieldState createState() =>
      _RegistrationDropDownFieldState();

}

class _RegistrationDropDownFieldState extends State<RegistrationDropDownField>{
  var _currencies = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
  ];
   String _currentSelectedValue;

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.blueAccent, fontSize: 16.0),
          errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
          hintText: 'Please select a value',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
      isEmpty: _currentSelectedValue == widget.mainText,
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          icon: Icon(widget.icon),
          value: _currentSelectedValue,
          isDense: true,
          onChanged: (String newValue) {
            setState(() {
              _currentSelectedValue = newValue;

            });
          },
          items: _currencies.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }

  }
