import 'package:flutter/material.dart';
import 'package:pandeli_app/Widgets/option_card.dart';
import 'package:pandeli_app/Widgets/title_section.dart';
import 'package:pandeli_app/providers/stuffings_provider.dart';
import 'package:provider/provider.dart';

class FillingSection extends StatelessWidget {
  final PageController pageController;

  const FillingSection({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Column(
          children: [
            const TitleSection(title: "Relleno"),
            Consumer<StuffingsProvider>(
              builder: (context, stuffingsProvider, child) => stuffingsProvider
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
                          childAspectRatio: 0.90,
                        ),
                        itemCount: stuffingsProvider.stuffings?.length,
                        itemBuilder: (BuildContext context, int index) {
                          final stuffing = stuffingsProvider.stuffings![index];

                          return OptionCard(
                            imageUrl: stuffing.imgUrl,
                            title: stuffing.stuffing,
                            price: stuffing.price.toString(),
                          );
                        },
                      ),
                    ),
            ),
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
                backgroundColor: Theme.of(context).colorScheme.onPrimary,
                foregroundColor: Theme.of(context).colorScheme.primary,
              ),
              child: const Text("Anterior"),
            ),
          ],
        ),
      ),
    );
  }
}
