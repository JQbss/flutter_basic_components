import 'package:flutter/material.dart';
import 'package:flutter_basic_components/repository/object_box_repositories.dart';

class ObjectBoxProvider with ChangeNotifier{
  static ObjectBoxRepositories? _objectBoxRepositories;

  ObjectBoxRepositories? get objectBoxRepositories{
    return _objectBoxRepositories;
  }

  set objectBoxRepositories(ObjectBoxRepositories? newObjectBox){
    _objectBoxRepositories = newObjectBox;
    notifyListeners();
  }
}
