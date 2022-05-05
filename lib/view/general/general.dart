import 'package:flutter/material.dart';
import 'package:flutter_basic_components/view_model/home/general_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class General extends StatelessWidget {
  const General({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GeneralViewModel(),
      child: Builder(
        builder: (context) {
          GeneralViewModel generalViewModel = Provider.of<GeneralViewModel>(context);
          return Scaffold(
            body: generalViewModel.getWidget(),
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(Icons.home),
                  label: AppLocalizations.of(context)!.home,
                  backgroundColor: Colors.red,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.settings),
                  label: AppLocalizations.of(context)!.settings,
                  backgroundColor: Colors.blue,
                ),
              ],
              currentIndex: generalViewModel.selectedIndex,
              onTap: (int index)=>{generalViewModel.selectedIndex=index},
            ),
          );
        }
      ),
    );
  }
}
