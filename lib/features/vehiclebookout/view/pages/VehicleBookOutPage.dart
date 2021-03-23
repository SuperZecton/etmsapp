import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ltcapp/core/config/globals.dart';
import 'package:ltcapp/core/widgets/topBackButton.dart';
import 'package:ltcapp/features/home/view/widgets/topContainer.dart';
import 'package:ltcapp/features/vehiclebookout/view/widgets/VehicleButton.dart';
import 'package:ltcapp/features/vehiclebookout/view/widgets/VehicleEntryField.dart';
import 'package:ltcapp/features/vehiclebookout/view/widgets/vehicleBookOutCard.dart';
import 'package:ltcapp/features/vehiclebookout/viewmodel/VehicleBookOutViewModel.dart';
import 'package:provider/provider.dart';

class VehicleBookOutPage extends StatefulWidget {
  @override
  _VehicleBookOutPageState createState() => _VehicleBookOutPageState();
}

class _VehicleBookOutPageState extends State<VehicleBookOutPage> {
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<VehicleBookOutViewModel>(context, listen: false);
    return Scaffold(
      body: Container(
        color: kWhite,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(0.0),
          children: [
            TopContainer(
              height: 100,
              width: MediaQuery.of(context).size.width,
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

            SizedBox(height:40),
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
  }
}
