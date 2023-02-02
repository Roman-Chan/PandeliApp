import 'package:flutter/material.dart';
import 'package:pandeli_app/pages/sections/fillin_section.dart';
import 'package:pandeli_app/pages/sections/flavor_section.dart';
import 'package:pandeli_app/pages/sections/width_section.dart';

class OptionsPage extends StatelessWidget {
  const OptionsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final args =
    // ModalRoute.of(context)?.settings.arguments as DesignOptionSelected;

    PageController pageController = PageController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Elige tus ingredientes"),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          WidthSection(pageController: pageController),
          FlavorSection(pageController: pageController),
          FillingSection(pageController: pageController),
        ],
      ),
    );
  }
}

class DesignOptionSelected {
  final String message;

  DesignOptionSelected(this.message);
}
