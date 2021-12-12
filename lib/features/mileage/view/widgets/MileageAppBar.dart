import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ltcapp/core/config/globals.dart';

class MileageAppBar extends StatefulWidget {
  @override
  _MileageAppBarState createState() => _MileageAppBarState();
}

class _MileageAppBarState extends State<MileageAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      snap: false,
      floating: false,
      expandedHeight: 240.0,
      flexibleSpace:FlexibleSpaceBar(
        title: Text('Mileage'),
        background: Container(
          color: Colors.blue,
        ),
      )

    );
  }
}



