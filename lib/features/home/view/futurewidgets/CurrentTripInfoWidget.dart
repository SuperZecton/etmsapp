import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/core/config/Globals.dart';
import 'package:ltcapp/features/home/viewmodel/HomePageViewModel.dart';
import 'package:stacked/stacked.dart';

class CurrentTripInfoWidget extends ViewModelWidget<HomePageViewModel> {
  const CurrentTripInfoWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, HomePageViewModel model) {
    return FutureBuilder<List<String?>>(
        future: model.ensureCurrentTripData(),
        builder: (BuildContext context, AsyncSnapshot<List<String?>> snapshot) {
          switch (snapshot.hasData) {
            case false:
              return Container();
            case true:
              return Flexible(
                flex: 2,
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
                            style: TextStyle(
                              color: darkTextColor,
                              fontFamily: 'Regular',
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Trip Started at: ${snapshot.data![4]}',
                            style: TextStyle(
                              color: darkTextColor,
                              fontFamily: 'Regular',
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Starting Odometer: ${snapshot.data![5]} ',
                            style: TextStyle(
                              color: darkTextColor,
                              fontFamily: 'Regular',
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Trip Purpose: ${snapshot.data![7]}',
                            style: TextStyle(
                              color: darkTextColor,
                              fontFamily: 'Regular',
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
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
