import 'package:flutter/cupertino.dart';
import 'package:flutter_basic_components/main.dart';
import 'package:flutter_basic_components/model/event.dart';
import 'package:flutter_basic_components/utils/validators.dart';

import '../../../widgets/view_dialogs.dart';

class EventViewModel with ChangeNotifier{
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  DateTime dateTime = DateTime.now();
  final TextEditingController noteController = TextEditingController();
  List<Event> eventList = [];
  bool isNote = true;

  String? nameError;

  EventViewModel(){
    loadListHandler();
  }
  addEventHandler(BuildContext context) async {
    nameError = nameValidation(nameController.text, context);
    if(formKey.currentState!.validate()){
      Event event = Event(name: nameController.text, note: noteController.text,dateTime: dateTime);
      objectBox.events.addEvent(event);
    }
    notifyListeners();
  }

  loadListHandler(){
    objectBox.events.getEvents()?.then(
      (value) =>{
        eventList = value,
        notifyListeners()
      }
    );

  }

  changeDateHandler(BuildContext context){
    ViewDialogs.openPicker(context).then((value) =>
      dateTime = value,
    );
    notifyListeners();
  }

  noteCheckboxHandler(bool? value){
    isNote = value??false;
    notifyListeners();
  }
}
