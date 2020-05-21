import 'package:bibliotec/locator.dart';
import 'package:bibliotec/models/api_definition.dart';
import 'package:bibliotec/models/user.dart';

class RegisterService {
  ApiDefinition _api = kLocator<ApiDefinition>();

  Future register(User user) async {
    return await _api.addUser(user);
  }

  Future<bool> fetchStudent(String id, String nip) async {
    final fetchedStudent = await _api.getStudent(id, nip);
    return fetchedStudent;
  }
}
