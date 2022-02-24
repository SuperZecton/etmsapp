import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/core/config/Globals.dart';
import 'package:intl/intl.dart';
import 'package:ltcapp/features/maintenance/view/widgets/MaintenanceDateField.dart';
import 'package:ltcapp/features/maintenance/view/widgets/MaintenanceDropDown.dart';
import 'package:ltcapp/features/maintenance/view/widgets/MaintenanceEntryField.dart';
import 'package:ltcapp/features/maintenance/view/widgets/MaintenanceReportField.dart';
import 'package:ltcapp/features/maintenance/view/widgets/MaintenanceVehCard.dart';
import 'package:ltcapp/features/maintenance/view/widgets/MaintenanceWPTCard.dart';
import 'package:ltcapp/features/maintenance/viewmodel/MaintenanceEditViewModel.dart';
import 'package:ltcapp/features/maintenance/viewmodel/MaintenanceMainViewModel.dart';
import 'package:ltcapp/features/maintenance/viewmodel/MaintenanceReportViewModel.dart';
import 'package:ltcapp/features/maintenance/viewmodel/MaintenanceWPTViewModel.dart';
import 'package:stacked/stacked.dart';

class MaintenanceEditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MaintenanceEditViewModel>.reactive(
        viewModelBuilder: () => MaintenanceEditViewModel(),
        builder: (context, model, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                MaintenanceEntryField(
                    "Vehicle No.", FontAwesomeIcons.car, model.vehicleNo),
                MaintenanceDateField("AVI Date", FontAwesomeIcons.calendarWeek, model.aviDate, onTap: ()=> model.selectDate(context, model.aviDate)),
                MaintenanceEntryField(
                    "Civilian Plate", FontAwesomeIcons.sign, model.civiPlate, helperText: "Leave Blank if none",),
                MaintenanceDropDownField<String?>(
                    hint: "Vehicle Holding",
                    icon: FontAwesomeIcons.carAlt,
                    value: model.currentVehicleHolding,
                    values: model.vehicleHolding,
                    onChanged: (value) => model.vehicleHoldingOnChanged(value!)),
                SizedBox(height: 20),
                InkWell(
                  onTap: () => model.submitPush(context),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    margin: EdgeInsets.symmetric(horizontal: 100),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: darkGreenAccent,
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                    ),
                    child: Text(
                      "Edit Vehicle",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
