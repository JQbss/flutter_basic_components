import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_components/view/general/event/add_event/add_event.dart';
import 'package:flutter_basic_components/view/general/event/event_list/event_list.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const EventList(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.event),
        onPressed: ()=>{Navigator.push(context, MaterialPageRoute(builder: (context) => const AddEvent()))},
      ),
    );
  }
}
