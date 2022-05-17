import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_components/view_model/home/event/event_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              body: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key: eventViewModel.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppLocalizations.of(context)!.eventName),
                      TextFormField(
                        key: const Key("eventNameField"),
                        controller: eventViewModel.nameController,
                        validator: (String? item){
                          return eventViewModel.nameError;
                        },
                      ),
                      Row(
                        children: [
                          Text(AppLocalizations.of(context)!.eventDate),
                          CupertinoButton(
                            key: const Key("dateSelect"),
                            child: Text('${eventViewModel.dateTime.hour}:${eventViewModel.dateTime.minute} ${eventViewModel.dateTime.day}-${eventViewModel.dateTime.month}-${eventViewModel.dateTime.year} '),
                            onPressed: ()=>{eventViewModel.changeDateHandler(context)}
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            key: const Key("checkBox"),
                            value: eventViewModel.isNote,
                            onChanged: eventViewModel.noteCheckboxHandler,
                          ),
                          Text(AppLocalizations.of(context)!.eventIsNote),
                        ],
                      ),
                      eventViewModel.isNote?Text(AppLocalizations.of(context)!.eventNote):Container(),
                      eventViewModel.isNote?TextFormField(key:const Key("noteField"),controller: eventViewModel.noteController):Container(),
                      ElevatedButton(
                        key: const Key("saveEventButton"),
                        onPressed: ()=>{eventViewModel.addEventHandler(context)},
                        child: Text(AppLocalizations.of(context)!.addEvent),
                      ),
                    ],
                  ),
                ),
              )
            )
          );
        }
      ),
    );
  }
}
