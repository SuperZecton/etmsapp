import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ltcapp/core/config/Globals.dart';

class DetailingButton extends StatefulWidget {
  DetailingButton(this.text, {Key? key, this.onPressed}) : super(key: key);
  final VoidCallback? onPressed;
  final String text;

  @override
  _DetailingButtonState createState() => _DetailingButtonState();
}

class _DetailingButtonState extends State<DetailingButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        margin: EdgeInsets.symmetric(horizontal: 100),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: darkGreenAccent,
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
