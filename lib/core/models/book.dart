import 'subject.dart';

class Book {
  String title;
  String author;
  String publisher;
  String coverUrl;
  Subject subject;

  Book({this.title, this.author, this.publisher, this.subject, this.coverUrl});

  Book.fromJson(Map<String, dynamic> data) :
    title = data['title'],
    author = data['author'],
    publisher = data['publisher'],
    coverUrl = data['coverUrl'],
    subject = data['subject'];
}
