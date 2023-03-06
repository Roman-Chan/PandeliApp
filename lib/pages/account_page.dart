import 'package:flutter/material.dart';
import 'package:pandeli_app/pages/address_page.dart';
import 'package:pandeli_app/pages/payment_page.dart';

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
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: const Text("Cuenta",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18, color: _Color)),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric( horizontal: 13),
              children: <Widget>[
                InkWell(
                  child: Card(
                     margin: const EdgeInsets.only(bottom: 7),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    child: const ListTile(
                      title: Text("Informacion de perfil"),
                      leading: Icon(
                        Icons.person,
                        color: Colors.blue,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
