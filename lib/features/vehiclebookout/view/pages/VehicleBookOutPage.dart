import 'package:flutter/material.dart';
import 'package:ltcapp/core/config/Globals.dart';
import 'package:ltcapp/core/widgets/topBackButton.dart';
import 'package:ltcapp/features/home/view/widgets/TopContainer.dart';
import 'package:ltcapp/features/vehiclebookout/view/widgets/VehicleButton.dart';
import 'package:ltcapp/features/vehiclebookout/view/widgets/VehicleEntryField.dart';
import 'package:ltcapp/features/vehiclebookout/view/widgets/VehicleBookOutCard.dart';
import 'package:ltcapp/features/vehiclebookout/viewmodel/VehicleBookOutViewModel.dart';
import 'package:stacked/stacked.dart';

class VehicleBookOutPage extends StatelessWidget {
  const VehicleBookOutPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => VehicleBookOutViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          body: Container(
            color: Theme.of(context).backgroundColor,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(0.0),
              children: [
                TopContainer(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  color: darkGreenColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          TopBackButton(),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 40),
                VehicleBookOutCard(),
                SizedBox(
                  height: 30,
                ),
                VehicleButton("Start Trip",
                    onPressed: () =>
                        Navigator.pushNamed(context, '/vehicleManagementForm')),
                SizedBox(
                  height: 30,
                ),
                VehicleButton(
                  "End Trip",
                  onPressed: () =>
                      Navigator.pushNamed(context, '/vehicleManagementFormIn'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
