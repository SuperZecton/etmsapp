import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/core/config/Globals.dart';
import 'package:intl/intl.dart';
import 'package:ltcapp/features/admin/view/widgets/OffPassCard.dart';
import 'package:ltcapp/features/admin/view/widgets/ParadeStateCard.dart';
import 'package:ltcapp/features/admin/viewmodel/OffPassViewModel.dart';
import 'package:ltcapp/features/admin/viewmodel/ParadeStateViewModel.dart';
import 'package:ltcapp/features/maintenance/view/widgets/MaintenanceVehCard.dart';
import 'package:ltcapp/features/maintenance/viewmodel/MaintenanceMainViewModel.dart';
import 'package:stacked/stacked.dart';

class OffPassPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OffPassViewModel>.reactive(
        viewModelBuilder: () => OffPassViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            appBar: AppBar(
              title: Text(
                "Parade State",
                style: GoogleFonts.roboto(color: darkTextColor, fontSize: 24.0),
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: ListView.builder(
                      itemCount: model.fetchingOffPass || model.fetchedOffPass.isEmpty
                          ? 0
                          : model.fetchedOffPass.length,
                      itemBuilder: (context, index) {
                        final item = model.fetchedOffPass[index];
                        return OffPassCard(
                          username: item[3],
                          location: item[1],
                          status: item[2],
                          onTap: () => model.onTap(context, item[0]),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
