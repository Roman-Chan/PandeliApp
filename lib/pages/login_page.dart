import 'package:flutter/material.dart';
import 'package:pandeli_app/widgets/button_form.dart';
import 'package:pandeli_app/widgets/label.dart';
import 'package:pandeli_app/widgets/nav.dart';
import 'package:pandeli_app/widgets/option.below.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFb0f2c2),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 40.0),
            Column(
              children:const[
                Logo(),
              ],
            ),
            const SizedBox(height: 50.0),
            const NavBar(),
            const SizedBox(height: 20.0),
            const Label(text: 'Email'),
            const BtnFgPassword(),
            const ButtonForm(text: 'Login',functionOnPressed: screenChange),
            const ButtonPassword(),
            const SizedBox(height:170.0),
            const OpcionBelow(text: '¿Nuevo usuario?', textButton: 'Registrate',
            pressBelow: screenChangeR)
          ],
          
        ),
      ),
    );
  }
}

void screenChange(BuildContext context) {
  Navigator.pushNamed(context, '/third');
}

void screenChangeR(BuildContext context) {
  Navigator.pushNamed(context, '/second');
}

class BtnFgPassword extends StatelessWidget {
  const BtnFgPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0 ),
      child: Column(
        children: [
          SizedBox(
            child: TextField(
              decoration: InputDecoration(
                filled:  true,
                fillColor: Colors.white,
                labelText: 'Contraseña',
                labelStyle: const TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none
                ),
              ),
              obscureText: true,
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonPassword extends StatelessWidget {
  const ButtonPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right:20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
          onPressed: () {},
          child: const Text('Olvide mi contraseña'),
          ),
        ],
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(
        'assets/logo.jpeg',
        width: 200,
        height: 200,
        fit: BoxFit.cover,
      ),
    );
  }
}