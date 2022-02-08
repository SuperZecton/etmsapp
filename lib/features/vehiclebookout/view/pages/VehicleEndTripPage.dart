
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ltcapp/core/config/Globals.dart';
import 'package:ltcapp/core/utils/Validators.dart';
import 'package:ltcapp/features/vehiclebookout/model/individual_vehicle.dart';
import 'package:ltcapp/features/vehiclebookout/view/widgets/VehicleButton.dart';
import 'package:ltcapp/features/vehiclebookout/view/widgets/VehicleDropDownField.dart';
import 'package:ltcapp/features/vehiclebookout/view/widgets/VehicleEntryField.dart';
import 'package:ltcapp/features/vehiclebookout/view/widgets/VehicleBookOutCard.dart';
import 'package:ltcapp/features/vehiclebookout/viewmodel/VehicleStartTripViewModel.dart';
import 'package:ltcapp/features/vehiclebookout/viewmodel/VehicleEndTripViewModel.dart';
import 'package:stacked/stacked.dart';

class VehicleEndTripPage extends StatelessWidget {
  const VehicleEndTripPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VehicleEndTripViewModel>.reactive(
        viewModelBuilder: () => VehicleEndTripViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: darkGreenColor,
              title: Text("End Trip"),
              centerTitle: true,
            ),
            body: Container(
              color: Theme.of(context).backgroundColor,
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Form(
                  key: model.endTripKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 30),
                      VehicleEntryField(
                          "End odometer",
                          FontAwesomeIcons.tachometerAlt,
                          model.endOdometer),
                      VehicleButton(
                        "Submit",
                        onPressed: () => model.onEndTripPush(context),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
