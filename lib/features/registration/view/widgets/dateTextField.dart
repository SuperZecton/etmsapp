import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ltcapp/core/config/Globals.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/features/registration/viewmodel/DatePickerNotifier.dart';
import 'package:provider/provider.dart';

class DateTextField extends StatefulWidget {
  const DateTextField(this.mainText, this.icon, this.controller,
      {Key? key, this.helperText = ""})
      : super(key: key);

  final IconData icon;
  final TextEditingController controller;
  final String mainText;
  final String helperText;

  @override
  _DateTextFieldState createState() => _DateTextFieldState();
}

class _DateTextFieldState extends State<DateTextField> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DatePickerNotifier>(
      create: (context) => DatePickerNotifier(),
      child: Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
        child: Consumer<DatePickerNotifier>(
          builder: (context, vm, child) => TextFormField(
            readOnly: true,
            controller: widget.controller,
            onTap: () {
              //vm.selectDate(context, widget.controller);
            },
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
        ),
      ),
    );
  }
}
