import 'package:flutter/material.dart';
import 'package:holamundo/widgets/button_form.dart';
import 'package:holamundo/widgets/label.dart';
import 'package:holamundo/widgets/nav.dart';
import 'package:holamundo/widgets/option.below.dart';
import 'dart:core';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFb0f2c2),
      body: SafeArea(
        child: ListView(
          children: <Widget>
            [Column(
              children: const [
                SizedBox(height: 50.0,),
                NavBar(),
                SizedBox(height: 30.0,),
                Label(text: 'Nombre completo'),
                Label(text: 'Numero de teléfono'),
                Label(text: 'Correo electronico'),
                Label(text: 'Contraseña'),
                ButtonForm(text:'Registrarse',functionOnPressed: changeScreen),
                OpcionBelow(text: '¿Ya tienes cuenta?',
                textButton: 'Inicia sesion',
                pressBelow:changeScreen)
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void changeScreen (BuildContext context)
{
  Navigator.pushNamed(context, '/'); 
}