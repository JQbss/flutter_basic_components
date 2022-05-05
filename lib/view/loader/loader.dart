import 'package:flutter/material.dart';
import 'package:flutter_basic_components/provider/change_language_provider.dart';
import 'package:flutter_basic_components/view/general/general.dart';
import 'package:flutter_basic_components/view/loader/splashscreen/splashscreen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<ChangeLanguageProvider>(create: (context) => ChangeLanguageProvider())
    ],
    child: Builder(
      builder: (context){
        final languageProvider = Provider.of<ChangeLanguageProvider>(context);
        return MaterialApp(
          locale: languageProvider.currentLocale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          initialRoute: '/',
          routes: {
            '/home': (context) => const General(),
          },
          home: const Splashscreen(),
        );
      },
    ),
    );
  }
}
