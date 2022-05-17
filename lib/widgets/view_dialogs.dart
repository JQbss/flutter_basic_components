import 'package:flutter/cupertino.dart';

DateTime dateTime = DateTime.now();

class ViewDialogs{
  static Future<DateTime> openPicker(
      BuildContext context,
  )async{
    await showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return Container(
          height: 220,
          color: CupertinoColors.systemBackground.resolveFrom(context),
          child: CupertinoDatePicker(
            key: const Key("datePicker"),
            mode: CupertinoDatePickerMode.dateAndTime,
            use24hFormat: true,
            onDateTimeChanged: (newDateTime) =>
            {
              dateTime = newDateTime
            },
            initialDateTime: DateTime.now(),
          ),
        );
      },
    );
    return dateTime;
  }
}
