import 'package:flutter/material.dart';
import 'package:flutter_basic_components/model/event.dart';
import 'package:flutter_basic_components/repository/event_repository.dart';
import 'package:flutter_basic_components/view_model/home/event/event_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'event_api_test.mocks.dart';

class EventRepositoryTest extends Mock implements EventRepository{}

class BuildContextTest extends Mock implements BuildContext{}

class EventViewModelTest extends Mock implements EventViewModel{}

@GenerateMocks([EventRepositoryTest])
@GenerateMocks([EventViewModelTest])
Future<void> main() async {
  late EventRepositoryTest eventRepository;
  late EventViewModelTest eventViewModel;
  late BuildContextTest contextTest;


  setUpAll((){
    eventRepository = MockEventRepositoryTest();
    eventViewModel = MockEventViewModelTest();
    contextTest = BuildContextTest();
  });


  group('Given Event List', (){
    test('Page should load a list of events from ObjectBox', () async{
      final List<Event> events = [];

      when(eventRepository.getEvents()).thenAnswer((_) async{
        return events;
      });

      final res = await eventRepository.getEvents();

      expect(res, isA<List<Event>>());
      expect(res, events);
    });
  });

  group('Event View Model tests', (){
    test('View model should a list of events from ObjectBox', () async {
      final List<Event> events = [];

      when(eventRepository.getEvents()).thenAnswer((_) async{
        return events;
      });

      when(eventViewModel.loadListHandler()).thenAnswer((_) async{
        return true;
      });

      when(eventViewModel.eventList).thenAnswer((_) {
        return [];
      });

      expect(eventViewModel.eventList, events);
    });
    test('View model should add new element to list',() async{

      final Event newEvent = Event(name: 'test1', dateTime: DateTime(100),note: "note1",id: 1);

      when(eventRepository.addEvent(newEvent)).thenAnswer((_) async{
        return newEvent;
      });

      when(eventViewModel.addEventHandler(contextTest)).thenAnswer((_) async{
        return newEvent;
      });

      when(eventViewModel.eventList).thenAnswer((_) {
        return [newEvent];
      });

      expect(eventViewModel.eventList[0], newEvent);

    });
  });
}
