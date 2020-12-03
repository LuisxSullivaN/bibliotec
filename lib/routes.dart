import 'package:flutter/material.dart';

import 'package:bibliotec/ui/views/login/login.dart';

const String login = 'login';
const String register = 'login/register';
const String home = '/';
const String books = '/books';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case login:
      return MaterialPageRoute(
          builder: (context) => Login(),
          );
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(
            child: Text('Ruta desconocida'),
          ),
        ),
      );
  }
}
