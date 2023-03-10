import 'package:flutter/material.dart';
import 'package:pandeli_app/Widgets/custom_card_account.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../dtos/providers/token_provider.dart';

void screenChangeProfile(BuildContext context) {
  Navigator.pushNamed(context, '/info_profile');
}
void screenChangePayment(BuildContext context) {
  Navigator.pushNamed(context, '/payment');
}
void screenChangeAddress(BuildContext context) {
  Navigator.pushNamed(context, '/address');
}
void cleanPreferences(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  final tokenProvider = TokenProvider(prefs);
  tokenProvider.removeToken();
  tokenProvider.removeId();
}
void screenChangeExit(BuildContext context) {
  cleanPreferences(context);
  Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
}

const _backgroundColor = Color(0xff0F3DDE1);
const _Color = Color(0xff0a1356b);
const cardHeight = 55.0;
const productoHeight = 100.0;

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: const Text("Detalles de cuenta",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18, color: _Color)),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              children: <Widget>[
                CustomCard(
                  title: "Informacion de perfil",
                  icon: Icons.person,
                  iconColor: Colors.blue,
                  backgroundColor: Colors.white,
                  onTap: () {
                    screenChangeProfile(context);
                  },
                ),
                CustomCard(
                  title: "Metodo de pago",
                  icon: Icons.credit_card,
                  iconColor: Colors.green,
                  backgroundColor: Colors.white,
                  onTap: () {
                    screenChangePayment(context);
                  },
                ),
                CustomCard(
                  title: "Direcciones",
                  icon: Icons.location_on,
                  iconColor: Colors.red,
                  backgroundColor: Colors.white,
                  onTap: () {
                    screenChangeAddress(context);
                  },
                ),
                CustomCard(
                  title: "Salir",
                  icon: Icons.exit_to_app,
                  iconColor: Colors.blue,
                  backgroundColor: Colors.white,
                  onTap: () {
                    screenChangeExit(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
