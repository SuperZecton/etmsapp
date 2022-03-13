import 'package:flutter/material.dart';
import 'package:ltcapp/features/home/viewmodel/SettingsViewModel.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:stacked/stacked.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
        viewModelBuilder: () => SettingsViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(),
            body: SettingsList(
              sections: [
                SettingsSection(tiles:<SettingsTile>[
                  SettingsTile.switchTile(
                    enabled: true,
                    onToggle: (value) => model.onStayLoggedInTap(value),
                    initialValue: model.fetchingStayLoggedIn ? false : model.fetchedStayLoggedIn,
                    leading: Icon(Icons.format_paint),
                    title: Text('Stay Logged in'),
                  ),
                ],),
              ],
            ),
          );
        });
  }
}
