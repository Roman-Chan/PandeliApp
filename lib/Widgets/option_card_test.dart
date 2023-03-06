import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final Function() onTapHandler;
  final bool active;

  const OptionCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.onTapHandler,
    required this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapHandler(),
      child: CardContent(
        imageUrl: imageUrl,
        title: title,
        price: price,
        active: active,
      ),
    );
  }
}

class CardContent extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final bool active;

  const CardContent({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    double widthAndHeight = orientation == Orientation.portrait ? 100 : 120;
    double widthContainerText = orientation == Orientation.portrait ? 90 : 100;
    const double raidius = 10;

    return Card(
      color: active
          ? Theme.of(context).colorScheme.onPrimaryContainer
          : Theme.of(context).colorScheme.tertiaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
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
            Divider(
              height: 10,
              color: active
                  ? Theme.of(context).colorScheme.primaryContainer
                  : Theme.of(context).colorScheme.onTertiaryContainer,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: widthContainerText,
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.bodyLarge?.merge(
                          TextStyle(
                            color: active
                                ? Theme.of(context).colorScheme.primaryContainer
                                : Theme.of(context)
                                    .colorScheme
                                    .onTertiaryContainer,
                          ),
                        ),
                    textAlign: TextAlign.left,
                  ),
                ),
                const Spacer(),
                Text(
                  '\$$price',
                  style: Theme.of(context).textTheme.bodyLarge?.merge(
                        TextStyle(
                          color: active
                              ? Theme.of(context).colorScheme.primaryContainer
                              : Theme.of(context)
                                  .colorScheme
                                  .onTertiaryContainer,
                        ),
                      ),
                  textAlign: TextAlign.right,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
