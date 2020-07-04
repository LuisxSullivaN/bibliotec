import 'package:bibliotec/ui/shared/ui_helpers.dart';
import 'package:bibliotec/ui/views/register/register_model.dart';
import 'package:bibliotec/ui/widgets/busy_button.dart';
import 'package:bibliotec/ui/widgets/expansion_list.dart';
import 'package:bibliotec/ui/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Register extends StatelessWidget {
  final _nameController = TextEditingController();
  final _controlNumberController = TextEditingController();
  final _nipController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registro')),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(18),
          child: ChangeNotifierProvider(
            create: (context) => RegisterModel(),
            child: Consumer<RegisterModel>(
              builder: (context, model, child) => Column(
                children: <Widget>[
                  InputField(
                    placeholder: 'Nombre',
                    controller: _nameController,
                  ),
                  verticalSpaceSmall,
                  ExpansionList(
                    items: ['ISC', 'IGE', 'QUI'],
                    title: model.selectedCareer,
                    onItemSelected: (career) => model.setSelectedCareer(career),
                  ),
                  verticalSpaceMedium,
                  InputField(
                    placeholder: 'Número de control',
                    controller: _controlNumberController,
                  ),
                  verticalSpaceSmall,
                  InputField(
                    placeholder: 'NIP',
                    password: true,
                    controller: _nipController,
                  ),
                  verticalSpaceSmall,
                  InputField(placeholder: 'Correo', controller: _emailController),
                  verticalSpaceSmall,
                  InputField(
                      placeholder: 'Contraseña', password: true, controller: _passwordController),
                  verticalSpaceMedium,
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[BusyButton(
                      title: 'Registrarse',
                      busy: model.busy,
                      onPressed: () => model.register(
                          name: _nameController.text,
                          controlNumber: _controlNumberController.text,
                          nip: _nipController.text,
                          email: _emailController.text,
                          password: _passwordController.text),
                    )],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
