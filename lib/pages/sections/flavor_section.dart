import 'package:flutter/material.dart';
import 'package:pandeli_app/Widgets/option_card.dart';
import 'package:pandeli_app/Widgets/title_section.dart';

class FlavorSection extends StatelessWidget {
  final PageController pageController;

  const FlavorSection({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    const options = [
      "https://flourdeliz.com/wp-content/uploads/2017/10/spicy-chocolate-cake-social-image.jpg",
      "https://i.pinimg.com/originals/75/c8/c4/75c8c475876adeff6fcda6ef4f58e1e2.jpg",
      "https://i.ytimg.com/vi/qKqI_np12aw/maxresdefault.jpg",
      "https://cdn2.cocinadelirante.com/sites/default/files/styles/gallerie/public/images/2018/04/receta-de-pan-de-limon-en-microondas.jpg",
      "https://lh3.googleusercontent.com/-1TE7Nxh3bpg/YJCSJPwYoXI/AAAAAAAAHyQ/wuWltr-lzkYIavFS0pZZo4cdypsmtqvZwCLcBGAsYHQ/s900/1620087334596768-0.png"
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const TitleSection(title: "Sabor"),
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
                    imageUrl: options[index],
                    title: "Pan ${index + 1}",
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
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    foregroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  child: const Text("Anterior"),
                ),
                const SizedBox(
                  width: 10,
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
          ],
        ),
      ),
    );
  }
}
