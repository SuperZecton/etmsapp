
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/core/config/Globals.dart';
import 'package:ltcapp/features/home/viewmodel/HomePageViewModel.dart';
import 'package:ltcapp/features/mileage/viewmodel/MileageViewModel.dart';
import 'package:stacked/stacked.dart';

class MileageInfoCard extends ViewModelWidget<MileageViewModel> {
  const MileageInfoCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, MileageViewModel model) {
    return Container(
      height: 140,
      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      margin: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: darkPrimary700,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "E-Mileage",
                style: GoogleFonts.roboto(
                  textStyle: Theme.of(context).textTheme.headline4,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: darkTextColor,
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: darkPrimary500,
                    borderRadius: BorderRadius.circular(12.0)),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/mileageMain',
                    );
                  },
                  child: Text(
                    "Show History",
                    style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.headline4,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: darkTextColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                     "hi",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.headline4,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: darkTextColor,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                    "",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.headline4,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: darkTextColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
