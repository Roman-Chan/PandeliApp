import 'package:flutter/material.dart';
import 'package:pandeli_app/Widgets/widgets_details_order.dart';
import 'package:provider/provider.dart';
import 'package:pandeli_app/dtos/providers/orders_provider.dart';

class ListViewOrders extends StatelessWidget {
  const ListViewOrders({super.key});

  @override
  Widget build(BuildContext context) {
    const _Color = Color(0xff0a1356b);
    const _backgroundColor = Color(0xff0F7D8DF);

    return Scaffold(
      backgroundColor: _backgroundColor,
      body: RefreshIndicator(
        onRefresh: () async {
          await Provider.of<OrdersProvider>(context, listen: false)
              .fetchOrders();
        },
        child: Consumer<OrdersProvider>(
          builder: (context, ordersProvider, child) {
            if (ordersProvider.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (ordersProvider.orders == null ||
                ordersProvider.orders!.isEmpty) {
              return const Center(
                child: Text('No hay órdenes.'),
              );
            } else {
              return Column(
                children: [
                  /*  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: const Text(
                      "Mis pedidos",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: _Color),
                    ),
                  ), */
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      itemCount: ordersProvider.orders?.length,
                      itemBuilder: (context, index) {
                        final orden = ordersProvider.orders?[index];
                        return Card(
                          child: ListTile(
                            title: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    orden!.description,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: _Color,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  orden.status == "preparing order"
                                      ? "preparing order"
                                      : "order finished",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: orden.status == "preparing order"
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                ),
                              ],
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Sabor: ${orden.flavor}'),
                                Text('Tamaño: ${orden.size}'),
                                Text('Relleno: ${orden.stuffing}'),
                                Text('Fecha: ${orden.orderDay}'),
                                Text('Precio: \$${orden.total}'),
                              ],
                            ),
                            leading: AspectRatio(
                              aspectRatio: 1.5,
                              child: FadeInImage.assetNetwork(
                                placeholder: 'images/loading.gif',
                                image: orden.imgUrl,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            /*  trailing: Text(
                              orden.status,
                              style: const TextStyle(color: Colors.green),
                            ), */
                            onTap: () {
                              detailsAlert(context, orden);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
