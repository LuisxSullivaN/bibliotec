import '../../models/user.dart';
import '../../models/book.dart';
import '../../models/student.dart';
import '../../models/subject.dart';

abstract class BaseApi {
  Future<List<Subject>> getAllSubjects();
  Future<List<Book>> getBooksOf(Subject subject);
  Future<User> getUser(String id);
  Future<bool> createUser(User user);
  Future<String> signInWithEmailAndPassword(String email, String password);
  Future<bool> registerWithEmailAndPassword(String email, String password);
  Future<bool> isUserSignedIn();
  Future<bool> studentExists(Student student);
}
