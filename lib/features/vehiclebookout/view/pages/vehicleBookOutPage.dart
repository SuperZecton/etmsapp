import 'package:flutter/material.dart';

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
          "Vehicle Bookout",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
