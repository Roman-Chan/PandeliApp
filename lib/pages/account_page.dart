
import 'package:flutter/material.dart';

void screenChangeProfile(BuildContext context) {
  Navigator.pushNamed(context, '/info_profile');
}
void screenChangePayment(BuildContext context) {
  Navigator.pushNamed(context, '/payment');
}

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
                  child:  ListTile(
                    title:const  Text("Informacion de perfil"),
                    leading: const Icon(Icons.person),
                    trailing: const Icon(Icons.navigate_next),
                    onTap: () {
                      screenChangeProfile(context);
                    },
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child:  ListTile(
                    title: const Text("Metodo de pago"),
                    leading: const Icon(Icons.credit_card),
                    trailing: const Icon(Icons.navigate_next),
                    onTap: () {screenChangePayment(context);},
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
