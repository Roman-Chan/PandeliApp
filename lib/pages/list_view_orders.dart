import 'package:flutter/material.dart';
import 'package:pandeli_app/dtos/response/orders_response_dto.dart';
import 'package:provider/provider.dart';
import 'package:pandeli_app/dtos/providers/orders_provider.dart';

class ListViewOrders extends StatelessWidget {
  const ListViewOrders({super.key});

  @override
  Widget build(BuildContext context) {
    const _Color = Color(0xff0a1356b);
    const _backgroundColor = Color(0xff0F3DDE1);

    return Scaffold(
      backgroundColor: _backgroundColor,
      body: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: const Text("Mis pedidos",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 18, color: _Color)),
        ),
        Expanded(child:
            Consumer<OrdersProvider>(builder: (context, ordersProvider, child) {
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
            return ListView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                itemCount: ordersProvider.orders?.length,
                itemBuilder: (context, index) {
                  final orden = ordersProvider.orders?[index];

                  return Card(
                    child: ListTile(
                      title: Text(
                        orden!.description,
                        style: const TextStyle(
                          fontWeight:
                              FontWeight.bold, // establece la letra en negrita
                        ),
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
                }
                );
          }
        }))
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
            title: Center(child: Text(orden.description)),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: FadeInImage.assetNetwork(
                      placeholder: 'images/loading.gif',
                      image: orden.imgUrl,
                      fit: BoxFit.cover,
                      height: 200,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildAttribute('Tamaño', orden.size),
                      _buildAttribute('Sabor', orden.flavor),
                      _buildAttribute('Relleno', orden.stuffing),
                      _buildAttribute('Fecha', orden.orderDay),
                      _buildAttribute('Precio', '\$${orden.total}'),
                      Row(
                        children: [
                          _buildText('Estatus: ',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          Text(
                            orden.status,
                            style: const TextStyle(color: Colors.green),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
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

  Widget _buildText(String text, {TextStyle? style}) {
    return Padding(
      padding: const EdgeInsets.only(left: 17.0, bottom: 3.0),
      child: Text(
        text,
        style: style,
      ),
    );
  }

  Widget _buildAttribute(String attribute, String value) {
    return Padding(
      padding: const EdgeInsets.only(left: 17.0, bottom: 3.0),
      child: Row(
        children: [
          Text(
            '$attribute: ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
