import 'package:flutter/material.dart';
import 'package:pandeli_app/dtos/providers/order_provider.dart';
import 'package:pandeli_app/pages/sections/fillin_section.dart';
import 'package:pandeli_app/pages/sections/flavor_section.dart';
import 'package:pandeli_app/pages/sections/width_section.dart';
import 'package:provider/provider.dart';

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
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            context.read<OrderProvider>().clearOptions();
            Navigator.of(context).pop();
          },
        ),
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
