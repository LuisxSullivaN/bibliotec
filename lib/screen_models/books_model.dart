import 'package:bibliotec/locator.dart';
import 'package:bibliotec/models/api_definition.dart';
import 'package:bibliotec/models/book.dart';
import 'package:bibliotec/models/subject.dart';
import 'package:bibliotec/screen_models/base_model.dart';

class BooksModel extends BaseModel {
  ApiDefinition _api = kLocator<ApiDefinition>();

  List<Book> books;
  List<Book> filteredBooks = [];

  Future fetchBooks(Subject subject) async {
    setStatus(ViewStatus.Busy);
    books = await _api.getBooks(subject);
    setStatus(ViewStatus.Idle);
  }

  void filterBooks(String match) {
    final upperMatch = match.toUpperCase();
    filteredBooks = books.where((book) {
      return book.title.toUpperCase().contains(upperMatch) ||
          book.author.toUpperCase().contains(upperMatch) ||
          book.publisher.toUpperCase().contains(upperMatch);
    }).toList();
    notifyListeners();
  }
}
