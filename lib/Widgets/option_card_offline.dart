import 'package:flutter/material.dart';

class OptionCardOffline extends StatelessWidget {
  const OptionCardOffline({
    Key? key,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);

  final String imageUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    const double widthAndHeight = 100;
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
              child: Image.asset(
                imageUrl,
                width: widthAndHeight,
                height: widthAndHeight,
                fit: BoxFit.fitWidth,
              ),
            ),
            const Spacer(),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge?.merge(
                    TextStyle(
                      color: Theme.of(context).colorScheme.onTertiaryContainer,
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
