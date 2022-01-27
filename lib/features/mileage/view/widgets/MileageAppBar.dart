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
    return SliverAppBar(
        pinned: true,
        snap: false,
        floating: false,
        expandedHeight: 200.0,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text(
            'Mileage',
            style: GoogleFonts.roboto(
              fontSize: 30.0,
              color: Colors.white,
            ),
          ),
          background: Container(
            color: darkPrimary500,
          ),
        ));
  }
}
