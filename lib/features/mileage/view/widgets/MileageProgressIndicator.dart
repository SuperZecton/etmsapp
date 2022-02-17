import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/core/config/Globals.dart';
import 'package:ltcapp/features/mileage/viewmodel/MileageViewModel.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:stacked/stacked.dart';

class MileageProgressIndicator extends ViewModelWidget<MileageViewModel> {
  const MileageProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, MileageViewModel model) {
    return Container(
      height: 200,
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
                "Bonus Progress",
                style: GoogleFonts.roboto(
                  textStyle: Theme.of(context).textTheme.headline4,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: darkTextColor,
                ),
              ),
            ],
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: CircularPercentIndicator(
                      radius: 60.0,
                      lineWidth: 5.0,
                      percent:
                          model.fetchingBonusList ? 0.0 : model.fetchedBonus[3],
                      center: Text(
                        model.fetchingBonusList
                            ? "0.0%"
                            : "${model.fetchedBonus[4]}%",
                        style: GoogleFonts.roboto(
                          fontSize: 14.0,
                          color: darkTextColor,
                        ),
                      ),
                      progressColor: Colors.green,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 3.0),
                          child: Text(
                              model.fetchingBonusList
                                  ? "Total Mileage not avail"
                                  : "Total Mileage: ${model.fetchedBonus[2]}km",
                              style: GoogleFonts.roboto(
                                  color: darkTextColor,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500)),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 3.0),
                          child: Text(
                              model.fetchingBonusList
                                  ? "Leftover mileage not avail"
                                  : "${model.fetchedBonus[5]}km left till bonus",
                              style: GoogleFonts.roboto(
                                  color: darkTextColor,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
