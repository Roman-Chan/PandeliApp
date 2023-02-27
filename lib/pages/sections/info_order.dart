import 'package:flutter/material.dart';
import 'package:pandeli_app/core/entities/orders.dart';
import 'package:pandeli_app/data/repositories/orders_data.dart';
class InfoOrder extends StatelessWidget {
   final Orders inf;
  const InfoOrder({super.key, required this.inf});

  @override
  Widget build(BuildContext context) {
    var inf = OrdersRepository.getOrders();
    return Column(
       children: [
        InfOrden(context, inf[1])
       ],
    );
  }


   InfOrden(BuildContext context, Orders inf) => ListTile(
        title: Center(
          child: Text(
            inf.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold, // establece la letra en negrita
            ),
          ),
        ),
        leading: CreateTrailingItem(inf),
        subtitle:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Tamaño: ${inf.size}'),
          Text('Sabor: ${inf.flavor}'),
          Text('Fecha: ${inf.ordenday}'),
        ]),
        trailing: Text(inf.status, style: const TextStyle(color: Colors.green)),
      );


  FadeInImage CreateTrailingItem(Orders inf) {
    return FadeInImage.assetNetwork(
      placeholder: 'images/loading.gif',
      image: inf.urlPedido,
      fit: BoxFit.cover,
      height: double.infinity,
    );
  }
}