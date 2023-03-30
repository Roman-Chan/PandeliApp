import 'package:flutter/material.dart';
import 'package:pandeli_app/Widgets/option_card_test.dart';
import 'package:pandeli_app/Widgets/title_section.dart';
import 'package:pandeli_app/dtos/providers/orders_provider.dart';
import 'package:pandeli_app/dtos/providers/sizes_provider.dart';
import 'package:provider/provider.dart';

class WidthSection extends StatelessWidget {
  final PageController pageController;

  const WidthSection({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: Consumer2<SizesProvider, OrdersProvider>(
        builder: (context, sizesProvider, orderProvider, child) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: RefreshIndicator(
              onRefresh: () => sizesProvider.fetchSizes(),
              child: Column(
                children: [
                  const TitleSection(title: "Tamaño"),
                  sizesProvider.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : sizesProvider.sizes!.isEmpty
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
                                  childAspectRatio: 0.80,
                                ),
                                itemCount: sizesProvider.sizes?.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final size = sizesProvider.sizes![index];

                                  return OptionCardTest(
                                    imageUrl: size.imgUrl,
                                    title: size.size,
                                    price: size.price.toString(),
                                    onTapHandler: () {
                                      orderProvider.size = size;
                                    },
                                    active: orderProvider.size?.id == size.id,
                                  );
                                },
                              ),
                            ),
                  if (sizesProvider.isLoading || sizesProvider.sizes!.isEmpty)
                    const Spacer(),
                  ElevatedButton(
                    onPressed: orderProvider.size != null
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
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                    ),
                    child: const Text("Siguiente"),
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
