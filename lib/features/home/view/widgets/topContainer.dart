
import 'package:flutter/material.dart';


class TopContainer extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  final EdgeInsets padding;

  const TopContainer({Key key, this.height, this.width, this.padding, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding != null ? padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      decoration: BoxDecoration(
        color: Colors.lightGreen,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40.0),
          bottomRight: Radius.circular(40.0),
        )
      ),
      height: height,
      width: width,
      child: child,
    );
  }
}
