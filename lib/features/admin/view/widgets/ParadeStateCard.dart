import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/core/config/Globals.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ParadeStateCard extends StatelessWidget {
  const ParadeStateCard({
    Key? key,
    required this.username,
    required this.location,
    required this.status,
    required this.value,
    required this.values,
    required this.onChanged
  }) : super(key: key);

  final String username;
  final String location;
  final String status;
  final String? value;
  final List<String?> values;
  final ValueChanged<String?>? onChanged;
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
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String?>(
                  iconSize: 0.0,
                  value: value,
                  hint: Text(
                    "Edit Status",
                    style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.headline4,
                      fontSize: 13,
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
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: darkTextColor,
                        ),
                      );
                    }).toList();
                  },
                  items: values.map((value) {
                    return DropdownMenuItem<String?>(
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
        ],
      ),
    );
  }
}
