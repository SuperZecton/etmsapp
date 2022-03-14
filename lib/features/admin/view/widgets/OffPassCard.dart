import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/core/config/Globals.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class OffPassCard extends StatelessWidget {
  const OffPassCard({
    Key? key,
    required this.username,
    required this.location,
    required this.status,
  }) : super(key: key);

  final String username;
  final String location;
  final String status;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: darkPrimary700,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ExpansionTile(
        title: Text(
          username,
          style: GoogleFonts.roboto(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: darkTextColor,
          ),
        ),
        subtitle: Container(
          padding: EdgeInsets.symmetric(vertical: 6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                status,
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: darkTextColor,
                ),
              ),
              Text(
                location,
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
            title: InkWell(
              onTap: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Sign Off Pass here"),
                  );
                },
              ),
              child: Text(
                "Sign Off Pass",
                style: GoogleFonts.roboto(fontSize: 16, color: darkTextColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
