
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditAlertDialog extends StatelessWidget {
  const EditAlertDialog({Key? key, required this.civiPlate, required this.aviDate, required this.vehicleHolding, required this.onPressed}) : super(key: key);

  final TextEditingController civiPlate;
  final TextEditingController aviDate;
  final TextEditingController vehicleHolding;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Dialog Title',
        style: GoogleFonts.roboto(
          fontSize: 22.0,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'.toUpperCase()),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text('OK'.toUpperCase()),
        ),
      ],
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              maxLength: 10,
              controller: civiPlate,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Change Civilian Plate',
              ),
              textInputAction: TextInputAction.next,

            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              controller: aviDate,
              decoration: InputDecoration(
                labelText: 'Edit avi date',
              ),
              textInputAction: TextInputAction.next,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              controller: vehicleHolding,
              decoration: InputDecoration(
                labelText: 'Edit vehicle holding',
              ),
              textInputAction: TextInputAction.next,
            ),
          ],
        ),
      ),
    );
  }
}
