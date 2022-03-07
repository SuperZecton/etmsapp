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
import 'package:ltcapp/features/maintenance/viewmodel/MaintenanceMainViewModel.dart';
import 'package:ltcapp/features/maintenance/viewmodel/MaintenanceReportViewModel.dart';
import 'package:ltcapp/features/maintenance/viewmodel/MaintenanceWPTViewModel.dart';
import 'package:stacked/stacked.dart';

class MaintenanceReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MaintenanceReportViewModel>.reactive(
        viewModelBuilder: () => MaintenanceReportViewModel(),
        builder: (context, model, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                MaintenanceEntryField(
                    "Vehicle No.", FontAwesomeIcons.carCrash, model.vehicleNo),
                MaintenanceDateField(
                  "Date of Incident",
                  FontAwesomeIcons.calendarWeek,
                  model.date,
                  onTap: () => model.selectDate(context, model.date),
                ),
                MaintenanceDateField(
                  "Time of Incident",
                  FontAwesomeIcons.clock,
                  model.time,
                  onTap: () => model.selectTime(context, model.time),
                ),
                MaintenanceDropDownField<String?>(
                    hint: "Report Type",
                    icon: FontAwesomeIcons.flag,
                    value: model.currentReportType,
                    values: model.reportType,
                    onChanged: (value) => model.reportTypeOnChanged(value!)),
                MaintenanceReportField("", model.report, maxLength: 500),
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
                      "Submit Report",
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
