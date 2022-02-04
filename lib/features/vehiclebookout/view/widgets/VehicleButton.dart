import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VehicleButton extends StatefulWidget {
  VehicleButton(this.text, {Key? key, this.onPressed}) : super(key: key);
  final VoidCallback? onPressed;
  final String text;

  @override
  _VehicleButtonState createState() => _VehicleButtonState();
}

class _VehicleButtonState extends State<VehicleButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        margin: EdgeInsets.symmetric(horizontal: 100),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Text(
          widget.text,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
