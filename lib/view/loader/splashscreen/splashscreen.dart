import 'package:flutter/material.dart';
import 'package:flutter_basic_components/view_model/loader/loader_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoaderViewModel(),
      child: Builder(
        builder: (context) {
          LoaderViewModel loaderViewModel = LoaderViewModel();
          loaderViewModel.loadDataHandler(context);
          return Scaffold(
            body: Center(
              child: Text(AppLocalizations.of(context)!.loading),
            ),

          );
        }
      ),
    );
  }
}
