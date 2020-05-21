import 'package:bibliotec/locator.dart';
import 'package:bibliotec/screen_models/base_model.dart';
import 'package:bibliotec/services/authentication_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginModel extends BaseModel {
  final AuthenticationService _authenticationService = kLocator<AuthenticationService>();
  final FlutterSecureStorage _storage = kLocator<FlutterSecureStorage>();
  bool isLogged;

  LoginModel() : isLogged = false;

  Future<bool> login(String id, String password) async {
    setStatus(ViewStatus.Busy);
    final userExists = await _authenticationService.login(id, password);

    setStatus(ViewStatus.Idle);
    if (userExists) {
      await _storage.write(key: 'isLogged', value: 'true');
    }
    return userExists;
  }

  Future isUserLogged() async{
    final result = await _storage.read(key: 'isLogged');
    isLogged = result == 'true';
    setStatus(ViewStatus.Idle);
  }
}
