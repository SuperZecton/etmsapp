import 'package:flutter/material.dart';
import 'package:ltcapp/core/config/globals.dart';
import 'package:ltcapp/features/mileage/view/widgets/MileageAppBar.dart';
import 'package:ltcapp/features/mileage/view/widgets/MileageList.dart';
import 'package:ltcapp/features/mileage/viewmodel/MileageViewModel.dart';
import 'package:provider/provider.dart';

class MileageMainPage extends StatefulWidget {
  @override
  _MileageMainPageState createState() => _MileageMainPageState();
}

class _MileageMainPageState extends State<MileageMainPage> {
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<MileageViewModel>(context, listen: false);
    return Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            MileageAppBar(),
            MileageList(),


          ]
        ),
    );
  }
}
