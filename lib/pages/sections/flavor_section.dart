import 'package:flutter/material.dart';
import 'package:pandeli_app/Widgets/option_card.dart';
import 'package:pandeli_app/Widgets/option_card_test.dart';
import 'package:pandeli_app/Widgets/title_section.dart';
import 'package:pandeli_app/dtos/providers/flavors_provider.dart';
import 'package:pandeli_app/dtos/providers/order_provider.dart';
import 'package:provider/provider.dart';

class FlavorSection extends StatelessWidget {
  final PageController pageController;

  const FlavorSection({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Consumer2<FlavorsProvider, OrderProvider>(
          builder: (context, flavorsProvider, orderProvider, child) {
            return Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisSize: MainAxisSize.max,
              children: [
                const TitleSection(title: "Sabor"),
                flavorsProvider.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Expanded(
                        child: GridView.builder(
                          padding: const EdgeInsets.all(12),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                orientation == Orientation.portrait ? 2 : 4,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 0.90,
                          ),
                          itemCount: flavorsProvider.flavors?.length,
                          itemBuilder: (BuildContext context, int index) {
                            final flavor = flavorsProvider.flavors![index];

                            return OptionCardTest(
                              imageUrl: flavor.imgUrl,
                              title: flavor.flavor,
                              price: flavor.price.toString(),
                              active: orderProvider.getFlavor == flavor.flavor,
                              onTapHandler: () {
                                orderProvider.flavor = flavor.flavor;
                              },
                            );
                          },
                        ),
                      ),
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
                        foregroundColor: Theme.of(context).colorScheme.primary,
                      ),
                      child: const Text("Anterior"),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: orderProvider.getFlavor != ''
                          ? () {
                              pageController.nextPage(
                                duration: const Duration(
                                  milliseconds: 250,
                                ),
                                curve: Curves.easeInOut,
                              );
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                      ),
                      child: const Text("Siguiente"),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
