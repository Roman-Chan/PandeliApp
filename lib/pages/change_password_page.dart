import 'package:flutter/material.dart';
import 'package:pandeli_app/Widgets/button_form.dart';
import 'package:pandeli_app/Widgets/label.dart';
import 'package:pandeli_app/Widgets/login/logo_login.dart';
import 'package:pandeli_app/dtos/providers/reset_password_provider.dart';
import 'package:provider/provider.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController _emailController = TextEditingController();
  String _errorMessage = '';

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFb0f2c2),
      body: SafeArea(
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 40,),
                  ClipOval(
                    child: Image.asset('images/PandeliLogo.png'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Olvide mi contraseña',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  const Padding(
                      padding: EdgeInsets.only(right: 30, left: 30),
                      child: Text(
                        'Ingresa la dirección de correo electrónico asociado a tu cuenta. Recibiras un código para restablecer tu contraseña',
                        style: TextStyle(fontSize: 20),
                      )),
                  const SizedBox(height: 25,),
                  Label(
                      text: 'Correo electronico', controller: _emailController),
                  ButtonForm(
                      text: 'Enviar', functionOnPressed: autentification),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(_errorMessage,
                              style: const TextStyle(color: Colors.red)),
                        ],
                      ),
                ],
                
              ),
            )
          ],
        ),
      ),
    );
  }


void autentification(BuildContext context) {
  setState(() {
    _errorMessage = ''; });
    final email = _emailController.text;
    Provider.of<ProviderSendEmail>(context, listen: false)
      .sendEmail(email)
      .then((success) {
    if (success) {
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
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

