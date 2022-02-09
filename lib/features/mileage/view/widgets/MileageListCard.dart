import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/core/config/Globals.dart';

class MileageListCard extends StatelessWidget {
  const MileageListCard(
      {Key? key,
      required this.vehicleNo,
      required this.startOdo,
      required this.endOdo,
      required this.date,
      required this.mileage})
      : super(key: key);

  final String vehicleNo;
  final String startOdo;
  final String endOdo;
  final String date;
  final String mileage;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: darkPrimary700,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              vehicleNo,
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: darkTextColor,
              ),
            ),
            Text(
              date,
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: darkTextColor,
              ),
            ),
          ],
        ),
        subtitle: Text(
          "$startOdo to $endOdo : ${mileage}km",
          style: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: darkTextColor,
          ),
        ),
      ),
    );
  }
}
