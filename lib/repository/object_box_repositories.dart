import 'package:flutter_basic_components/objectbox.g.dart';
import 'package:flutter_basic_components/repository/event_repository.dart';
import 'package:flutter_basic_components/repository/interfaces/i_database_repositories.dart';

class ObjectBoxRepositories implements IDatabaseRepositories{
  final Store _store;
  @override
  final EventRepository events;

  static Future<ObjectBoxRepositories> create(String? path) async =>
      ObjectBoxRepositories._(await openStore(directory: path));

  ObjectBoxRepositories._(this._store) : events = EventRepository(_store);


}
