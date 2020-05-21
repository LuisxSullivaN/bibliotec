import 'package:bibliotec/models/subject.dart';

class Book {
  String title;
  String author;
  String publisher;
  String coverUrl;
  Subject subject;

  Book({this.title, this.author, this.publisher, this.subject, this.coverUrl});
}
