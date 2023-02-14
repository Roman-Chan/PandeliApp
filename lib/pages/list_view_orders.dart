// ignore_for_file: non_constant_identifier_names
import 'package:pandeli_app/data/repositories/orders_data.dart';
import 'package:flutter/material.dart';
import 'package:pandeli_app/core/entities/orders.dart';

class ListViewOrders extends StatelessWidget {
  const ListViewOrders({super.key});

  @override
  Widget build(BuildContext context) {
    var orders = OrdersRepository.getOrders();
    return Scaffold(
      body: ListView.builder(
          itemCount: orders.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: CreateListOrders(context, orders[index]),
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            );
          }),
    );
  }

  CreateListOrders(BuildContext context, Orders orders) => ListTile(
        leading: CreateTrailingItem(orders),
        title: Text(
          orders.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold, // establece la letra en negrita
          ),
        ),
        subtitle:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Tamaño: ${orders.size}'),
          Text('Sabor: ${orders.flavor}'),
          Text('Fecha: ${orders.ordenday}'),
          /* Text(
            'Estado: ${orders.status}',
            style: TextStyle(
                color: orders.status == 'En proceso'
                    ? Colors.orange
                    : Colors.green),
          ), */
        ]),

        /*    subtitle: Text(orders.size),*/
        trailing:
            Text(orders.status, style: const TextStyle(color: Colors.green)),
        onTap: () {},
      );

  FadeInImage CreateTrailingItem(Orders orders) {
    return FadeInImage.assetNetwork(
      placeholder: 'images/loading.gif',
      image: orders.urlPedido,
      fit: BoxFit.cover,
      height: double.infinity,
    );
  }
}
