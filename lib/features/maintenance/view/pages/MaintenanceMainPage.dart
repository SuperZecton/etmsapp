import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ltcapp/core/config/Globals.dart';
import 'package:intl/intl.dart';
import 'package:ltcapp/features/maintenance/viewmodel/MaintenanceMainViewModel.dart';
import 'package:stacked/stacked.dart';

class MaintenanceMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MaintenanceMainViewModel>.reactive(
        viewModelBuilder: () => MaintenanceMainViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                "Stuff",
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
              leading: GestureDetector(
                onTap: () => {
                  Navigator.pop(context),
                },
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.black,
                ),
              ),
              backgroundColor: Colors.white,
            ),
            body: SingleChildScrollView(
              child: Container(),
            ),
          );
        });
  }
}
