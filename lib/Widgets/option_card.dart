import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.price,
  }) : super(key: key);

  final String imageUrl;
  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    double widthAndHeight = orientation == Orientation.portrait ? 100 : 120;
    double widthContainerText = orientation == Orientation.portrait ? 90 : 100;
    const double raidius = 10;

    return Card(
      color: Theme.of(context).colorScheme.tertiaryContainer,
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
                imageErrorBuilder: (context, error, stackTrace) =>
                    Image.asset('images/404-placeholder.png', width: double.infinity, height: widthAndHeight, fit: BoxFit.cover,),
              ),
            ),
            const Spacer(),
            const Divider(
              height: 10,
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
                            color: Theme.of(context)
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
                          color:
                              Theme.of(context).colorScheme.onTertiaryContainer,
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
