import 'package:flutter/foundation.dart';

import '../data/api/base_api.dart';
import '../models/user.dart';
import '../service_locator.dart';

class AuthenticationService {
  final BaseApi _api = locator<BaseApi>();

  User _currentUser;

  User get currentUser => _currentUser;

  Future<bool> registerWithEmailAndPassword({
    @required sessionId,
    @required controlNumber,
    @required name,
    @required career,
    @required email,
    @required password,
  }) async {
    try {
      bool credentialsCreated =
          await _api.registerWithEmailAndPassword(email, password);
      bool userCreated = false;
      if (credentialsCreated) {
        final user = User(
          sessionId: sessionId,
          controlNumber: controlNumber,
          name: name,
          career: career,
          email: email,
        );
        userCreated = await _api.createUser(user);
        _currentUser = user;
      }
      return credentialsCreated && userCreated;
    } catch (error) {
      throw error;
    }
  }

  Future<bool> signInWithEmailAndPassword({
    @required email,
    @required password,
  }) async {
    try {
      final sessionId = await _api.signInWithEmailAndPassword(email, password);
      bool success = sessionId != null;
      if (success) {
        _currentUser = await _api.getUser(sessionId);
      }
      return success;
    } catch (error) {
      throw error;
    }
  }

  Future<bool> isUserSignedIn() {
    final signedIn = _api.isUserSignedIn();
    return signedIn;
  }
}
