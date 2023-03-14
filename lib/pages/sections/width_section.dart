import 'package:flutter/material.dart';
// import 'package:pandeli_app/Widgets/option_card.dart';
import 'package:pandeli_app/Widgets/option_card_test.dart';
import 'package:pandeli_app/Widgets/title_section.dart';
import 'package:pandeli_app/dtos/providers/order_provider.dart';
import 'package:pandeli_app/dtos/providers/sizes_provider.dart';
import 'package:provider/provider.dart';

class WidthSection extends StatelessWidget {
  final PageController pageController;

  const WidthSection({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Consumer2<SizesProvider, OrderProvider>(
          builder: (context, sizesProvider, orderProvider, child) {
            return Column(
              children: [
                const TitleSection(title: "Tamaño"),
                sizesProvider.isLoading
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
                                orderProvider.size = size.size;
                              },
                              active: orderProvider.getSize == size.size,
                            );
                          },
                        ),
                      ),
                ElevatedButton(
                  onPressed: orderProvider.getSize != ''
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
            );
          },
        ),
      ),
    );
  }
}
