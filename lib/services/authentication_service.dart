import 'package:bibliotec/models/api_definition.dart';
import 'package:bibliotec/locator.dart';

class AuthenticationService {
  ApiDefinition _api = kLocator<ApiDefinition>();

  Future<bool> login(String id, String password) async {
    final fetchedUser = await _api.getUser(id, password);

    return fetchedUser != null;
  }
}
