import 'package:flutter/material.dart';
import 'package:ltcapp/features/home/viewmodel/HomePageViewModel.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class DropDownList extends ViewModelWidget<HomePageViewModel> {
  const DropDownList({Key? key}) : super(key: key, reactive: true);
  @override
  Widget build(BuildContext context, HomePageViewModel model) {
    return Container(
      margin: EdgeInsets.only(right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          DropdownButton(
                isDense: true,
                value: model.campDropdown,
                onChanged: (String? value) => model.campDropDownUpdate(value),
                items: HomePageViewModel.campDropdownItems.map((String title) {
                  return DropdownMenuItem(
                    value: title,
                    child: Text(title,
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0)),
                  );
                }).toList()).

        ],
      ),
    );
  }
}
