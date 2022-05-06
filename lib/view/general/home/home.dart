import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_components/view/general/event/add_event/add_event.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.event),
        onPressed: ()=>{Navigator.push(context, MaterialPageRoute(builder: (context) => const AddEvent()))},
      ),
    );
  }
}
