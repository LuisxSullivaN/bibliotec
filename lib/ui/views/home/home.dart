import 'package:bibliotec/ui/shared/ui_helpers.dart';
import 'package:bibliotec/ui/widgets/book_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../base_view.dart';
import 'home_model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeModel>().fetchSubjects();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,title: Text('Bibliotec')),
      body: Container(
          padding: EdgeInsets.all(16),
        child: BaseView<HomeModel>(
          onModelReady: (model) => model.fetchSubjects(),
          builder: (context, model, child) => model.busy
              ? Center(child: CircularProgressIndicator())
              : Column(
                children: <Widget>[
                  Text('Ver listado del libros', style: Theme.of(context).textTheme.headline6),
                  verticalSpaceSmall,
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      children: model.subjects
                          .map((subject) => BookCard(navigateToBooks: model.navigateToBooks, subject: subject))
                          .toList(),
                    ),
                  )],
              ),
        ),
      ),
    );
  }
}
