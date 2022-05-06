import 'package:flutter/material.dart';
import 'package:flutter_basic_components/view/general/settings/change_language/change_language.dart';
import 'package:flutter_basic_components/view/general/settings/change_theme/change_theme.dart';
import 'package:flutter_basic_components/view/general/settings/settings_main/settings_main.dart';
import 'package:flutter_basic_components/view_model/home/settings/settings_view_model.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SettingsViewModel(),
      child: Builder(
        builder: (context) {
          SettingsViewModel settingsViewModel = Provider.of(context);
          settingsViewModel.pageController = PageController(initialPage: 0, keepPage: false);
          return WillPopScope(
            onWillPop: () async{
              settingsViewModel.pageController.jumpToPage(0);
              return false;
            },
            child: Scaffold(
              body: PageView(
                controller: settingsViewModel.pageController,
                children: [
                  SettingsMain(),
                  ChangeLanguage(),
                  ChangeTheme(),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
