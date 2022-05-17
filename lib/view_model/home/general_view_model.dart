import 'package:flutter/cupertino.dart';
import 'package:flutter_basic_components/view/general/animations/animations.dart';
import 'package:flutter_basic_components/view/general/home/home.dart';
import 'package:flutter_basic_components/view/general/settings/settings.dart';

class GeneralViewModel with ChangeNotifier{
  int _selectedIndex = 0;

  final List<Widget> _widgets = [
    const Home(),
    const Animations(),
    const Settings(),
  ];

  int get selectedIndex{
    return _selectedIndex;
  }

  set selectedIndex(int index){
    _selectedIndex = index;
    notifyListeners();
  }

  Widget getWidget(){
    return _widgets.elementAt(_selectedIndex);
  }
}
