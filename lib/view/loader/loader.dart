import 'package:flutter/material.dart';
import 'package:flutter_basic_components/provider/change_language_provider.dart';
import 'package:flutter_basic_components/provider/object_box_provider.dart';
import 'package:flutter_basic_components/provider/theme_provider.dart';
import 'package:flutter_basic_components/repository/object_box_repositories.dart';
import 'package:flutter_basic_components/view/general/general.dart';
import 'package:flutter_basic_components/view/loader/splashscreen/splashscreen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<ChangeLanguageProvider>(create: (context) => ChangeLanguageProvider()),
      ChangeNotifierProvider<ThemeProvider>(create: (context) => ThemeProvider()),
      ChangeNotifierProvider<ObjectBoxProvider>(create: (context) => ObjectBoxProvider()),
    ],
      child: Builder(
        builder: (context){
          final languageProvider = Provider.of<ChangeLanguageProvider>(context);
          final objectBoxProvider = Provider.of<ObjectBoxProvider>(context);

          if(objectBoxProvider.objectBoxRepositories==null) {
            ObjectBoxRepositories.create(null).then((value) =>
            {
              objectBoxProvider.objectBoxRepositories = value
            });
          }
          return MaterialApp(
            locale: languageProvider.currentLocale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            initialRoute: '/',
            routes: {
              '/general': (context) => const General(),
            },
            home: const Splashscreen(),
          );
        },
      ),
    );
  }
}
