import 'package:flutter/material.dart';

const String login = 'login';
const String register = 'login/register';
const String home = '/';
const String books = '/books';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case login:
      return MaterialPageRoute();
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
