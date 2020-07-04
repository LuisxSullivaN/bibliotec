import 'package:bibliotec/core/service_locator.dart';
import 'package:bibliotec/core/services/authentication_service.dart';
import 'package:bibliotec/core/services/dialog_service.dart';
import 'package:bibliotec/core/services/navigation_service.dart';
import 'package:bibliotec/routes.dart' as routes;
import 'package:bibliotec/ui/base/base_model.dart';
import 'package:flutter/material.dart';

class LoginModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  void signInWithEmailAndPassword({
    @required email,
    @required password,
  }) async {
    try {
      setBusy(true);
      await _authenticationService.signInWithEmailAndPassword(
          email: email, password: password);
      setBusy(false);
      _navigationService.navigateTo(routes.home);
    } catch (error) {
      setBusy(false);
      await _dialogService.showDialog(
        title: 'Inicio de sesión fallido',
        description: 'Favor de verificar las credenciales',
      );
    }
  }

  void navigateToRegister() {
    _navigationService.navigateTo(routes.register);
  }
}
