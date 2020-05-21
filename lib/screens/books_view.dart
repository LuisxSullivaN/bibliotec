import 'package:bibliotec/models/book.dart';
import 'package:bibliotec/models/subject.dart';
import 'package:bibliotec/screen_models/base_model.dart';
import 'package:bibliotec/screen_models/books_model.dart';
import 'package:bibliotec/screens/base_view.dart';
import 'package:bibliotec/widgets/search_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BooksView extends StatelessWidget {
  final Subject subject;

  BooksView({this.subject});

  void handleSearch(BuildContext context, BooksModel model) async {
    final match = await showDialog(
      context: context,
      builder: (context) => SearchDialog(),
    );
    model.filterBooks(match);
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<BooksModel>(
      onModelReady: (model) => model.fetchBooks(subject),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(subject.name),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () => handleSearch(context, model),
            ),
          ],
        ),
        body: model.status == ViewStatus.Busy
            ? Center(child: CircularProgressIndicator())
            : model.books.isNotEmpty
                ? ListView(
                    children: _buildBookItems(model.filteredBooks.isEmpty
                        ? model.books
                        : model.filteredBooks))
                : Center(child: Text('No se encontraron resultados')),
      ),
    );
  }

  List<Widget> _buildBookItems(List<Book> books) {
    return books
        .map((book) => ListTile(
              leading: CachedNetworkImage(
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
                imageUrl: book.coverUrl,
              ),
              title: Text(book.title),
              subtitle: Text(book.author),
            ))
        .toList();
  }
}
