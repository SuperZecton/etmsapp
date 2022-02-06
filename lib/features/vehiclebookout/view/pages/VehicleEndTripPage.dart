
import 'package:flutter/material.dart';
import 'package:ltcapp/features/vehiclebookout/view/widgets/VehicleButton.dart';
import 'package:ltcapp/features/vehiclebookout/view/widgets/VehicleEntryField.dart';
import 'package:ltcapp/features/vehiclebookout/view/widgets/VehicleBookOutCard.dart';

class VehicleEndTripPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text("End Trip"),

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
              SizedBox(height: 30,),
              SizedBox(height: 30,),
              VehicleButton("Submit", onPressed: () => Navigator.pushNamed(context, '/vehicleManagement'),),
              
            ],
          ),
        ),
      ),
    );
  }
}
