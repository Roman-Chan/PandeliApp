// ignore_for_file: non_constant_identifier_names
/* import 'package:pandeli_app/data/repositories/orders_data.dart'; */
import 'package:flutter/material.dart';
/* import 'package:pandeli_app/pages/sections/info_order.dart'; */
import 'package:pandeli_app/dtos/response/orders_response_dto.dart';
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
                            onTap: () {
                              detailsAlert(context, orden);
                            },
                          ),
                        );
                      })),
        )
      ]),
    );
  }

  Future<dynamic> detailsAlert(BuildContext context, OrderResponseDto orden) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Theme(
          data: ThemeData(
            dialogBackgroundColor: Colors.transparent,
          ),
          child: AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            title: Text(orden.flavor),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FadeInImage.assetNetwork(
                  placeholder: 'images/loading.gif',
                  image: orden.imgUrl,
                  fit: BoxFit.cover,
                  height: 200,
                ),
                Column(
                  children: [
               
                    const SizedBox(
                      height: 10,
                    ),
                    Text(orden.status,
                        style: const TextStyle(color: Colors.green)),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Tamaño: ${orden.size}'),
                    Text('Relleno: ${orden.stuffing}'),
                    Text('Fecha: ${orden.orderDay}'),
                    Text('Precio: ${orden.total}'),
                  ],
                )
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cerrar'),
              ),
            ],
          ),
        );
      },
    );
  }
}
