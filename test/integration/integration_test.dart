import 'package:flutter/material.dart';
import 'package:flutter_basic_components/provider/change_language_provider.dart';
import 'package:flutter_basic_components/provider/object_box_provider.dart';
import 'package:flutter_basic_components/provider/theme_provider.dart';
import 'package:flutter_basic_components/view/general/event/add_event/add_event.dart';
import 'package:flutter_basic_components/view/general/general.dart';
import 'package:flutter_basic_components/view/general/home/home.dart';
import 'package:flutter_basic_components/view_model/home/general_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main(){
  group('Test integration', (){



    widgetHomeTest(home){
      return MultiProvider(
        providers: [
          ChangeNotifierProvider<ChangeLanguageProvider>(create: (context) => ChangeLanguageProvider()),
          ChangeNotifierProvider<ThemeProvider>(create: (context) => ThemeProvider()),
          ChangeNotifierProvider<ObjectBoxProvider>(create: (context) => ObjectBoxProvider()),
        ],
        child: Builder(
            builder: (context) {
              final languageProvider = Provider.of<ChangeLanguageProvider>(context);
              return MaterialApp(
                locale: languageProvider.currentLocale,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                home: home,
              );
            }
        ),
      );
    }

    testWidgets('Test home screen', (WidgetTester tester) async{

      await tester.pumpWidget(widgetHomeTest(const Home()));

      expect(find.byIcon(Icons.event), findsOneWidget);
      await tester.tap(find.byIcon(Icons.event));
      await tester.pumpAndSettle();
      expect(find.byType(AddEvent), findsOneWidget);
    });

    testWidgets('Test general screen', (WidgetTester tester) async{
      late GeneralViewModel generalViewModel;

      await tester.pumpWidget(
        widgetHomeTest(
          ChangeNotifierProvider(
            create: (context) =>GeneralViewModel(),
            child: Builder(
              builder: (context) {
                generalViewModel = Provider.of<GeneralViewModel>(context);
                return const General();
              },
            ),
          )
        )
      );
      expect(find.byIcon(Icons.settings), findsOneWidget);
      await tester.tap(find.byIcon(Icons.settings)).then((value) => generalViewModel.selectedIndex=1);
      expect(generalViewModel.selectedIndex, 1);
    });
  });
}
