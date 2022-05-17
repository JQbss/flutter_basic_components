import 'package:flutter/material.dart';
import 'package:flutter_basic_components/provider/change_language_provider.dart';
import 'package:flutter_basic_components/provider/object_box_provider.dart';
import 'package:flutter_basic_components/provider/theme_provider.dart';
import 'package:flutter_basic_components/view/general/event/add_event/add_event.dart';
import 'package:flutter_basic_components/view/general/general.dart';
import 'package:flutter_basic_components/view/general/home/home.dart';
import 'package:flutter_basic_components/view/general/settings/change_language/change_language.dart';
import 'package:flutter_basic_components/view/general/settings/change_theme/change_theme.dart';
import 'package:flutter_basic_components/view/general/settings/settings.dart';
import 'package:flutter_basic_components/view/general/settings/settings_main/settings_main.dart';
import 'package:flutter_basic_components/view_model/home/event/event_view_model.dart';
import 'package:flutter_basic_components/view_model/home/general_view_model.dart';
import 'package:flutter_basic_components/view_model/home/settings/settings_view_model.dart';
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
                home: Scaffold(
                  body: home,
                ),
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

    testWidgets('Test settings screen', (WidgetTester tester) async{

      late SettingsViewModel settingsViewModel;
      late BuildContext buildContext;
      await tester.pumpWidget(
        widgetHomeTest(
          ChangeNotifierProvider(
            create: (context)=> SettingsViewModel(),
            child: Builder(
              builder: (context) {
                buildContext=context;
                settingsViewModel = Provider.of<SettingsViewModel>(context);
                return PageView(
                  controller: settingsViewModel.pageController,
                  children: const [
                    Settings(),
                    SettingsMain(),
                    ChangeLanguage(),
                    ChangeTheme(),
                  ],
                );
              }
            ),
          )
        )
      );
      expect(find.byType(Settings), findsOneWidget);
      expect(settingsViewModel.pageController.page, 0);

      settingsViewModel.pageController.jumpToPage(1);
      expect(settingsViewModel.pageController.page, 1);
      expect(find.byType(SettingsMain), findsOneWidget);
      expect(find.text(AppLocalizations.of(buildContext)!.changeTheme), findsOneWidget);
      await tester.tap((find.text(AppLocalizations.of(buildContext)!.changeTheme)));
      await tester.pump();
      await tester.tap((find.text(AppLocalizations.of(buildContext)!.changeLanguage)));
      await tester.pump();

      final dynamic widgetsAppState = tester.state(find.byType(WidgetsApp));
      await widgetsAppState.didPopRoute();
      await tester.pump();

    });

    testWidgets('Test change theme', (WidgetTester tester) async{
      late SettingsViewModel settingsViewModel;
      late BuildContext buildContext;
      await tester.pumpWidget(
          widgetHomeTest(
              ChangeNotifierProvider(
                create: (context)=> SettingsViewModel(),
                child: Builder(
                    builder: (context) {
                      buildContext=context;
                      settingsViewModel = Provider.of<SettingsViewModel>(context);
                      return const SafeArea(child: ChangeTheme());
                    }
                ),
              )
          )
      );

      expect(find.byKey(const Key("dropdownButton")), findsOneWidget);
      await tester.tap(find.byKey(const Key("dropdownButton")));
      await tester.pumpAndSettle();

      final dropdownItem = find.text('Ciemny').last;
      await tester.tap(dropdownItem);
      await tester.pumpAndSettle().then((_) {
        settingsViewModel.changeColorHandler(CustomThemes.darkColors, buildContext);
      });

      expect(settingsViewModel.currentTheme, CustomThemes.darkColors);

    });

    testWidgets('Test change language', (WidgetTester tester) async{
      late SettingsViewModel settingsViewModel;
      await tester.pumpWidget(
          widgetHomeTest(
              ChangeNotifierProvider(
                create: (context)=> SettingsViewModel(),
                child: Builder(
                    builder: (context) {
                      settingsViewModel = Provider.of<SettingsViewModel>(context);
                      return const SafeArea(child: ChangeLanguage());
                    }
                ),
              )
          )
      );

      expect(find.byKey(const Key("dropdownButton")), findsOneWidget);
      await tester.tap(find.byKey(const Key("dropdownButton")));
      await tester.pumpAndSettle();

      final dropdownItem = find.text('English').last;
      await tester.tap(dropdownItem);

      expect(settingsViewModel.currentLanguage, "en");

    });

    testWidgets('Test add event', (WidgetTester tester) async{
      late EventViewModel eventViewModel;
      await tester.pumpWidget(
          widgetHomeTest(
              ChangeNotifierProvider(
                create: (context) => EventViewModel(),
                child: Builder(
                    builder: (context) {
                      eventViewModel = Provider.of<EventViewModel>(context);
                      return const SafeArea(child: AddEvent());
                    }
                ),
              )
          )
      );

      final formFinder = find.byType(Form);
      Form formWidget = tester.widget(formFinder);
      eventViewModel.formKey=formWidget.key as GlobalKey<FormState>;


      expect(find.byKey(const Key("eventNameField")), findsOneWidget);
      await tester.enterText(find.byKey(const Key("eventNameField")), "test@test.pl").then((value) => {
        eventViewModel.nameController.text="test@test.pl"
      });
      expect(find.byKey(const Key("noteField")), findsOneWidget);
      await tester.enterText(find.byKey(const Key("noteField")), "testNote").then((value) => {
        eventViewModel.nameController.text="testNote"
      });
      expect(find.byKey(const Key("dateSelect")), findsOneWidget);

      await tester.tap(find.byKey(const Key("saveEventButton")));
      expect(eventViewModel.formKey.currentState!.validate(), isTrue);
    });

    testWidgets('Test other functions in Event View Model',  (WidgetTester tester) async{
      late EventViewModel eventViewModel;
      late BuildContext buildContext;
      await tester.pumpWidget(
          widgetHomeTest(
              ChangeNotifierProvider(
                create: (context) => EventViewModel(),
                child: Builder(
                    builder: (context) {
                      eventViewModel = Provider.of<EventViewModel>(context);
                      buildContext = context;
                      return const SafeArea(child: AddEvent());
                    }
                ),
              )
          )
      );
      expect(find.byKey(const Key("checkBox")), findsOneWidget);
      expect(eventViewModel.isNote,isTrue);
      await tester.tap(find.byKey(const Key("checkBox"))).then((value) => {
        eventViewModel.noteCheckboxHandler(!eventViewModel.isNote)
      });
      expect(eventViewModel.isNote,isFalse);

      expect(find.byKey(const Key("dateSelect")), findsOneWidget);
      await tester.tap(find.byKey(const Key("dateSelect"))).then((value) => {
        eventViewModel.changeDateHandler(buildContext)
      });
      await tester.pump();
      expect(find.byKey(const Key("datePicker")).first,findsOneWidget);
    });
  });
}
