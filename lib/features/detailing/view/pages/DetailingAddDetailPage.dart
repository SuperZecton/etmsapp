import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ltcapp/core/config/Globals.dart';
import 'package:ltcapp/core/utils/Validators.dart';
import 'package:ltcapp/features/detailing/model/detail_type.dart';
import 'package:ltcapp/features/detailing/view/widgets/DetailingButton.dart';
import 'package:ltcapp/features/detailing/view/widgets/detailingDropDownField.dart';
import 'package:ltcapp/features/detailing/view/widgets/detailingEntryField.dart';
import 'package:ltcapp/features/detailing/view/widgets/detailingDateField.dart';
import 'package:ltcapp/features/detailing/viewmodel/DetailingAddDetailViewModel.dart';
import 'package:stacked/stacked.dart';

class DetailingAddDetailPage extends StatelessWidget {
  const DetailingAddDetailPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DetailingAddDetailViewModel>.reactive(
        viewModelBuilder: () => DetailingAddDetailViewModel(),
        onModelReady: (model) => model.initialise(),
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: darkGreenColor,
              title: Text("Add Detail"),
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
                      DetailingDateField(
                          "Date of Detail", FontAwesomeIcons.calendarWeek, model.detailDate,
                          onTap: () => model.selectDate(context, model.detailDate)),
                      DetailingDropDownField<CarType?>(
                          hint: "Type Of Detail",
                          values: CarType.getValues(),
                          value: model.currentCarValue,
                          icon: FontAwesomeIcons.truckPickup,
                          onChanged: (value) =>
                              model.carTypeDropDownOnChanged(value!)),
                      SizedBox(height: 5),
                      DetailingDropDownField<String?>(
                          hint: "Vehicle Number",
                          values: model.vehicleNumbers,
                          value: model.currentVehicleNo,
                          icon: FontAwesomeIcons.carAlt,
                          onChanged: (value) =>
                              model.vehicleNoDropDownOnChanged(value!)),
                      DetailingDropDownField<String?>(
                          hint: "Vehicle Commander",
                          values: model.vehicleCommanders,
                          value: model.currentVCom,
                          icon: FontAwesomeIcons.userFriends,
                          onChanged: (value) =>
                              model.vcDropDownOnChanged(value!)),
                      DetailingDropDownField<String?>(
                          hint: "Purpose of Trip",
                          value: model.currentPurpose,
                          values: model.purposeOfTrip,
                          icon: FontAwesomeIcons.luggageCart,
                          onChanged: (value) =>
                              model.purposeOfTripOnChanged(value!)),
                      DetailingEntryField(
                        "Start odometer",
                        FontAwesomeIcons.tachometerAlt,
                        model.startingOdometer,
                        validationAction: (String? input) =>
                            input!.isValidNumber()
                                ? null
                                : "Please enter Numbers only",
                      ),
                      DetailingEntryField(
                        "Start Location",
                        FontAwesomeIcons.mapMarkedAlt,
                        model.locationStart,
                        validationAction: (String? input) =>
                            input!.isValidLocation()
                                ? null
                                : "Please don't add special characters",
                      ),
                      DetailingEntryField(
                        "End Location",
                        FontAwesomeIcons.mapMarkedAlt,
                        model.locationEnd,
                        validationAction: (String? input) =>
                            input!.isValidLocation()
                                ? null
                                : "Please don't add special characters",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DetailingButton(
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
