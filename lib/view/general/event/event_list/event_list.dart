import 'package:flutter/cupertino.dart';
import 'package:flutter_basic_components/view_model/home/event/event_view_model.dart';
import 'package:provider/provider.dart';

class EventList extends StatelessWidget {
  const EventList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EventViewModel(),
      child: Builder(
        builder: (context) {
          EventViewModel eventViewModel = Provider.of<EventViewModel>(context);
          return SafeArea(
              child: Table(
                children: [
                  TableRow(
                    children: [
                      Text(eventViewModel.eventList[0].name),
                      Text(eventViewModel.eventList[0].dateTime.month.toString()),
                      Text(eventViewModel.eventList[0].note??""),
                    ]
                  )
                ],
              )
          );
        }
      ),
    );
  }
}
