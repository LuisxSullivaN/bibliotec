
import 'package:bibliotec/screen_models/books_model.dart';
import 'package:bibliotec/screen_models/home_model.dart';
import 'package:bibliotec/screen_models/login_model.dart';
import 'package:bibliotec/screen_models/register_model.dart';
import 'package:bibliotec/services/authentication_service.dart';
import 'package:bibliotec/services/register_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:bibliotec/models/api_definition.dart';
import 'package:bibliotec/models/api_fake.dart';

GetIt kLocator = GetIt.instance;

void setupLocator() {
  kLocator.registerLazySingleton<ApiDefinition>(() => ApiFake());
  kLocator.registerLazySingleton<AuthenticationService>(() => AuthenticationService());
  kLocator.registerLazySingleton<RegisterService>(() => RegisterService());
  kLocator.registerLazySingleton<FlutterSecureStorage>(() => FlutterSecureStorage());
  kLocator.registerFactory(() => LoginModel());
  kLocator.registerFactory(() => HomeModel());
  kLocator.registerFactory(() => BooksModel());
  kLocator.registerFactory(() => RegisterModel());
}
