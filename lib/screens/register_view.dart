import 'package:bibliotec/screen_models/base_model.dart';
import 'package:bibliotec/screens/base_view.dart';
import 'package:bibliotec/screen_models/register_model.dart';
import 'package:bibliotec/routes/router.dart' as router;
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  final _nameController = TextEditingController();
  final _idController = TextEditingController();
  final _nipController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String handleEmptyField(String value) {
    if (value.isEmpty) return 'Llenar este campo';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterModel>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Regístrate'),
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 16),
                  _buildTextField('Nombre', _nameController, handleEmptyField),
                  SizedBox(height: 16),
                  _buildTextField(
                      'Número de control', _idController, handleEmptyField),
                  SizedBox(height: 16),
                  _buildTextField(
                      'Ingresa tu NIP', _nipController, handleEmptyField, true),
                  SizedBox(height: 16),
                  DropdownButton(
                    hint: Text('Elige tu carrera'),
                    value: model.career,
                    onChanged: (career) => model.updateCareerValue(career),
                    items: <String>['ISC', 'QUI', 'ELC']
                        .map((career) => DropdownMenuItem(
                            value: career, child: Text(career)))
                        .toList(),
                  ),
                  _buildTextField(
                      'Contraseña', _passwordController, handleEmptyField, true),
                  SizedBox(height: 32),
                  Center(
                    child: model.status == ViewStatus.Busy
                        ? CircularProgressIndicator()
                        : RaisedButton(
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                final success = await model.registerUser(
                                  id: _idController.text,
                                  name: _nameController.text,
                                  nip: _nipController.text,
                                  career: model.career,
                                  password: _passwordController.text,
                                );
                                if (success) {
                                  Navigator.pushReplacementNamed(
                                      context, router.home);
                                }
                              }
                            },
                            child: Text('Regístrate')),
                  ),
                  model.errorMessage != null
                      ? Text(model.errorMessage)
                      : Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hintText, TextEditingController controller,
      Function(String) onValidate,
      [bool obscureText = false]) {
    return TextFormField(
      validator: onValidate,
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}
