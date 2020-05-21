import 'package:bibliotec/screen_models/login_model.dart';
import 'package:bibliotec/screens/base_view.dart';
import 'package:bibliotec/screens/books_view.dart';
import 'package:bibliotec/screens/home_view.dart';
import 'package:bibliotec/screens/login_view.dart';
import 'package:bibliotec/screens/register_view.dart';
import 'package:flutter/material.dart';

const String login = 'login';
const String register = 'register';
const String home = '/';
const String books = '/books';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case login:
      return MaterialPageRoute(
          builder: (context) => BaseView<LoginModel>(
                onModelReady: (model) => model.isUserLogged(),
                builder: (context, model, child) => model.isLogged
                ? HomeView()
                : LoginView(),
              ));
    case register:
      return MaterialPageRoute(builder: (context) => RegisterView());
    case home:
      return MaterialPageRoute(builder: (context) => HomeView());
    case books:
      final subject = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => BooksView(subject: subject));
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
