import 'package:bibliotec/screen_models/base_model.dart';
import 'package:bibliotec/screen_models/home_model.dart';
import 'package:bibliotec/screens/base_view.dart';
import 'package:flutter/material.dart';
import 'package:bibliotec/widgets/book_card.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Bibliotec'),
        ),
        body: BaseView<HomeModel>(
            onModelReady: (model) => model.fetchSubjects(),
          builder: (context, model, child) => Container(
              padding: EdgeInsets.all(16.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Ver listado de libros', style: Theme.of(context).textTheme.headline6),
                SizedBox(height: 16.0),
                model.status == ViewStatus.Busy
              ? Center(child: CircularProgressIndicator())
              : Expanded(
                child: GridView.count(
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  crossAxisCount: 2,
                  children: model.subjects.map((subject) {
                    return BookCard(subject: subject);
                  }).toList(),
                ),
              )],
            ),
          ),
        ));
  }
}
