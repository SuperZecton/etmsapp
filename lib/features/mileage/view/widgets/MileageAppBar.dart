import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/core/config/Globals.dart';
import 'package:ltcapp/features/mileage/viewmodel/MileageViewModel.dart';
import 'package:stacked/stacked.dart';

class MileageAppBar extends ViewModelWidget<MileageViewModel> {
  const MileageAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, MileageViewModel model) {
    return AppBar(
      backgroundColor: darkPrimary500,
      title: Text("Mileage History"),
      centerTitle: true,
    );
  }
}
