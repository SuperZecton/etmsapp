import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/core/config/Globals.dart';

class MileageListItem {
  MileageListItem(this.vehicleNo, this.date, this.startOdometer,
      this.endOdometer, this.mileage);
  final String vehicleNo;
  final String date;
  final String startOdometer;
  final String endOdometer;
  final String mileage;

  Widget buildVehicleNo(BuildContext context) {
    return Text(
      vehicleNo,
      style: GoogleFonts.roboto(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: darkTextColor,
      ),
    );
  }

  Widget buildDate(BuildContext context) {
    return Text(
      date,
      style: GoogleFonts.roboto(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: darkTextColor,
      ),
    );
  }

  Widget buildStartOdo(BuildContext context) {
    return Text(
      startOdometer,
      style: GoogleFonts.roboto(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: darkTextColor,
      ),
    );
  }

  Widget buildEndOdo(BuildContext context) {
    return Text(
      endOdometer,
      style: GoogleFonts.roboto(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: darkTextColor,
      ),
    );
  }

  Widget buildMileage(BuildContext context) {
    return Text(
      mileage,
      style: GoogleFonts.roboto(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: darkTextColor,
      ),
    );
  }
}
