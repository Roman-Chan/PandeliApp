import 'package:flutter/material.dart';
import 'package:pandeli_app/Widgets/option_card.dart';
import 'package:pandeli_app/Widgets/title_section.dart';
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
        child: Column(
          children: [
            const TitleSection(title: "Tamaño"),
            Consumer<SizesProvider>(
              builder: (context, sizesProvider, child) => sizesProvider
                      .isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.all(12),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              orientation == Orientation.portrait ? 2 : 4,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 0.80,
                        ),
                        itemCount: sizesProvider.sizes?.length,
                        itemBuilder: (BuildContext context, int index) {
                          final size = sizesProvider.sizes![index];

                          return OptionCard(
                            imageUrl: size.imgUrl,
                            title: size.size,
                            price: size.price.toString(),
                          );
                        },
                      ),
                    ),
            ),
            ElevatedButton(
              onPressed: () {
                pageController.nextPage(
                  duration: const Duration(
                    milliseconds: 250,
                  ),
                  curve: Curves.easeInOut,
                );
              },
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
  }
}
