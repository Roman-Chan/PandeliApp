// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, use_full_hex_values_for_flutter_colors, constant_identifier_names, camel_case_types
import 'package:flutter/material.dart';

const _backgroundColor = Color(0xff0F3DDE1);
const _Color = Color(0xff0a1356b);
const cardHeight = 55.0;
const productoHeight = 100.0;

class Title_App extends StatelessWidget {
  const Title_App({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: _backgroundColor,
            padding: const EdgeInsets.symmetric(vertical:15),
            child: const Center(
              child: Text("Pedidos",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: _Color)),
            ),
          ),
          Expanded(
              child: Container(
            color: _backgroundColor,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemCount: 15,
              itemBuilder: (context, index) {
                index += 1;
                return SizedBox(
                  height: productoHeight,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    elevation: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ListTile(
                            title: Text("Pedido $index",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text("Pastel de nutella"),
                            leading:
                                Image(image: AssetImage("images/pastel.jpg")),
                            trailing: Text(
                              "Preparando",
                              style: TextStyle(color: Colors.green),
                            ),
                            onTap: () {}),
                      ],
                    ),
                  ),
                );
              },
            ),
          ))
        ],
      ),
    );
  }
}
