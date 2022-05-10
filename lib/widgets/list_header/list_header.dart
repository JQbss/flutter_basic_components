import 'package:flutter/material.dart';
import 'package:flutter_basic_components/provider/theme_provider.dart';

class ListHeader extends StatelessWidget {
  final String title;
  const ListHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      color: Color(ThemeProvider().theme["tableHeader"]),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Color(ThemeProvider().theme["headerText"]),
          ),
        ),
      ),
    );
  }
}
