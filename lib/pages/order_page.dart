import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pandeli_app/Widgets/title_section.dart';
import 'package:pandeli_app/dtos/providers/address_provider.dart';
import 'package:pandeli_app/pages/error_page.dart';
// import 'package:pandeli_app/dtos/providers/order_provider.dart';
import 'package:pandeli_app/pages/sections/add_address_section.dart';
import 'package:pandeli_app/dtos/providers/orders_provider.dart';
import 'package:pandeli_app/pages/success_page.dart';
// import 'package:pandeli_app/dtos/response/design_response_dto.dart';
import 'package:provider/provider.dart';

import '../dtos/response/address_response_dto.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  DateTime selectedDate = DateTime.now().add(const Duration(days: 4));
  String selectedDateFormat = DateFormat('dd/MM/yyyy')
      .format(DateTime.now().add(const Duration(days: 4)));

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now().add(const Duration(days: 4)),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        selectedDateFormat = DateFormat('dd/MM/yyyy').format(selectedDate);
        context.read<OrdersProvider>().deliveriDate = selectedDateFormat;
        context.read<OrdersProvider>().createOrder();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order'),
      ),
      body: Consumer2<OrdersProvider, AddressProvider>(
        builder: (context, orderProvider, addressProvider, child) {
          var orientation = MediaQuery.of(context).orientation;
          double widthAndHeight =
              orientation == Orientation.portrait ? 200 : 300;
          const double raidius = 10;

          var design = orderProvider.design;
          var size = orderProvider.size;
          var flavor = orderProvider.flavor;
          var stuffing = orderProvider.stuffing;
          // orderProvider.address = addressProvider.address?.first.index ?? 0;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, bottom: 10),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TitleSection(title: 'Información del pedido'.toUpperCase()),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(raidius),
                      child: FadeInImage.assetNetwork(
                        placeholder: "images/loading.gif",
                        image: design!.imgUrl,
                        width: widthAndHeight,
                        height: widthAndHeight,
                        fit: BoxFit.cover,
                        imageErrorBuilder: (context, error, stackTrace) =>
                            Image.asset(
                          'images/404-placeholder.png',
                          width: widthAndHeight,
                          height: widthAndHeight,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Column(
                      children: [
                        InfoOrderOption(
                            title: 'Diseño', value: design.description),
                        InfoOrderOption(
                            title: 'Tamaño del pan', value: size!.size),
                        InfoOrderOption(
                            title: 'Sabor del pan', value: flavor!.flavor),
                        InfoOrderOption(
                            title: 'Sabor del relleno',
                            value: stuffing!.stuffing),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedCardContainer(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Fecha de entrega:'),
                          const SizedBox(width: 20),
                          TextButton.icon(
                            onPressed: () {
                              _selectDate(context);
                            },
                            label: Text(selectedDateFormat),
                            icon: Icon(
                              Icons.calendar_month,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedCardContainer(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Dirección: ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.merge(
                                        TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                      ),
                                ),
                                DropdownButton<int>(
                                  value: orderProvider.address ?? 0,
                                  items: addressProvider.address
                                      ?.map(
                                        (AddressResponseDto value) =>
                                            DropdownMenuItem(
                                          value: value.index,
                                          child: Text(
                                            '${value.address.substring(0, 21)}...',
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (int? value) {
                                    orderProvider.address = value!;
                                    orderProvider.createOrder();
                                  },
                                ),
                              ],
                            ),
                            const Divider(color: Colors.black38),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const AddAddresSection(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Theme.of(context).colorScheme.tertiary,
                                elevation: 5,
                              ),
                              child: const Text(
                                'Agregar',
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'El pago se realizara en efectivo al recibir el pedido',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: orderProvider.isComplete
                          ? () {
                              orderProvider.postOrder().then((result) {
                                result
                                    ? Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const SuccessPage(),
                                        ),
                                      )
                                    : Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ErrorPage(),
                                        ),
                                      );
                              });
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary),
                      label: Text(
                        'Pagar \$${orderProvider.subtotal}',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      icon: const Icon(Icons.attach_money, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ElevatedCardContainer extends StatelessWidget {
  const ElevatedCardContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 0,
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      // color: Theme.of(context).colorScheme.primary,
      child: child,
    );
  }
}

class InfoOrderOption extends StatelessWidget {
  const InfoOrderOption({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$title:',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const Spacer(),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
