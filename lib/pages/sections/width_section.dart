import 'package:flutter/material.dart';
import 'package:pandeli_app/Widgets/option_card_offline.dart';
import 'package:pandeli_app/Widgets/title_section.dart';

class WidthSection extends StatelessWidget {
  final PageController pageController;

  const WidthSection({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Column(
          children: [
            const TitleSection(title: "Tamaño"),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(12),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return OptionCardOffline(
                      imageUrl: "images/medida-${(index + 1)}.png",
                      title: "${20 + (5 * index)} cm");
                },
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
