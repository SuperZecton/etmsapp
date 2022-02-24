import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/core/config/Globals.dart';
import 'package:intl/intl.dart';
import 'package:ltcapp/features/bibo/view/widgets/CheckStatusCard.dart';
import 'package:ltcapp/features/bibo/viewmodel/CheckInViewModel.dart';
import 'package:ltcapp/features/bibo/viewmodel/CheckOutViewModel.dart';
import 'package:stacked/stacked.dart';

class CheckOutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CheckOutViewModel>.reactive(
      viewModelBuilder: () => CheckOutViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              "Check Out",
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
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CheckInStatusCard(
                    checkInTime: model.fetchingStatus
                        ? ''
                        : model.fetchedStatus[1].toString(),
                    checkInDate: model.fetchingStatus
                        ? ''
                        : model.fetchedStatus[0].toString(),
                    location: model.fetchingStatus
                        ? ''
                        : model.fetchedStatus[2].toString(),
                    status: model.fetchingStatus
                        ? ''
                        : model.fetchedStatus[3].toString(),
                  ),
                  _bookOutButton(context, model),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _bookOutButton(BuildContext context, CheckOutViewModel model) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: InkWell(
        onTap: () => model.onSubmit(context),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          padding: EdgeInsets.symmetric(vertical: 13),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(24)),
            color: darkGreenAccent,
          ),
          child: Text(
            'Check Out',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
