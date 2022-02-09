import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/core/config/Globals.dart';
import 'package:ltcapp/features/home/viewmodel/HomePageViewModel.dart';
import 'package:stacked/stacked.dart';

class FutureTripInfoCard extends ViewModelWidget<HomePageViewModel> {
  const FutureTripInfoCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, HomePageViewModel model) {
    return FutureBuilder<List<String?>>(
        future: model.ensureCurrentTripData(),
        builder: (BuildContext context, AsyncSnapshot<List<String?>> snapshot) {
          switch (snapshot.hasData) {
            case false:
              return Container(
                height: 180,
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: darkPrimary700,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Material(
                          color: Colors.transparent,
                          child: Text(
                            'Current Trip',
                            style: TextStyle(
                              color: darkTextColor,
                              fontFamily: 'Regular',
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.grey[300],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            InkWell(
                              onTap: () => model.startTripPush(context),
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffF3F3FE),
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: Color(0xff415EF6),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Material(
                              color: Colors.transparent,
                              child: Text(
                                'Start Trip',
                                style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: darkTextColor),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            InkWell(
                              onTap: () => model.endTripPush(context),
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffFFF3F3),
                                ),
                                child: Icon(
                                  FontAwesomeIcons.windowClose,
                                  color: Color(0xffFD706B),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Material(
                              color: Colors.transparent,
                              child: Text(
                                'End Trip',
                                style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: darkTextColor),
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              );
            case true:
              return Container(
                height: 280,
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: darkPrimary700,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Material(
                          color: Colors.transparent,
                          child: Text(
                            'Current Trip',
                            style: TextStyle(
                              color: darkTextColor,
                              fontFamily: 'Regular',
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.grey[300],
                    ),
                    Flexible(
                      flex: 3,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 0, vertical: 4.0),
                        padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Vehicle Number: ${snapshot.data![3]}',
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.roboto(
                                    color: darkTextColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  'Trip Started at: ${snapshot.data![4]}',
                                  style: GoogleFonts.roboto(
                                    color: darkTextColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  'Starting Odometer: ${snapshot.data![5]} ',
                                  style: GoogleFonts.roboto(
                                    color: darkTextColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  'Trip Purpose: ${snapshot.data![7]}',
                                  style: GoogleFonts.roboto(
                                    color: darkTextColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            InkWell(
                              onTap: () => model.startTripPush(context),
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffF3F3FE),
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: Color(0xff415EF6),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Material(
                              color: Colors.transparent,
                              child: Text(
                                'Start Trip',
                                style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: darkTextColor),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            InkWell(
                              onTap: () => model.endTripPush(context),
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffFFF3F3),
                                ),
                                child: Icon(
                                  FontAwesomeIcons.windowClose,
                                  color: Color(0xffFD706B),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Material(
                              color: Colors.transparent,
                              child: Text(
                                'End Trip',
                                style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: darkTextColor),
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              );
            default:
              return Text(
                "ConnectionState: ${snapshot.connectionState}",
                textAlign: TextAlign.left,
                style: GoogleFonts.roboto(
                  textStyle: Theme.of(context).textTheme.headline4,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: darkTextColor,
                ),
              );
          }
        });
  }
}
