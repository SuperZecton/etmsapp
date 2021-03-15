import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ltcapp/features/vehiclebookout/view/widgets/VehicleButton.dart';
import 'package:ltcapp/features/vehiclebookout/view/widgets/VehicleEntryField.dart';
import 'package:ltcapp/features/vehiclebookout/view/widgets/vehicleBookOutCard.dart';

class VehicleBookOutPage extends StatefulWidget {
  @override
  _VehicleBookOutPageState createState() => _VehicleBookOutPageState();
}

class _VehicleBookOutPageState extends State<VehicleBookOutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
      ),
      body: Container(
        color: Color(0xffDCDDDB),
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              VehicleBookOutCard(),
              SizedBox(
                height: 30,
              ),
              VehicleButton("Start Trip",
                  onPressed: () =>
                      Navigator.pushNamed(context, '/vehicleManagementForm')),
              SizedBox(height: 30,),
              VehicleButton("End Trip", onPressed: () => Navigator.pushNamed(context, '/vehicleManagementFormIn'),),
            ],
          ),
        ),
      ),
    );
  }
}
