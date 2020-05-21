import 'package:flutter/material.dart';
import 'package:bibliotec/models/subject.dart';
import 'package:bibliotec/routes/router.dart' as router;

class BookCard extends StatelessWidget {
  const BookCard({@required this.subject});

  final Subject subject;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(0),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, router.books, arguments: subject),
        child: _buildContent(context),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(subject.imgUrl, height: 58),
        SizedBox(height: 16),
        Text(subject.name, style: Theme.of(context).textTheme.bodyText1),
      ],
    );
  }
}
