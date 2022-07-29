import 'package:flutter/material.dart';
import 'package:ltcapp/core/config/Globals.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/features/registration/viewmodel/SignupRegViewModel.dart';
import 'package:ltcapp/features/vehiclebookout/view/pages/VehicleStartTripPage.dart';
import 'package:ltcapp/features/vehiclebookout/viewmodel/VehicleStartTripViewModel.dart';
import 'package:stacked/stacked.dart';

class DetailingDropDownField<T> extends StatelessWidget {
  const DetailingDropDownField(
      {Key? key,
      this.hint = "",
      required this.value,
      this.icon,
      required this.values,
      required this.onChanged})
      : super(key: key);

  final String hint;
  final T value;
  final List<T> values;
  final ValueChanged<T?>? onChanged;
  final IconData? icon;
  @override
  Widget build(BuildContext context, ) {
    return Container(
      padding: EdgeInsets.only(top: 0, bottom: 20, left: 5, right: 5),
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
      height: 75,
      child: InputDecorator(
        decoration: InputDecoration(
          fillColor: darkPrimary700,
          filled: true,
          prefixIcon: Icon(
            icon,
            color: darkTextColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: darkPrimary300),
          ),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Theme.of(context).backgroundColor
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              value: value,
              hint: Text(
                hint,
                style: GoogleFonts.roboto(
                  textStyle: Theme.of(context).textTheme.headline4,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: darkTextColor,
                ),
              ),
              isDense: true,
              onChanged: onChanged,
              selectedItemBuilder: (BuildContext context) {
                return values.map((value) {
                  return Text(
                    value.toString(),
                    style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.headline4,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: darkTextColor,
                    ),
                  );
                }).toList();
              },
              items: values.map((value) {
                return DropdownMenuItem<T>(
                  value: value,
                  child: Text(
                    value.toString(),
                    style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.headline4,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: darkTextColor,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
