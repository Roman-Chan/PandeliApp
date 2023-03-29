import 'package:flutter/material.dart';
import 'package:pandeli_app/Widgets/option_card_test.dart';
import 'package:pandeli_app/Widgets/title_section.dart';
import 'package:pandeli_app/dtos/providers/orders_provider.dart';
import 'package:pandeli_app/dtos/providers/stuffings_provider.dart';
import 'package:provider/provider.dart';

class FillingSection extends StatelessWidget {
  final PageController pageController;

  const FillingSection({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: Consumer2<StuffingsProvider, OrdersProvider>(
        builder: (context, stuffingsProvider, orderProvider, child) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: RefreshIndicator(
              onRefresh: () => stuffingsProvider.fetchStuffings(),
              child: Column(
                children: [
                  const TitleSection(title: "Relleno"),
                  stuffingsProvider.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : stuffingsProvider.stuffings!.isEmpty
                          ? const Center(
                              child: Text("No hay opciones"),
                            )
                          : Expanded(
                              child: GridView.builder(
                                padding: const EdgeInsets.all(12),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:
                                      orientation == Orientation.portrait
                                          ? 2
                                          : 4,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 0.90,
                                ),
                                itemCount: stuffingsProvider.stuffings?.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final stuffing =
                                      stuffingsProvider.stuffings![index];

                                  return OptionCardTest(
                                    imageUrl: stuffing.imgUrl,
                                    title: stuffing.stuffing,
                                    price: stuffing.price.toString(),
                                    active: orderProvider.stuffing?.id ==
                                        stuffing.id,
                                    onTapHandler: () {
                                      orderProvider.stuffing = stuffing;
                                    },
                                  );
                                },
                              ),
                            ),
                  if (stuffingsProvider.isLoading ||
                      stuffingsProvider.stuffings!.isEmpty)
                    const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          pageController.previousPage(
                            duration: const Duration(
                              milliseconds: 250,
                            ),
                            curve: Curves.easeInOut,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.onPrimary,
                          foregroundColor:
                              Theme.of(context).colorScheme.primary,
                        ),
                        child: const Text("Anterior"),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: orderProvider.stuffing != null
                            ? () {
                                orderProvider.createOrder();
                                orderProvider.calcSubtotal();
                                Navigator.pushNamed(context, '/order');
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          foregroundColor:
                              Theme.of(context).colorScheme.onPrimary,
                        ),
                        child: const Text("Siguiente"),
                      ),
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
