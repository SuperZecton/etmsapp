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
        backgroundColor: Colors.lightBlue,

        centerTitle: true,
      ),
      body: Container(
        color: Color(0xffDCDDDB),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
