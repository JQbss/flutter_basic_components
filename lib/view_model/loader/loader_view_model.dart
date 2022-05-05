import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';

class LoaderViewModel with ChangeNotifier{
  loadDataHandler(BuildContext context){
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      Navigator.pushNamedAndRemoveUntil(context, "/general", (route)=>false);
    });
  }
}
