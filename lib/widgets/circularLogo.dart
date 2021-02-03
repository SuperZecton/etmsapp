import 'package:flutter/material.dart';


class CircularLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 105,
      backgroundColor: Color(0xffC0C0C0),
      child: CircleAvatar(
        radius: 100,
        backgroundImage: AssetImage('images/ltcbluelogo2.jpg'),
      ),
    );
  }
}
