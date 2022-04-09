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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 30),
                      DetailingDateField(
                          "Start Date of Detail", FontAwesomeIcons.calendarWeek, model.startDetailDate,
                          onTap: () => model.selectDate(context, model.startDetailDate)),
                      DetailingDateField(
                          "End Date of Detail", FontAwesomeIcons.calendarWeek, model.endDetailDate,
                          onTap: () => model.selectDate(context, model.endDetailDate)),
                      DetailingDropDownField<DetailType?>(
                          hint: "Type Of Detail",
                          values: DetailType.getValues(),
                          value: model.currentDetailType,
                          icon: FontAwesomeIcons.atlas,
                          onChanged: (value) =>
                              model.detailTypeDropDownOnChanged(value!)),
                      DetailingEntryField(
                        "Training / Detail Name (Leave Blank if None)",
                        FontAwesomeIcons.clipboardList,
                        model.trainingDetailName,
                      ),
                      SizedBox(height: 5),
                      DetailingDropDownField<String?>(
                          hint: "LTC or BPC",
                          values: model.LTCorBPC,
                          value: model.currentLTCorBPC,
                          icon: FontAwesomeIcons.home,
                          onChanged: (value) =>
                              model.LTCorBPCDropDownOnChanged(value!)),
                      DetailingDropDownField<String?>(
                          hint: "Driver",
                          values: model.transportOperator,
                          value: model.currentTransportOperator,
                          icon: FontAwesomeIcons.user,
                          onChanged: (value) =>
                              model.transportOperatorDropDownOnChanged(value!)),
                      DetailingDropDownField<String?>(
                          hint: "Vehicle Commander",
                          values: model.vehicleCommanders,
                          value: model.currentVCom,
                          icon: FontAwesomeIcons.userFriends,
                          onChanged: (value) =>
                              model.vcDropDownOnChanged(value!)),
                      DetailingDropDownField<CarType?>(
                          hint: "Car Type",
                          values: CarType.getValues(),
                          value: model.currentCarValue,
                          icon: FontAwesomeIcons.truckPickup,
                          onChanged: (value) =>
                              model.carTypeDropDownOnChanged(value!)),
                      DetailingDropDownField<String?>(
                          hint: "Vehicle Number",
                          values: model.vehicleNumbers,
                          value: model.currentVehicleNo,
                          icon: FontAwesomeIcons.clipboard,
                          onChanged: (value) =>
                              model.vehicleNoDropDownOnChanged(value!)),
                      DetailingEntryField(
                        "Civilian Plate",
                        FontAwesomeIcons.clipboardList,
                        model.civilianPlate,
                      ),
                      DetailingEntryField(
                        "Report To",
                        FontAwesomeIcons.mapMarkedAlt,
                        model.reportTo,
                      ),
                      DetailingEntryField(
                        "Depart Time",
                        FontAwesomeIcons.solidClock,
                        model.timeDepart,
                        validationAction: (String? input) =>
                            input!.isValidNumber()
                                ? null
                                : "Please enter Numbers only",
                      ),
                      DetailingEntryField(
                        "RTU Time",
                        FontAwesomeIcons.clock,
                        model.timeRTU,
                        validationAction: (String? input) =>
                        input!.isValidNumber()
                            ? null
                            : "Please enter Numbers only",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DetailingButton(
                        "Add Detail",
                        onPressed: () => model.onAddDetailPush(context),
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
