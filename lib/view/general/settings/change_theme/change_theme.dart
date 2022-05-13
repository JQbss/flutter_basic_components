import 'package:flutter/material.dart';
import 'package:flutter_basic_components/view_model/home/settings/settings_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChangeTheme extends StatelessWidget {
  const ChangeTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SettingsViewModel(),
        child: Builder(
          builder: (context){
            SettingsViewModel settingsViewModel = Provider.of<SettingsViewModel>(context);
            settingsViewModel.setColorsLanguages(context);
            return SafeArea(
              child: Center(
                child: Column(
                  children: [
                    Text(AppLocalizations.of(context)!.changeTheme),
                    DropdownButton(
                      key: const Key("dropdownButton"),
                      value: settingsViewModel.currentTheme,
                      items: settingsViewModel.colors,
                      onChanged: (Map<String,dynamic>? value) => {settingsViewModel.changeColorHandler(value, context)},
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
