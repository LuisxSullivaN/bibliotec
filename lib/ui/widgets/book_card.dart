import 'package:bibliotec/core/models/subject.dart';
import 'package:bibliotec/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final Subject subject;
  final Function(Subject subject) navigateToBooks;

  const BookCard({@required this.subject, @required this.navigateToBooks});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          height: 200,
          width: 200,
        child: Card(
          child: InkWell(
            onTap: () => navigateToBooks(subject),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(subject.imgUrl, height: 68),
                verticalSpaceSmall,
                Text(subject.name, style: Theme.of(context).textTheme.subtitle1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
