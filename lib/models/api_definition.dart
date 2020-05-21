import 'package:bibliotec/models/user.dart';
import 'package:bibliotec/models/subject.dart';
import 'package:bibliotec/models/book.dart';

abstract class ApiDefinition {
  Future<List<Subject>> getSubjects();
  Future<List<Book>> getBooks(Subject subject);
  Future<User> getUser(String id, String password);
  Future<bool> getStudent(String id, String nip);
  Future addUser(User user);
}
