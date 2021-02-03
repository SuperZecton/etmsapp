import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ltcapp/utils/globals.dart';
import 'package:google_fonts/google_fonts.dart';

class DateTextField extends StatefulWidget {
  const DateTextField(this.mainText, this.icon, this.controller,
      {Key key, this.helperText = ""})
      : super(key: key);

  final IconData icon;
  final TextEditingController controller;
  final String mainText;
  final String helperText;

  @override
  _DateTextFieldState createState() => _DateTextFieldState();
}

class _DateTextFieldState extends State<DateTextField> {


  String selectedDate;

  @override
  Widget build(BuildContext context) {
    widget.controller.text = selectedDate;
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
      child: TextFormField(
        readOnly: true,
        controller: widget.controller,
        onTap: () => _selectDate(context),
        cursorColor: Colors.grey,
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
            widget.icon,
            color: Colors.white,
          ),
          labelText: widget.mainText,
          labelStyle: TextStyle(
            color: Colors.white,
          ),
          helperStyle: TextStyle(
            color: Colors.white,
          ),
          helperText: widget.helperText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }

  Future <void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != DateTime.now())
      setState(() {
        selectedDate = DateFormat.yMd("en_US").format(picked);
      });
  }
}
