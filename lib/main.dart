import 'package:flutter/material.dart';
import 'package:flutter_basic_components/repository/object_box_repositories.dart';
import 'package:flutter_basic_components/view/loader/loader.dart';

late ObjectBoxRepositories objectBox;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectBox = await ObjectBoxRepositories.create();
  runApp(const Loader());
}
