import 'package:flutter/material.dart';

const _backgroundColor = Color(0xff0F3DDE1);
const _Color = Color(0xff0a1356b);
const cardHeight = 55.0;
const productoHeight = 100.0;

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: const Text("Cuenta",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18, color: _Color)),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 13),
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                Card(  
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: const ListTile(
                    title: Text("Informacion de perfil"),
                    leading: Icon(Icons.person),
                    trailing: Icon(Icons.navigate_next),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: const ListTile(
                    title: Text("Metodo de pago"),
                    leading: Icon(Icons.credit_card),
                    trailing: Icon(Icons.navigate_next),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
