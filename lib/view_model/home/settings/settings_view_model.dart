import 'package:flutter/material.dart';
import 'package:flutter_basic_components/provider/change_language_provider.dart';
import 'package:flutter_basic_components/provider/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsViewModel with ChangeNotifier{

  final PageController _pageController = PageController(initialPage: 0, keepPage: false);
  final List<DropdownMenuItem<String>>? _languages =[
    const DropdownMenuItem(child: Text("Polski"), value: "pl"),
    const DropdownMenuItem(child: Text("English"), value: "en"),
  ];
  List<DropdownMenuItem<Map<String,dynamic>>> _colors = [
    DropdownMenuItem(child:const Text("Jasny"), value: CustomThemes.lightColors),
    DropdownMenuItem(child: const Text("Ciemny"), value: CustomThemes.darkColors,)
  ];

  String currentLanguage = ChangeLanguageProvider().currentLocale.toString();
  Map<String,dynamic> currentTheme = ThemeProvider().theme;

  List<DropdownMenuItem<String>>? get languages{
    return _languages;
  }

  List<DropdownMenuItem<Map<String,dynamic>>> get colors{
    return _colors;
  }

  PageController get pageController{
    return _pageController;
  }

  void setColorsLanguages(BuildContext context){
    _colors =[
      DropdownMenuItem(child:Text(AppLocalizations.of(context)!.light), value: CustomThemes.lightColors),
      DropdownMenuItem(child: Text(AppLocalizations.of(context)!.dark), value: CustomThemes.darkColors,)
    ];
  }
  changeLanguageHandler(String? value, BuildContext context){
    currentLanguage=value!;
    context.read<ChangeLanguageProvider>().currentLocale=Locale(value);
    notifyListeners();
  }

  changeColorHandler(Map<String,dynamic>? value, BuildContext context){
    currentTheme=value!;
    context.read<ThemeProvider>().theme = value;
    notifyListeners();
  }

}
