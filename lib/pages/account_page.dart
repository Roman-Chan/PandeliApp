import 'package:flutter/material.dart';
import 'package:pandeli_app/pages/address_page.dart';
import 'package:pandeli_app/pages/payment_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../dtos/providers/token_provider.dart';

void screenChangeProfile(BuildContext context) {
  Navigator.pushNamed(context, '/info_profile');
}

void screenChangePayment(BuildContext context) {
  Navigator.pushNamed(context, '/payment');
}

void cleanPreferences(BuildContext context)async{
  final prefs = await SharedPreferences.getInstance();
  final tokenProvider = TokenProvider(prefs);
  tokenProvider.removeToken();
  tokenProvider.removeId();
}
void screenChangeExit(BuildContext context) {
  cleanPreferences(context);
  Navigator.pushNamed(context, '/');
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
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: const Text("Cuenta",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18, color: _Color)),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              children: <Widget>[
                InkWell(
                  child: Card(
                    margin: const EdgeInsets.only(bottom: 7),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    child: ListTile(
                      title: const Text("Informacion de perfil"),
                      leading: const Icon(
                        Icons.person,
                        color: Colors.blue,
                      ),
                      trailing: const Icon(Icons.navigate_next),
                      onTap: () {
                        screenChangeProfile(context);
                      },
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PaymentPage()),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.only(bottom: 7),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    child: const ListTile(
                      title: Text("Metodo de pago"),
                      leading: Icon(
                        Icons.credit_card,
                        color: Colors.green,
                      ),
                      trailing: Icon(Icons.navigate_next),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddressPage()),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.only(bottom: 7),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    child: const ListTile(
                      title: Text("Direcciones"),
                      leading: Icon(
                        Icons.location_on,
                        color: Colors.red,
                      ),
                      trailing: Icon(Icons.navigate_next),
                    ),
                  ),
                ),
                InkWell(
                  child: Card(
                    margin: const EdgeInsets.only(bottom: 7),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    child: ListTile(
                      title: const Text("Salir"),
                      leading: const Icon(
                        Icons.exit_to_app,
                        color: Colors.blue,
                      ),
                      //trailing: const Icon(Icons.exit_to_app),
                      onTap: () {
                        screenChangeExit(context)
                        ;
                      },
                    ),
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
