import 'package:bibliotec/ui/shared/ui_helpers.dart';
import 'package:bibliotec/ui/views/base_view.dart';
import 'package:bibliotec/ui/widgets/busy_button.dart';
import 'package:bibliotec/ui/widgets/input_field.dart';
import 'package:bibliotec/ui/widgets/text_link.dart';
import 'package:flutter/material.dart';

import 'login_model.dart';


class Login extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: BaseView<LoginModel>(
          builder: (context, model, child) => Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/logo.png'),
                SizedBox(height: 24),
                InputField(
                  placeholder: 'Correo',
                  controller: _emailController,
                ),
                verticalSpaceSmall,
                InputField(
                  placeholder: 'Contraseña',
                  password: true,
                  controller: _passwordController,
                ),
                verticalSpaceSmall,
                BusyButton(
                  title: 'Iniciar Sesión',
                  busy: model.busy,
                  onPressed: () => model.signInWithEmailAndPassword(
                    email: _emailController.text,
                    password: _passwordController.text,
                  ),
                ),
                verticalSpaceMedium,
                TextLink(
                  '¿Aún no tienes una cuenta?',
                  onPressed: () => model.navigateToRegister(),
                )
              ],
            ),
        ),
      ),
    );
  }
}
