import 'package:bibliotec/core/data/api/base_api.dart';
import 'package:bibliotec/core/models/book.dart';
import 'package:bibliotec/core/service_locator.dart';
import 'package:bibliotec/ui/base/base_model.dart';
import 'package:flutter/foundation.dart';

class BooksModel extends BaseModel {
  final BaseApi _api = locator<BaseApi>();
  List<Book> books = [];
  List<Book> filteredBooks = [];

  void fetchBooks({@required subject}) async {
    setBusy(true);
    books = await _api.getBooksOf(subject);
    setBusy(false);
  }

  void filterBooks(String match) {
    if (match != null) {
      final upperMatch = match.toUpperCase();
      filteredBooks = books.where((book) {
        return book.title.toUpperCase().contains(upperMatch) ||
            book.author.toUpperCase().contains(upperMatch) ||
            book.publisher.toUpperCase().contains(upperMatch);
      }).toList();
      notifyListeners();
    }
  }
}
