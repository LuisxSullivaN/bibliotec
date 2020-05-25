import 'package:get_it/get_it.dart';

import 'data/api/base_api.dart';
import 'data/api/firebase_api.dart';
import 'services/authentication_service.dart';

GetIt locator = GetIt.instance;

void initServiceLocator() {
  locator.registerLazySingleton<AuthenticationService>(() => AuthenticationService());
  locator.registerLazySingleton<BaseApi>(() => FirebaseApi());
}
