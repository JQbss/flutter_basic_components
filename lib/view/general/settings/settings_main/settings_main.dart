import 'package:flutter/material.dart';
import 'package:flutter_basic_components/provider/theme_provider.dart';
import 'package:flutter_basic_components/view_model/home/settings/settings_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsMain extends StatelessWidget {
  const SettingsMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        SettingsViewModel settingsViewModel = Provider.of<SettingsViewModel>(context);
        return SafeArea(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: ()=>{settingsViewModel.pageController.jumpToPage(1)},
                  child: Text(AppLocalizations.of(context)!.changeLanguage),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color(ThemeProvider().theme["defaultButton"])),
                  ),
                ),
                ElevatedButton(
                  onPressed: ()=>{settingsViewModel.pageController.jumpToPage(2)},
                  child: Text(AppLocalizations.of(context)!.changeTheme),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color(ThemeProvider().theme["defaultButton"])),
                  ),
                )
              ],
            )
        );
      }
    );
  }
}
