import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Validators{
  static String? nameValidation(String? email, BuildContext context){
    if(email==null || email==""){
      return AppLocalizations.of(context)!.emptyNameError;
    }
    return null;
  }
}

