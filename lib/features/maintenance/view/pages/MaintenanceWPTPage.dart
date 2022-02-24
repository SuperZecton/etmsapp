import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/core/config/Globals.dart';
import 'package:intl/intl.dart';
import 'package:ltcapp/features/maintenance/view/widgets/MaintenanceVehCard.dart';
import 'package:ltcapp/features/maintenance/view/widgets/MaintenanceWPTCard.dart';
import 'package:ltcapp/features/maintenance/viewmodel/MaintenanceMainViewModel.dart';
import 'package:ltcapp/features/maintenance/viewmodel/MaintenanceWPTViewModel.dart';
import 'package:stacked/stacked.dart';

class MaintenanceWPTPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MaintenanceWPTViewModel>.reactive(
        viewModelBuilder: () => MaintenanceWPTViewModel(),
        builder: (context, model, child) {
          return Column(
              children: [
                SizedBox(height:10),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: ListView.builder(
                      itemCount: model.fetchingWPT || model.isWPTEmpty
                          ? 0
                          : model.fetchedWPT.length,
                      itemBuilder: (context, index) {
                        final item = model.fetchedWPT[index];
                        return MaintenanceWPTCard(
                          vehicleNo: item[1], onEdit: (context) {
                          ///Todo edit function

                        },);

                      },
                    ),
                  ),
                ),
              ],
            );
        });
  }
}
