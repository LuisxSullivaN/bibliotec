import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/book.dart';
import '../../models/student.dart';
import '../../models/subject.dart';
import '../../models/user.dart';
import 'base_api.dart';

class FirebaseApi implements BaseApi {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final CollectionReference _usersCollectionRefence =
      Firestore.instance.collection('users');
  final CollectionReference _subjectsCollectionRefence =
      Firestore.instance.collection('subjects');
  final CollectionReference _booksCollectionRefence =
      Firestore.instance.collection('books');

  @override
  Future<bool> createUser(User user) async {
    try {
      await _usersCollectionRefence
          .document(user.sessionId)
          .setData(user.toJson());
      return true;
    } catch (error) {
      throw error;
    }
  }

  @override
  Future<List<Subject>> getAllSubjects() async {
    final subjectsSnapshot = await _subjectsCollectionRefence.getDocuments();
    return subjectsSnapshot.documents
        .map((snapshot) => Subject.fromJson(snapshot.data))
        .toList();
  }

  @override
  Future<List<Book>> getBooksOf(Subject subject) async {
    final booksSnapshot = await _booksCollectionRefence
        .where('subject.id', isEqualTo: subject.id)
        .getDocuments();
    return booksSnapshot.documents
        .map((snapshot) => Book.fromJson(snapshot.data))
        .toList();
  }

  @override
  Future<User> getUser(String id) async {
    var userSnapshot = await _usersCollectionRefence.document(id).get();
    return User.fromJson(userSnapshot.data);
  }

  @override
  Future<bool> studentExists(Student student) {
    // TODO: implement studentExists
    throw UnimplementedError();
  }

  @override
  Future<bool> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user != null;
    } catch (error) {
      throw error;
    }
  }

  @override
  Future<String> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (authResult.user != null) {
        return authResult.user.uid;
      }
      return null;
    } catch (error) {
      throw error;
    }
  }

  @override
  Future<bool> isUserSignedIn() async {
    final user = await _firebaseAuth.currentUser();
    return user != null;
  }
}
