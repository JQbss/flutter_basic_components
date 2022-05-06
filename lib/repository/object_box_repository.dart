import 'package:flutter_basic_components/model/event.dart';
import 'package:flutter_basic_components/objectbox.g.dart';
import 'package:flutter_basic_components/repository/event_repository.dart';
import 'package:objectbox/objectbox.dart';

class ObjectBoxRepository{
  late final Store store;
  late final Box<Event> _eventBox;
  ObjectBoxRepository._create(this.store){
    _eventBox = Box<Event>(store);
  }

  static Future<ObjectBoxRepository> create() async{
    final store = await openStore();
    return ObjectBoxRepository._create(store);
  }
}