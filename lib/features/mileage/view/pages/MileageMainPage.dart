import 'package:flutter/material.dart';
import 'package:ltcapp/core/config/Globals.dart';
import 'package:ltcapp/features/mileage/view/widgets/MileageAppBar.dart';
import 'package:ltcapp/features/mileage/view/widgets/MileageListCard.dart';
import 'package:ltcapp/features/mileage/viewmodel/MileageViewModel.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class MileageMainPage extends StatelessWidget {
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
          body: ListView.builder(
            itemCount: model.dataReady ? model.data.length : 0,
            itemBuilder: (context, index) {
              final item = model.data[index];
              return MileageListCard(
                vehicleNo: item[0],
                date: item[1],
                startOdo: item[2],
                endOdo: item[3],
                mileage: item[4],
              );
            },
          ),
        );
      },
    );
  }
}
