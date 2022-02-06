import 'package:flutter/material.dart';
import 'package:ltcapp/core/config/Globals.dart';
import 'package:ltcapp/features/vehiclebookout/view/widgets/VehicleButton.dart';
import 'package:ltcapp/features/vehiclebookout/view/widgets/VehicleEntryField.dart';
import 'package:ltcapp/features/vehiclebookout/view/widgets/VehicleBookOutCard.dart';
import 'package:ltcapp/features/vehiclebookout/viewmodel/VehicleBookOutViewModel.dart';
import 'package:stacked/stacked.dart';

class VehicleStartTripPage extends StatelessWidget {
  const VehicleStartTripPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => VehicleBookOutViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: darkGreenColor,
              title: Text("Start Trip"),
              centerTitle: true,
            ),
            body: Container(
              color: Theme.of(context).backgroundColor,
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    VehicleButton("Submit"),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
