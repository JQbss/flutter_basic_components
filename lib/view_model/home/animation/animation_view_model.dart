import 'package:flutter/material.dart';

class AnimationViewModel with ChangeNotifier{
  double _margin = 0;
  double _width = 400;
  Color _color = Colors.green;
  bool _isMargin = false;
  bool _isWidth = false;
  bool _isColor = false;

  double get margin{
    return _margin;
  }

  double get width{
    return _width;
  }

  Color get color{
    return _color;
  }

  set margin(double newMargin){
    if(_isMargin){
      _margin = 0;
      _isMargin = false;
    }else{
      _margin = newMargin;
      _isMargin = true;
    }
    notifyListeners();
  }

  set color(Color newColor){
    if(_isColor){
      _color = Colors.green;
      _isColor = false;
    }else{
      _color = newColor;
      _isColor = true;
    }
    notifyListeners();
  }

  set width(double newWidth){
    if(_isWidth){
      _width = 400;
      _isWidth = false;
    }else{
      _width = newWidth;
      _isWidth = true;
    }
    notifyListeners();
  }

}
