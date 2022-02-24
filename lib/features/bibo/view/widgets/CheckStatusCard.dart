
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/core/config/Globals.dart';
import 'package:ltcapp/features/bibo/viewmodel/CheckStatusViewModel.dart';

class CheckInStatusCard extends StatelessWidget {
  const CheckInStatusCard(
      {Key? key,
      required this.checkInDate,
      required this.checkInTime,
      required this.location,
      required this.status,
      this.checkOutDate,
      this.checkOutTime,
      this.nric})
      : super(key: key);

  final String checkInDate;
  final String checkInTime;
  final String? checkOutDate;
  final String? checkOutTime;
  final String location;
  final String status;
  final String? nric;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Material(
          elevation: 1,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(8),
          child: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                AppBar(
                  leading: Icon(Icons.verified_user),
                  elevation: 0,
                  title: Text("Status"),
                  backgroundColor: darkGreenAccent,
                  centerTitle: true,
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.list),
                      onPressed: () {},
                    )
                  ],
                ),
                Container(
                  ///First Field for Check in
                  child: Column(
                    children: [
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "$checkInTime",
                              style: GoogleFonts.roboto(
                                fontSize: 32,
                                color: darkTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "$checkInDate",
                              style: GoogleFonts.roboto(
                                fontSize: 28,
                                color: darkTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 24, right: 16, top: 18),
                        child: Row(
                          children: [
                            Text(
                              "Location: $location",
                              style: GoogleFonts.roboto(
                                fontSize: 22,
                                color: darkTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 24, right: 16, top: 24),
                        child: Row(
                          children: [
                            Text(
                              "Status: $status",
                              style: GoogleFonts.roboto(
                                fontSize: 22,
                                color: darkTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 24,
                    top: 24,
                  ),

                  /// Child Button here
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
