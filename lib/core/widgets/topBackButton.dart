import 'package:flutter/material.dart';

class TopBackButton extends StatelessWidget {
  const TopBackButton({Key? key, this.color = Colors.white, this.padding}) : super(key: key);
  final EdgeInsets? padding;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Container(
        padding: padding != null ? padding: EdgeInsets.symmetric(horizontal: 0),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(
                Icons.keyboard_arrow_left,
                color: color,
                size: 30,
              ),
            ),
            Text('Back',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}
