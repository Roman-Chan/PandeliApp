import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  final String title;

  const TitleSection({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      child: Card(
        color: Theme.of(context).colorScheme.primary,
        
        child: SizedBox(
          width: double.infinity,
          height: 40,
          child: Center(
            child: Text(
              title.toUpperCase(),
              style: Theme.of(context).textTheme.titleLarge?.merge(
                TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                )
              ),
            ),
          ),
        ),
      ),
    );
  }
}