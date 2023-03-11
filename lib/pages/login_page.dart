import 'package:flutter/material.dart';
import 'package:pandeli_app/Widgets/button_form.dart';
import 'package:pandeli_app/Widgets/label.dart';
import 'package:pandeli_app/Widgets/login/forgot_password.dart';
import 'package:pandeli_app/Widgets/login/label_password_login.dart';
import 'package:pandeli_app/Widgets/login/logo_login.dart';
import 'package:pandeli_app/Widgets/option.below.dart';
import 'package:pandeli_app/dtos/providers/login_providers.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
  
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
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
        child: Consumer<LoginProvider>(
          builder: (context, loginProvider, child) {
            return ListView(
              children: <Widget>[
                const SizedBox(height: 40.0),
                Column(
                  children: const [
                    Logo(),
                  ],
                ),
                const SizedBox(height: 40.0),
                Label(text: 'Email', controller: _emailController),
                BtnFgPassword(controller: _passwordController),
                ButtonForm(text: 'Login', functionOnPressed: autentification),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(_errorMessage,
                      style: const TextStyle(color: Colors.red)),
                ),
                const ButtonPassword(),
                const SizedBox(height: 170.0),
                const OpcionBelow(
                  text: '¿Nuevo usuario?',
                  textButton: 'Registrate',
                  pressBelow: screenChangeR,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void autentification(BuildContext context){
    setState(() {
    _errorMessage = ''; });
    final email = _emailController.text;
    final password = _passwordController.text;
    Provider.of<LoginProvider>(context, listen: false)
      .login(email, password)
      .then((success) {
    if (success) {
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
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

void screenChangeR(BuildContext context) {
  Navigator.pushNamed(context, '/signup');
}
