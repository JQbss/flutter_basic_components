import 'package:flutter/cupertino.dart';

class ThemeProvider with ChangeNotifier{
  static Map<String, dynamic> _theme = CustomThemes.lightColors;

  Map<String,dynamic> get theme{
    return _theme;
  }

  set theme(Map<String,dynamic> newTheme){
    _theme=newTheme;
    notifyListeners();
  }
}

class CustomThemes{
  static Map<String,dynamic> lightColors = {
    "defaultButton": 0xFFAFE01F,
    "tableHeader": 0xFF98C761,
    "headerText" : 0xFF000000
  };

  static Map<String,dynamic> darkColors = {
    "defaultButton":0xFF019402,
    "tableHeader": 0xFF264700,
    "headerText" : 0xFFFFFFFF
  };
}
