import 'package:flutter/material.dart';

import 'core/service_locator.dart';
import 'routes.dart' as routes;
import 'theme.dart';

void main() {
  initServiceLocator();
  runApp(Bibliotec());
}

class Bibliotec extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bibliotec',
      initialRoute: routes.login,
      onGenerateRoute: routes.onGenerateRoute,
      theme: ThemeData(
        colorScheme: colorScheme,
        primaryColor: colorScheme.primary,
        accentColor: colorScheme.secondary,
        backgroundColor: colorScheme.background,
        textTheme: textTheme,
        primaryTextTheme: textTheme,
        accentTextTheme: textTheme,
      ),
    );
  }
}
