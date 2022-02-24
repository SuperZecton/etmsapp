import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/core/config/Globals.dart';
import 'package:intl/intl.dart';
import 'package:ltcapp/features/maintenance/view/widgets/EditAlertDialog.dart';
import 'package:ltcapp/features/maintenance/view/widgets/MaintenanceVehCard.dart';
import 'package:ltcapp/features/maintenance/viewmodel/MaintenanceMainViewModel.dart';
import 'package:ltcapp/features/maintenance/viewmodel/MaintenanceVehicleViewModel.dart';
import 'package:stacked/stacked.dart';

class MaintenanceVehiclePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MaintenanceVehicleViewModel>.reactive(
        viewModelBuilder: () => MaintenanceVehicleViewModel(),
        builder: (context, model, child) {
          return Column(
            children: [
              SizedBox(height: 10),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: ListView.builder(
                    itemCount:
                        model.fetchingAllList ? 0 : model.fetchedAllList.length,
                    itemBuilder: (context, index) {
                      final item = model.fetchedAllList[index];
                      return MaintenanceVehCard(
                        vehicleNo: item[1],
                        carModel: item[2],
                        carType: item[3],
                        classType: item[4],
                        status: item[5],
                        nextAVIDate: item[8],
                        nextWPTDate: item[10],
                        additionalPlate: item[11],
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        });
  }
}
