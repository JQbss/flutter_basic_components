import 'package:flutter_basic_components/model/event.dart';
import 'package:flutter_basic_components/repository/interfaces/i_event_repository.dart';
import 'package:objectbox/objectbox.dart';

class EventRepository implements IEventRepository{
  final Store _store;
  final Box<Event> _box;

  EventRepository(this._store) : _box = _store.box();

  @override
  Future<List<Event>>? getEvents() {
    List<Event> events = _box.getAll();
    return Future.value(events);
  }

}