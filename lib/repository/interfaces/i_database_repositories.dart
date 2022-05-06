import 'package:flutter_basic_components/repository/interfaces/i_event_repository.dart';

abstract class IDatabaseRepositories{
  IEventRepository get events;
}