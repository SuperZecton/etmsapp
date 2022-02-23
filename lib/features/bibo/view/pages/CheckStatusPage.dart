
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ltcapp/core/config/Globals.dart';
import 'package:intl/intl.dart';
import 'package:ltcapp/features/bibo/view/widgets/CheckStatusCard.dart';
import 'package:ltcapp/features/bibo/viewmodel/CheckStatusViewModel.dart';
import 'package:ltcapp/features/bibo/viewmodel/CheckInViewModel.dart';
import 'package:ltcapp/features/bibo/viewmodel/CheckOutViewModel.dart';
import 'package:stacked/stacked.dart';

class CheckOutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CheckStatusViewModel>.reactive(
      viewModelBuilder: ()=> CheckStatusViewModel(),
      builder: (context, model, child){
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              "Current Status",
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
            backgroundColor: darkGreenAccent,
          ),
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CheckInStatusCard(),
                ],
              ),
            ),
          ),
        );
      },

    );
  }

}
