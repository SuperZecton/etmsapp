import 'package:flutter/material.dart';
import 'package:ltcapp/features/home/viewmodel/HomePageViewModel.dart';
import 'package:stacked/stacked.dart';

class FullNameTextWidget extends ViewModelWidget<HomePageViewModel> {
  const FullNameTextWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, HomePageViewModel model) {
    return FutureBuilder<String>(
        future: model.getFullName(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Text(
                'Loading..',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              );
            case ConnectionState.done:
              return Text(
                snapshot.data!,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              );
            default:
              return Text(
                'State is ${snapshot.connectionState}',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              );
          }
        });
  }
}
