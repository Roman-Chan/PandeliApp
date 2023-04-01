import 'package:flutter/material.dart';
import 'package:pandeli_app/dtos/response/orders_response_dto.dart';

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
                      imageErrorBuilder: (context, error, stackTrace) =>
                          Image.asset('images/404-placeholder.png'),
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