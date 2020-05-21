import 'package:bibliotec/routes/router.dart' as router;
import 'package:bibliotec/locator.dart';
import 'package:bibliotec/themes/theme.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  runApp(Bibliotec());
}

class Bibliotec extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bibliotec',
      initialRoute: router.login,
      onGenerateRoute: router.onGenerateRoute,
      theme: ThemeData(
          primaryColor: Color(0xFF0A1362),
          accentColor: Color(0xFF0A1362),
        textTheme: textTheme,
        primaryTextTheme: textTheme,
        accentTextTheme: textTheme,
      ),
    );
  }
}
