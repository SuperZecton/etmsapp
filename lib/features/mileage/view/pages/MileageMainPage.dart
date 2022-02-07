import 'package:flutter/material.dart';
import 'package:ltcapp/core/config/Globals.dart';
import 'package:ltcapp/features/mileage/view/widgets/MileageAppBar.dart';
import 'package:ltcapp/features/mileage/view/widgets/MileageList.dart';
import 'package:ltcapp/features/mileage/viewmodel/MileageViewModel.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class MileageMainPage extends StatefulWidget {
  @override
  _MileageMainPageState createState() => _MileageMainPageState();
}

class _MileageMainPageState extends State<MileageMainPage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MileageViewModel>.reactive(
      viewModelBuilder: () => MileageViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            title: Text("Mileage History"),
            centerTitle: true,
          ),
          body: MileageList(),
        );
      },
    );
  }
}
