import 'package:bibliotec/core/service_locator.dart';
import 'package:bibliotec/core/services/authentication_service.dart';
import 'package:bibliotec/core/services/dialog_service.dart';
import 'package:bibliotec/core/services/navigation_service.dart';
import 'package:bibliotec/routes.dart' as routes;
import 'package:bibliotec/ui/base/base_model.dart';
import 'package:flutter/foundation.dart';

class RegisterModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  String _selectedCareer = 'Selecciona tu carrera';

  String get selectedCareer => _selectedCareer;

  void setSelectedCareer(String career) {
    _selectedCareer = career;
    notifyListeners();
  }

  void register({
    @required name,
    @required controlNumber,
    @required nip,
    @required email,
    @required password,
  }) async {
    setBusy(true);
    bool studentExists = await _authenticationService.signInStudent(
        controlNumber: controlNumber, nip: nip);
    setBusy(false);
    if (studentExists) {
      bool registered = await _authenticationService.registerWithEmailAndPassword(
        controlNumber: controlNumber,
        name: name,
        email: email,
        career: _selectedCareer,
        password: password,
      );
        _navigationService.navigateReplacementTo(routes.home);
    } else {
      await _dialogService.showDialog(
          title: 'No se pudo completar el registro',
          description: 'Verificar número de control y nip');
    }
  }
}
