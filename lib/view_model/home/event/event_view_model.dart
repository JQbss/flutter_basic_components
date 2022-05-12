import 'package:flutter/material.dart';
import 'package:flutter_basic_components/model/event.dart';
import 'package:flutter_basic_components/provider/object_box_provider.dart';
import 'package:flutter_basic_components/utils/validators.dart';
import 'package:flutter_basic_components/view/general/event/add_event/add_event.dart';
import 'package:flutter_basic_components/view/general/general.dart';

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
    nameError = Validators.nameValidation(nameController.text, context);
    if(formKey.currentState!.validate()){
      Event event = Event(name: nameController.text, note: noteController.text,dateTime: dateTime);
      await ObjectBoxProvider().objectBoxRepositories?.events.addEvent(event);
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const General()), (route) => false);
    }
    notifyListeners();
  }

  loadListHandler()async{
    eventList = await ObjectBoxProvider().objectBoxRepositories?.events.getEvents()??[];
    notifyListeners();
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

  navigateToAddEvent(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddEvent())
    );
  }
}
