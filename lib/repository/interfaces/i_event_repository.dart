import 'package:flutter_basic_components/model/event.dart';

abstract class IEventRepository{
  Future<List<Event>>? getEvents();
}