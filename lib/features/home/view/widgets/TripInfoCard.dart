import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/core/config/Globals.dart';
import 'package:ltcapp/features/home/view/futurewidgets/CurrentTripInfoWidget.dart';
import 'package:ltcapp/features/home/viewmodel/HomePageViewModel.dart';
import 'package:stacked/stacked.dart';

class TripInfoCard extends ViewModelWidget<HomePageViewModel> {
  @override
  Widget build(BuildContext context, HomePageViewModel model) {
    return Container(
      height: 260,
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
          CurrentTripInfoWidget(),
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
  }
}
