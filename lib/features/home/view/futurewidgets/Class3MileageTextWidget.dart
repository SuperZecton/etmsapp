import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/core/config/Globals.dart';
import 'package:ltcapp/features/home/viewmodel/HomePageViewModel.dart';
import 'package:stacked/stacked.dart';

class Class3MileageTextWidget extends ViewModelWidget<HomePageViewModel> {
  const Class3MileageTextWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, HomePageViewModel model) {
    return FutureBuilder<String>(
        future: model.getClass3Mileage(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Text(
                "Class 3: Loading..",
                textAlign: TextAlign.left,
                style: GoogleFonts.roboto(
                  textStyle: Theme.of(context).textTheme.headline4,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: darkTextColor,
                ),
              );
            case ConnectionState.done:
              return Text(
                "Class 3: ${snapshot.data}",
                textAlign: TextAlign.left,
                style: GoogleFonts.roboto(
                  textStyle: Theme.of(context).textTheme.headline4,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: darkTextColor,
                ),
              );
            default:
              return Text(
                "Class 3: ${snapshot.connectionState}",
                textAlign: TextAlign.left,
                style: GoogleFonts.roboto(
                  textStyle: Theme.of(context).textTheme.headline4,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: darkTextColor,
                ),
              );
          }
        });
  }
}
