import 'package:flutter_basic_components/model/event.dart';
import 'package:flutter_basic_components/repository/event_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'event_api_test.mocks.dart';

class EventRepositoryTest extends Mock implements EventRepository{}

@GenerateMocks([EventRepositoryTest])
Future<void> main() async {
  late EventRepositoryTest eventRepository;


  setUpAll((){
    eventRepository = MockEventRepositoryTest();
  });


  group('Given Event List', (){
    test('Page should load a list of events from ObjectBox', () async{
      final List<Event> events;
      when(eventRepository.getEvents()
      ).thenAnswer((_) async{
        return events;
      });
      /*final res = eventRepository.*/
    });
  });
}
