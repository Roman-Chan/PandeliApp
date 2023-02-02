import 'package:flutter/material.dart';
import 'package:pandeli_app/Widgets/option_card.dart';
import 'package:pandeli_app/Widgets/title_section.dart';

class FillingSection extends StatelessWidget {
  final PageController pageController;

  const FillingSection({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    const options = [
      "https://ichef.bbci.co.uk/food/ic/food_16x9_448/recipes/definitivechocolatec_72226_16x9.jpg",
      "https://www.bhg.com/thmb/Gx1g056d7izOhdLty7TNZGpNyDs=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/dark-chocolate-cake-fresh-strawberry-buttercream-RU238198-8c5c17efd8df4a6a9881df6c23c4f791.jpg",
      "https://savorthebest.com/wp-content/uploads/2019/04/easy-vanilla-cake-filling_3955.jpg",
      "https://richanddelish.com/wp-content/uploads/2022/03/strawberry-jam-cake-1.jpg"
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Column(
          children: [
            const TitleSection(title: "Relleno"),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(12),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: options.length,
                itemBuilder: (BuildContext context, int index) {
                  return OptionCard(
                      imageUrl: options[index], title: "Relleno ${index + 1}");
                },
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
