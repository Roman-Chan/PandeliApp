import 'package:flutter/material.dart';
import 'package:pandeli_app/widgets/button_form.dart';
import 'package:pandeli_app/widgets/label.dart';
import 'package:pandeli_app/widgets/nav.dart';
import 'package:pandeli_app/widgets/option.below.dart';
import 'dart:core';

void changeScreen(BuildContext context) {
  Navigator.pushNamed(context, '/');
}

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFb0f2c2),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Column(
              children: const [
                SizedBox(
                  height: 50.0,
                ),
                NavBar(),
                SizedBox(
                  height: 30.0,
                ),
                Label(text: 'Nombre completo'),
                Label(text: 'Numero de teléfono'),
                Label(text: 'Correo electronico'),
                Label(text: 'Contraseña'),
                ButtonForm(
                    text: 'Registrarse', functionOnPressed: changeScreen),
                OpcionBelow(
                    text: '¿Ya tienes cuenta?',
                    textButton: 'Inicia sesion',
                    pressBelow: changeScreen,
                    )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
