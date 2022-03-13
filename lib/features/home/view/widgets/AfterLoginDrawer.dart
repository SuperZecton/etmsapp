import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ltcapp/features/home/viewmodel/AfterLoginPageViewModel.dart';
import 'package:ltcapp/features/home/viewmodel/HomePageViewModel.dart';
import 'package:stacked/stacked.dart';

class AfterLoginDrawer extends ViewModelWidget<AfterLoginViewModel> {
  const AfterLoginDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, AfterLoginViewModel model) {
    double _drawerWidth = MediaQuery.of(context).size.width / 2;
    return Container(
      width: _drawerWidth,
      child: Drawer(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 40.0,
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.clock),
              title: Text('ORD Counter'),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.userCircle),
              title: Text('App Settings'),
              onTap: () => model.onSettingsTap(context),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.arrowLeft),
              title: Text('Log out'),
              onTap: () => model.onLogOutTap(context),

            ),
          ],
        ),
      ),
    );
  }
}
