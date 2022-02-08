import 'package:flutter/material.dart';
import 'package:ltcapp/features/home/viewmodel/AfterLoginPageViewModel.dart';
import 'package:stacked/stacked.dart';

class AfterLoginPage extends StatelessWidget {
  const AfterLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AfterLoginViewModel>.nonReactive(
        viewModelBuilder: () => AfterLoginViewModel(),
        builder: (context, model, child) {
          return Container();
        });
  }
}
