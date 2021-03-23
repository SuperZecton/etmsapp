
import 'package:flutter/material.dart';
import 'package:ltcapp/features/home/viewmodel/HomePageViewModel.dart';
import 'package:provider/provider.dart';

class DateDropDownList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Consumer<HomePageViewModel>(
            builder: (context, vm, child) => DropdownButton(
                isDense: true,
                value: vm.dateDropdown,
                onChanged: (String value) => vm.dateDropDownUpdate(value),
                items: HomePageViewModel.dateDropdownItems
                    .map((String title) {
                  return DropdownMenuItem(
                    value: title,
                    child: Text(title,
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0)),
                  );
                }).toList()),
          ),
        ],
      ),
    );

  }
}
