import 'package:flutter/material.dart';
import 'package:pandeli_app/Widgets/option_card.dart';
import 'package:pandeli_app/pages/options_page.dart';

class OptionDesign extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  const OptionDesign({super.key, required this.imageUrl, required this.title, required this.price,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/options',
          arguments: DesignOptionSelected(title),
        );
      },
      child: OptionCard(imageUrl: imageUrl, title: title, price: price,),
    );
  }
}

