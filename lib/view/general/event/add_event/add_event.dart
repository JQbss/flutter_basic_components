import 'package:flutter/material.dart';
import 'package:flutter_basic_components/view_model/home/event/event_view_model.dart';
import 'package:provider/provider.dart';

class AddEvent extends StatelessWidget {
  const AddEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>EventViewModel(),
      child: Builder(
        builder: (context) {
          EventViewModel eventViewModel = Provider.of<EventViewModel>(context);
          return SafeArea(
              child: Scaffold(
                body: Column(
                  children: [

                  ],
                ),
              )
          );
        }
      ),
    );
  }
}
