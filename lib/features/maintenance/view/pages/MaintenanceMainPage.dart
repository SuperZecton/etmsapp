import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/core/config/Globals.dart';
import 'package:intl/intl.dart';
import 'package:ltcapp/features/maintenance/view/widgets/MaintenanceVehCard.dart';
import 'package:ltcapp/features/maintenance/viewmodel/MaintenanceMainViewModel.dart';
import 'package:stacked/stacked.dart';

class MaintenanceMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MaintenanceMainViewModel>.reactive(
        viewModelBuilder: () => MaintenanceMainViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            appBar: AppBar(
              title: Text(
                "Maintenance Section",
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
                      itemCount: model.fetchingAllList
                          ? 0
                          : model.fetchedAllList.length,
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
                            additionalPlate: item[11]);
                      },
                    ),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: 0,
                backgroundColor: darkBackgroundColor,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(FontAwesomeIcons.borderAll), label: "Total"),
                  BottomNavigationBarItem(
                      icon: Icon(FontAwesomeIcons.square), label: "WPT"),
                ]),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () => model.floatingButtonPress(context),
              backgroundColor: darkGreenAccent,
              label: Text('Search'),
              icon: Icon(FontAwesomeIcons.search),
            ),
          );
        });
  }
}
