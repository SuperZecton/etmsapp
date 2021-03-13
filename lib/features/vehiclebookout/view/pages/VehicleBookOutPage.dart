import 'package:flutter/material.dart';
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
        backgroundColor: Colors.white,
        title: Text(
          "Vehicle Book Out",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              VehicleBookOutCard(),

            ],
          ),
        ),
      ),
    );
  }
}
