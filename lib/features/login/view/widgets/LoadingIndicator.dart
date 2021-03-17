
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class LoadingIndicator extends StatefulWidget {
  @override
  _LoadingIndicatorState createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator> {
  @override
  Widget build(BuildContext context) {
    return SpinKitSquareCircle(
      color: Colors.white,
      size: 50.0,

    );
  }
}


final spinKit = SpinKitSquareCircle(
  color: Colors.white,
  size: 50.0,

);