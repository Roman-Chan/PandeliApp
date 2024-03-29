import 'package:flutter/material.dart';
import 'package:pandeli_app/Widgets/login/label_password_login.dart';
import 'package:pandeli_app/dtos/providers/register_provider.dart';
import 'package:pandeli_app/widgets/button_form.dart';
import 'package:pandeli_app/widgets/label.dart';
import 'package:pandeli_app/widgets/nav.dart';
import 'package:pandeli_app/widgets/option.below.dart';
import 'dart:core';

import 'package:provider/provider.dart';

void changeScreen(BuildContext context) {
  Navigator.pushNamed(context, '/login');
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    super.key,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
  
}

class _RegisterPageState extends State<RegisterPage> {
  final _nombreController = TextEditingController();
  final _lastName = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirPassword = TextEditingController();
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFb0f2c2),
      body: SafeArea(
        child: Consumer<RegisterProvider>(
          builder: (context, registPage, child) {
          return ListView(
            children: <Widget>[
              Column(
                children:  [
                  const SizedBox(
                    height: 50.0,
                  ),
                  const NavBar(),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Label(text: 'Nombre', controller: _nombreController),
                  Label(
                    text: 'Apellido',
                    controller: _lastName,
                  ),
                  Label(
                    text: 'Correo electronico',
                    controller: _email,
                  ),
                  BtnFgPassword(
                    textp: 'Contraseña',
                    controller: _password,
                  ),
                  BtnFgPassword(
                    textp: 'Confirmar contraseña',
                    controller: _confirPassword),
                  ButtonForm(
                    text: 'Registrarse',
                    functionOnPressed: registro,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(_errorMessage,
                        style: const TextStyle(color: Colors.red)),
                  ),
                  const OpcionBelow(
                    text: '¿Ya tienes cuenta?',
                    textButton: 'Inicia sesion',
                    pressBelow: changeScreen,
                  )
                ],
              ),
            ],
          );
          }
        ),
      ),
    );
  }

  void registro(BuildContext context) {
    setState(() {
      _errorMessage = '';
    });
    final name = _nombreController.text;
    final lastName = _lastName.text;
    final email = _email.text;
    final password = _password.text;
    final comparePassword = _confirPassword.text;

    Provider.of<RegisterProvider>(context, listen: false)
        .register(name, lastName, email, password,comparePassword)
        .then((success) {
      if (success) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Alert'),
              content: const Text('Se ha enviado un correo de confirmacion'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, '/login',(route) => false,);
                }, 
                  child: const Text('OK'))
                  ],
            );
          }
      );
      } else {
        setState(() {
          _errorMessage = 'Error: usuario o contraseña incorrectos';
        });
      }
    }).catchError((error) {
      setState(() {
        _errorMessage = error.toString().replaceFirst('Exception:', '');
      });
    });
  }
}

