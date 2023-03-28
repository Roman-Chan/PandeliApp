import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pandeli_app/Widgets/title_section.dart';
import 'package:pandeli_app/dtos/providers/address_provider.dart';
import 'package:pandeli_app/dtos/providers/order_provider.dart';
// import 'package:pandeli_app/dtos/providers/orders_provider.dart';
// import 'package:pandeli_app/dtos/response/design_response_dto.dart';
import 'package:provider/provider.dart';

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
        context.read<OrderProvider>().deliveriDate = selectedDateFormat;
        context.read<OrderProvider>().createOrder();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order'),
      ),
      body: Consumer2<OrderProvider, AddressProvider>(
        builder: (context, orderProvider, addressProvider, child) {
          var orientation = MediaQuery.of(context).orientation;
          double widthAndHeight =
              orientation == Orientation.portrait ? 200 : 300;
          const double raidius = 10;

          var design = orderProvider.design;
          var size = orderProvider.size;
          var flavor = orderProvider.flavor;
          var stuffing = orderProvider.stuffing;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Dirección: ',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.merge(
                                  TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                          ),
                          DropdownButton<int>(
                            value: orderProvider.address,
                            items: [
                              DropdownMenuItem(
                                value: orderProvider.address,
                                child: Text(
                                  // '${'${addressProvider.address?.first.addresses[orderProvider.address]}'.substring(0, 21)}...',
                                  'Hola',
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                            ],
                            onChanged: (int? value) {
                              orderProvider.address = value!;
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: orderProvider.isComplete
                          ? () {
                              orderProvider.postOrder();
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
