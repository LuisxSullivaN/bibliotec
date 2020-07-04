import 'package:bibliotec/core/models/book.dart';
import 'package:bibliotec/core/models/subject.dart';
import 'package:bibliotec/ui/widgets/search_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../base_view.dart';
import 'books_model.dart';

class Books extends StatelessWidget {
  final Subject subject;

  const Books({@required this.subject});

  @override
  Widget build(BuildContext context) {
    return BaseView<BooksModel>(
      onModelReady: (model) => model.fetchBooks(subject: subject),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(subject.name),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                final match = await showDialog(
                    context: context,
                    builder: (context) => SearchDialog());
                print(match);
                model.filterBooks(match);
              },
            ),
          ],
        ),
        body: model.busy
            ? Center(child: CircularProgressIndicator())
            : model.books.isEmpty
                ? Center(child: Text('No se encontraron resultados'))
                : ListView(
                    children: model.filteredBooks.isEmpty
                        ? _buildItems(model.books)
                        : _buildItems(model.filteredBooks),
                  ),
      ),
    );
  }

  _buildItems(List<Book> books) {
    return books
        .map((book) => ListTile(
              leading: CachedNetworkImage(
                imageUrl: book.coverUrl,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              title: Text(book.title),
              subtitle: Text(book.author),
            ))
        .toList();
  }
}
