import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/core/config/Globals.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MaintenanceWPTCard extends StatelessWidget {
  const MaintenanceWPTCard({
    Key? key,
    required this.vehicleNo,
    required this.onEdit
  }) : super(key: key);

  final String vehicleNo;

  final void Function(BuildContext) onEdit;
  @override
  Widget build(BuildContext context) {
    return Card(
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
          ],
        ),
      ),
    );
  }
}
