import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/core/config/Globals.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MaintenanceVehCard extends StatelessWidget {
  const MaintenanceVehCard({
    Key? key,
    required this.vehicleNo,
    required this.carModel,
    required this.carType,
    required this.classType,
    required this.status,
    required this.nextAVIDate,
    required this.nextWPTDate,
    required this.additionalPlate,
    required this.onEdit,
  }) : super(key: key);

  final String vehicleNo;
  final String carModel;
  final String carType;
  final String classType;
  final String status;
  final String nextAVIDate;
  final String nextWPTDate;
  final String additionalPlate;
  final void Function(BuildContext) onEdit;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: const BehindMotion(),
      children: [
        SlidableAction(onPressed: onEdit, icon: FontAwesomeIcons.pen, label: 'Edit'),
      ],
      ),

      child: Card(
        color: darkPrimary700,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: ExpansionTile(
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
                carType,
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: darkTextColor,
                ),
              ),
            ],
          ),
          subtitle: Container(
            padding: EdgeInsets.symmetric(vertical: 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$carModel",
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: darkTextColor,
                  ),
                ),
                Text(
                  "$status",
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: darkTextColor,
                  ),
                ),
              ],
            ),
          ),
          controlAffinity: ListTileControlAffinity.leading,
          children: <Widget>[
            ListTile(
              title: Text(
                "Class $classType $additionalPlate",
                style: GoogleFonts.roboto(fontSize: 16, color: darkTextColor),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Next WPT due in: $nextWPTDate",
                    style: GoogleFonts.roboto(fontSize: 16, color: darkTextColor),
                  ),
                  Text(
                    "Next AVI Date: $nextAVIDate",
                    style: GoogleFonts.roboto(fontSize: 16, color: darkTextColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
