import 'package:flutter/material.dart';
import 'package:pandeli_app/Widgets/label.dart';
import 'package:pandeli_app/Widgets/login/logo_login.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController _emailController = TextEditingController();

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
        child:  ListView(
          children: 
            [Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                  children: [
                    const Logo(),
                    const SizedBox(height: 20,),
                    const Text('¿Olvidaste tu contraseña?', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.purple),),
                    const Text('Introduce el email con el que accediste por ultima vez. En unos minutos recibiras un email para realizar el cambio de contraseña'),
                    const SizedBox(height: 5),
                    Label(text: 'Email', controller: _emailController),
                    const SizedBox(height: 20,),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          // Actualizar el estado del widget aquí
                        });
                      },
                      child: const Text('Sigueinte'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

