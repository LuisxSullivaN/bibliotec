import 'package:bibliotec/models/book.dart';
import 'package:bibliotec/models/subject.dart';
import 'package:bibliotec/models/api_definition.dart';
import 'package:bibliotec/models/user.dart';

class ApiFake implements ApiDefinition {
  static const _mathId = 1;
  static const _chemistryId = 2;
  static const _electronicId = 3;
  static const _techId = 4;

  static List<Book> _books = List.generate(5, (index) {
    return Book(
        title: 'Título de libro número: $index',
        author: 'Nombre del autor $index',
        publisher: 'Editorial número $index',
        subject: _subjects.first,
        coverUrl: 'https://via.placeholder.com/92x128');
  });
  static List<Subject> _subjects = [
    Subject(
      id: _mathId,
      name: 'Matemáticas',
      imgUrl: 'assets/images/math-symbols.png',
    ),
    Subject(
      id: _chemistryId,
      name: 'Química',
      imgUrl: 'assets/images/atom.png',
    ),
    Subject(
      id: _techId,
      name: 'Sistemas',
      imgUrl: 'assets/images/computer.png',
    ),
    Subject(
      id: _electronicId,
      name: 'Electrónica',
      imgUrl: 'assets/images/microchip.png',
    )
  ];
  static List<User> _users = [
    User(
      id: '16230868',
      name: 'Luis David Solano Peña',
      career: 'ISC',
      password: 'nosemeolvida123',
    )
  ];

  static Map<String, String> _students = {
    '16230849' : '6406'
  };

  @override
  Future<List<Book>> getBooks(Subject subject) {
    return Future.delayed(Duration(seconds: 2), () {
      return _books.where((book) => book.subject.id == subject.id).toList();
    });
  }

  @override
  Future<List<Subject>> getSubjects() {
    return Future.delayed(Duration(seconds: 2), () => _subjects);
  }

  @override
  Future<User> getUser(String id, String password) {
    _users.forEach((user) {
      print(user.id);
      print(user.password);
    });
    return Future.delayed(Duration(seconds: 2), () {
      return _users.firstWhere(
          (user) => user.id == id && user.password == password,
          orElse: () => null);
    });
  }

  @override
  Future addUser(User user) {
    return Future.delayed(Duration(seconds: 1), () => _users.add(user));
  }

  @override
  Future<bool> getStudent(String id, String nip) {
    return Future.delayed(Duration(seconds: 2), () {
      return _students.containsKey(id) && _students[id] == nip;
    });
  }
}
