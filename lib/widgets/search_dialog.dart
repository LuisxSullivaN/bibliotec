import 'package:flutter/material.dart';

class SearchDialog extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Búsqueda'),
      content: TextField(
          controller: _controller,
          decoration: InputDecoration(hintText: 'Título, autor, editorial')),
      actions: <Widget>[
        FlatButton(
            child: Text('Aceptar'),
            onPressed: () =>
                Navigator.of(context).pop(_controller.text))
      ],
    );
  }
}
