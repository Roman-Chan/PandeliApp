// ignore_for_file: non_constant_identifier_names
/* import 'package:pandeli_app/data/repositories/orders_data.dart'; */
import 'package:flutter/material.dart';
import 'package:pandeli_app/pages/sections/info_order.dart';
import 'package:provider/provider.dart';
import 'package:pandeli_app/dtos/providers/orders_provider.dart';

class ListViewOrders extends StatelessWidget {
  const ListViewOrders({super.key});

  @override
  Widget build(BuildContext context) {
    const _Color = Color(0xff0a1356b);
    const _backgroundColor = Color(0xff0F3DDE1);
    /*  var orders = OrdersRepository.getOrders(); */
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: Column(children: [
        const SizedBox(
          height: 15,
        ),
        const Text(
          "Mis Pedidos",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: _Color // establece la letra en negrita
              ),
        ),
        const SizedBox(
          height: 10,
        ),
        Consumer<OrdersProvider>(
          builder: (context, ordersProvider, child) => ordersProvider.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 12),
                      itemCount: ordersProvider.orders?.length,
                      itemBuilder: (context, index) {
                        final orden = ordersProvider.orders?[index];

                        return Card(
                          child: ListTile(
                            title: Text(
                              orden!.flavor,
                              style: const TextStyle(
                                fontWeight: FontWeight
                                    .bold, // establece la letra en negrita
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Tamaño: ${orden.size}'),
                                Text('Relleno: ${orden.stuffing}'),
                                Text('Fecha: ${orden.orderDay}'),
                                Text('Precio: ${orden.total}'),
                              ],
                            ),
                            leading: FadeInImage.assetNetwork(
                              placeholder: 'images/loading.gif',
                              image: orden.imgUrl,
                              fit: BoxFit.cover,
                              height: double.infinity,
                            ),
                            trailing: Text(orden.status,
                                style: const TextStyle(color: Colors.green)),
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        InfoOrder(orden: orden))),
                          ),
                        );
                      })),
        )
      ]),
    );
  }
  /*  body: Column(
        children: [
          Consumer<OrdersProvider>(
              builder: (context, orderProvider, child) => orderProvider
                      .isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Expanded(
                      child: ListView.builder(
                          itemCount: orderProvider.orders?.length,
                          itemBuilder: (BuildContext context, int index) {
                            final order = orderProvider.orders![index];
                            return ListTile(
                              leading: FadeInImage.assetNetwork(
                                placeholder: 'images/loading.gif',
                                image: order.imgUrl,
                              ),
                              title: Text(
                                order.user,
                                style: const TextStyle(
                                  fontWeight: FontWeight
                                      .bold, // establece la letra en negrita
                                ),
                              ),
                              subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(order.size),
                                    Text(order.flavor),
                                    Text(order.status),
                                  ]),
                            );
                          }),
                    ))
        ],
      ),
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
          Text("Relleno: ${orders.stuffing}"),
          Text('Fecha: ${orders.ordenday}'),

          /* Text(
               'Estado: ${orders.status}',
               style: TextStyle(
                   color: orders.status == 'En proceso'
                       ? Colors.orange
                       : Colors.green),
             ), */
        ]),
        trailing:
            Text(orders.status, style: const TextStyle(color: Colors.green)),
        onTap: () => DisplayInfOrders(context, orders),
      );

  DisplayInfOrders(BuildContext context, Orders orders) => showCupertinoDialog(
      context: context,
      builder: (context) => AlertDialog(
            elevation: 15,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            title: const Center(child: Text("Informacion Pedido")),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Nombre: ",
                        style: TextStyle(
                          fontWeight:
                              FontWeight.bold, // establece la letra en negrita
                        ),
                      ),
                      Text(orders.name),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 200,
                    child: FadeInImage.assetNetwork(
                      placeholder: 'images/loading.gif',
                      image: orders.urlPedido,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text("Tamaño: ${orders.size}"),
                  Text("Sabor: ${orders.flavor}"),
                  Text("Compra: ${orders.status}"),
                  Text("Relleno: ${orders.stuffing}"),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  )),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"),
              ),
            ],
          ));

  FadeInImage CreateTrailingItem(Orders orders) {
    return FadeInImage.assetNetwork(
      placeholder: 'images/loading.gif',
      image: orders.urlPedido,
      fit: BoxFit.cover,
      height: double.infinity,
    );
  } */
}
