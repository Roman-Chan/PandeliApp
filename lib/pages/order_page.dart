import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pandeli_app/Widgets/title_section.dart';
import 'package:pandeli_app/dtos/providers/order_provider.dart';
import 'package:pandeli_app/dtos/providers/orders_provider.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  DateTime selectedDate = DateTime.now().add(const Duration(days: 3));
  String selectedDateFormat = DateFormat('dd/MM/yyyy')
      .format(DateTime.now().add(const Duration(days: 3)));

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now().add(const Duration(days: 3)),
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
      body: Consumer<OrderProvider>(
        builder: (context, orderProvider, child) {
          var orientation = MediaQuery.of(context).orientation;
          double widthAndHeight =
              orientation == Orientation.portrait ? 200 : 300;
          const double raidius = 10;

          var design = orderProvider.design;
          var size = orderProvider.size;
          var flavor = orderProvider.flavor;
          var stuffing = orderProvider.stuffing;

          return SingleChildScrollView(
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
                      Text(
                        'Diseño: ${design.description}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        'Tamaño: ${size?.size}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        'Sabor del pan: ${flavor?.flavor}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        'Relleno: ${stuffing?.stuffing}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Fecha de entrega:'),
                      ElevatedButton(
                        onPressed: () {
                          _selectDate(context);
                        },
                        child: Text(selectedDateFormat),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: orderProvider.isComplete ? () {
                      orderProvider.postOrder();
                    } : null,
                    child: const Text('Pagar'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
