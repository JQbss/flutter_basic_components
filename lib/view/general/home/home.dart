import 'package:flutter/material.dart';
import 'package:flutter_basic_components/view/general/event/event_list/event_list.dart';
import 'package:flutter_basic_components/view_model/home/event/event_view_model.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>EventViewModel(),
      child: Builder(
          builder: (context) {
            EventViewModel eventViewModel = Provider.of<EventViewModel>(context);
            return Scaffold(
              body: const EventList(),
              floatingActionButton: FloatingActionButton(
                child: const Icon(Icons.event),
                onPressed: ()=>{eventViewModel.navigateToAddEvent(context)},
              ),
            );
          }
      ),
    );
  }
}
