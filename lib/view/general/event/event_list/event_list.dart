import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_components/view_model/home/event/event_view_model.dart';
import 'package:flutter_basic_components/widgets/list_header/list_header.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EventList extends StatelessWidget {
  const EventList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EventViewModel(),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Builder(
          builder: (context) {
            EventViewModel eventViewModel = Provider.of<EventViewModel>(context);
            return SafeArea(
                child: ListView(
                  children: [
                    Table(
                      children: [
                        TableRow(
                          children: [
                            ListHeader(title: AppLocalizations.of(context)!.ordinal),
                            ListHeader(title: AppLocalizations.of(context)!.name),
                            ListHeader(title: AppLocalizations.of(context)!.date),
                            ListHeader(title: AppLocalizations.of(context)!.note),
                          ]
                        ),
                        for(var e in eventViewModel.eventList)
                        TableRow(
                          children: [
                            Text(e.id.toString()),
                            Text(e.name),
                            Text(e.dateTime.month.toString()),
                            Text(e.note??""),
                          ]
                        )
                      ],
                    ),
                  ],
                )
            );
          }
        ),
      ),
    );
  }
}
