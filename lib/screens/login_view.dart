import 'package:bibliotec/screen_models/base_model.dart';
import 'package:bibliotec/screen_models/login_model.dart';
import 'package:bibliotec/routes/router.dart' as router;
import 'package:bibliotec/screens/base_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: _buildLogin(context, model),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogin(BuildContext context, LoginModel model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset('assets/images/logo.png'),
        SizedBox(height: 24),
        _buildTextField(
          controller: _idController,
          hintText: 'Número de control',
        ),
        SizedBox(height: 18),
        _buildTextField(
          controller: _passwordController,
          hintText: 'Contraseña',
          obscureText: true,
        ),
        SizedBox(height: 24),
        model.status == ViewStatus.Busy
            ? CircularProgressIndicator()
            : RaisedButton(
                onPressed: () async {
                  final logged = await model.login(
                      _idController.text, _passwordController.text);
                  if (logged) {
                    Navigator.pushReplacementNamed(context, router.home);
                  }
                },
                child: Text('Iniciar Sesión'),
              ),
        SizedBox(height: 24),
        InkWell(
            onTap: () {
              Navigator.pushNamed(context, router.register);
            },
          child: Text(
            '¿Aún no tienes una cuenta?',
            style: TextStyle(decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(
      {String hintText,
      bool obscureText = false,
      TextEditingController controller}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      obscureText: obscureText,
    );
  }
}
