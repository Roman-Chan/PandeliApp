import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,right:20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
              "Inicar Sesión",
              style: TextStyle(fontSize: 20,
              fontWeight: FontWeight.bold),
          ),
          Text(
              "Registrarse",
              style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFF518E),
            )
          )
        ],
      ),
    );
  }
}
