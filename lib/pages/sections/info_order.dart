// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pandeli_app/dtos/response/orders_response_dto.dart';

class InfoOrder extends StatelessWidget {
  final OrderResponseDto orden;
  const InfoOrder({super.key, required this.orden});

  @override
  Widget build(BuildContext context) {
    const _Color = Color(0xff0a1356b);
    const _backgroundColor = Color(0xff0F3DDE1);
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        title: const Text('Detalles del pedido'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            const SizedBox(
              height: 15,
            ),
            Image.network(
              orden.imgUrl,
              fit: BoxFit.cover,
              width: 250,
              height: 250,
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Detalles del Pedido",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: _Color),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Card(  
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: ListTile(
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Tamaño: ${orden.size}'),
                      Text('Relleno: ${orden.stuffing}'),
                      Text('Sabor: ${orden.flavor}'),
                    ],
                  ),
                  trailing: Text("Precio:${orden.total.toString()}",
                      style: const TextStyle(color: Colors.green)),
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Card(
            child: ListTile(title: Text(''),),
            ), )
          ]
        
          ),
        ),
      ),
    );
  }
}
