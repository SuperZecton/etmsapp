import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ltcapp/core/config/Globals.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/features/maintenance/view/widgets/MaintenanceReportField.dart';
import 'package:ltcapp/features/maintenance/viewmodel/MaintenanceReportViewModel.dart';
import 'package:ltcapp/features/registration/viewmodel/DatePickerNotifier.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class MaintenanceDateField extends StatelessWidget {
  const MaintenanceDateField(this.mainText, this.icon, this.controller,
      {Key? key, this.helperText = "", required this.onTap})
      : super(key: key);
  final IconData icon;
  final TextEditingController controller;
  final String mainText;
  final String helperText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
      child: TextFormField(
        readOnly: true,
        controller: controller,
        onTap: onTap,
        cursorColor: Colors.grey,
        style: GoogleFonts.roboto(
          textStyle: Theme.of(context).textTheme.headline4,
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: darkTextColor,
        ),
        decoration: InputDecoration(
          fillColor: darkPrimary700,
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
            borderSide: BorderSide(color: darkPrimary300),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
          ),
        ),
      ),
    );
  }
}
