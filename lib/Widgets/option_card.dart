import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({
    Key? key,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);

  final String imageUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    double widthAndHeight = orientation == Orientation.portrait ? 100 : 120;
    const double raidius = 10;

    return Card(
      color: Theme.of(context).colorScheme.tertiaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(raidius),
              child: FadeInImage.assetNetwork(
                placeholder: "images/loading.gif",
                image: imageUrl,
                width: double.infinity,
                height: widthAndHeight,
                fit: BoxFit.cover,
              ),
            ),
            const Spacer(),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge?.merge(
                    TextStyle(
                      color:
                          Theme.of(context).colorScheme.onTertiaryContainer,
                    ),
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}