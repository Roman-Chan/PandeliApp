import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pandeli_app/Widgets/title_section.dart';
import 'package:pandeli_app/dtos/providers/order_provider.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  DateTime selectedDate = DateTime.now().add(const Duration(days: 3));

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

          var imgURL = orderProvider.getImgURL;
          var design = orderProvider.getDesignName;
          var order = orderProvider.order;
          print(order);
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
                      image: imgURL,
                      width: widthAndHeight,
                      height: widthAndHeight,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Diseño: $design',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Fecha de entrega: '),
                      TextButton(
                        style: ButtonStyle(),
                          onPressed: () {
                            _selectDate(context);
                          },
                          child: Text('${selectedDate.day}/${selectedDate.month}/${selectedDate.year}')),
                    ],
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
