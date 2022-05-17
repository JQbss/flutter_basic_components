import 'package:flutter/material.dart';
import 'package:flutter_basic_components/provider/change_language_provider.dart';
import 'package:flutter_basic_components/view_model/home/settings/settings_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChangeLanguage extends StatelessWidget {
  const ChangeLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SettingsViewModel(),
      child: Builder(
        builder: (buildContext){
          SettingsViewModel settingsViewModel = Provider.of<SettingsViewModel>(context);
          ChangeLanguageProvider languageProvider = Provider.of<ChangeLanguageProvider>(context);
          settingsViewModel.setCurrentLanguage(languageProvider);
          return SafeArea(
            child: Center(
              child: Column(
                children: [
                  Text(AppLocalizations.of(context)!.changeLanguage),
                  DropdownButton(
                    key: const Key('dropdownButton'),
                    value: settingsViewModel.currentLanguage,
                    items: settingsViewModel.languages,
                    onChanged: (String? value) => {settingsViewModel.changeLanguageHandler(value, languageProvider)}
                  ),
                ],
              ),
            ),
          );
        },
      )
    );
  }
}
