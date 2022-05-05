import 'package:flutter/material.dart';
import 'package:flutter_basic_components/provider/change_language_provider.dart';
import 'package:provider/provider.dart';

class SettingsViewModel with ChangeNotifier{
  PageController pageController = PageController();
  final List<DropdownMenuItem<String>>? _languages =[
    const DropdownMenuItem(child: Text("Polski"), value: "pl"),
    const DropdownMenuItem(child: Text("English"), value: "en"),
  ];
  String currentLanguage = "pl";
  List<DropdownMenuItem<String>>? get languages{
    return _languages;
  }

  changeLanguageHandler(String? value, BuildContext context){
    currentLanguage=value!;
    context.read<ChangeLanguageProvider>().currentLocale=Locale(value);
    notifyListeners();
  }
}
