import 'package:bibliotec/locator.dart';
import 'package:bibliotec/screen_models/base_model.dart';
import 'package:bibliotec/services/authentication_service.dart';
import 'package:bibliotec/services/register_service.dart';
import 'package:bibliotec/models/user.dart';

class RegisterModel extends BaseModel {
  AuthenticationService _authenticationService =
      kLocator<AuthenticationService>();
  RegisterService _registerService = kLocator<RegisterService>();

  String career;
  String errorMessage;

  Future<bool> registerUser({
    String id,
    String name,
    String nip,
    String career,
    String password,
  }) async {
    setStatus(ViewStatus.Busy);
    final userExists = await _verifyStudent(id, nip);
    print('userEists = $userExists');
    if (!userExists) {
      errorMessage = 'El número de control o NIP son incorrectos';
      setStatus(ViewStatus.Idle);
      return false;
    }
    User user = User(id: id, name: name, career: career, password: password);
    await _registerService.register(user);
    setStatus(ViewStatus.Idle);
    return _authenticationService.login(id, password);
  }

  Future<bool> _verifyStudent(String id, String nip) async {
    final studentExists = await _registerService.fetchStudent(id, nip);
    return studentExists;
  }

  void updateCareerValue(String newValue) {
    career = newValue;
    notifyListeners();
  }
}
