import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ltcapp/core/config/Globals.dart';
import 'package:ltcapp/core/utils/Validators.dart';
import 'package:ltcapp/features/registration/view/widgets/dropDownField.dart';
import 'package:ltcapp/features/vehiclebookout/model/individual_vehicle.dart';
import 'package:ltcapp/features/vehiclebookout/view/widgets/VehicleButton.dart';
import 'package:ltcapp/features/vehiclebookout/view/widgets/VehicleDropDownField.dart';
import 'package:ltcapp/features/vehiclebookout/view/widgets/VehicleEntryField.dart';
import 'package:ltcapp/features/vehiclebookout/view/widgets/VehicleBookOutCard.dart';
import 'package:ltcapp/features/vehiclebookout/viewmodel/VehicleStartTripViewModel.dart';
import 'package:stacked/stacked.dart';

class VehicleStartTripPage extends StatelessWidget {
  const VehicleStartTripPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VehicleStartTripViewModel>.reactive(
        viewModelBuilder: () => VehicleStartTripViewModel(),
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
                child: Form(
                  key: model.startTripKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 30),
                      VehicleDropDownField<CarType?>(
                          hint: "Car Type",
                          values: CarType.getValues(),
                          value: model.currentCarValue,
                          icon: FontAwesomeIcons.truckPickup,
                          onChanged: (value) =>
                              model.carTypeDropDownOnChanged(value!)),
                      SizedBox(height: 5),
                      VehicleDropDownField<String?>(
                          hint: "Vehicle Number",
                          values: model.vehicleNumbers,
                          value: model.currentVehicleNo,
                          icon: FontAwesomeIcons.carAlt,
                          onChanged: (value) =>
                              model.vehicleNoDropDownOnChanged(value!)),
                      VehicleDropDownField<String?>(
                          hint: "Vehicle Commander",
                          values: model.vehicleCommanders,
                          value: model.currentVCom,
                          icon: FontAwesomeIcons.userFriends,
                          onChanged: (value) =>
                              model.vcDropDownOnChanged(value!)),
                      VehicleDropDownField<String?>(
                          hint: "Purpose of Trip",
                          value: model.currentPurpose,
                          values: model.purposeOfTrip,
                          icon: FontAwesomeIcons.luggageCart,
                          onChanged: (value) =>
                              model.purposeOfTripOnChanged(value!)),
                      VehicleEntryField(
                          "Start odometer",
                          FontAwesomeIcons.tachometerAlt,
                          model.startingOdometer),
                      VehicleEntryField("Start Location",
                          FontAwesomeIcons.mapMarkedAlt, model.locationStart),
                      VehicleEntryField("End Location",
                          FontAwesomeIcons.mapMarkedAlt, model.locationEnd),
                      VehicleButton(
                        "Submit",
                        onPressed: () => model.onStartTripPush(context),
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
