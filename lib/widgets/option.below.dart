import 'package:flutter/material.dart';

class OpcionBelow extends StatelessWidget {
  final String text;
  final String textButton;
  final Function pressBelow;
  const OpcionBelow({
    Key? key,
    required this.text,
    required this.textButton,
    required this.pressBelow
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(text),
        TextButton(onPressed: () {pressBelow(context);}, child: Text(textButton),
        )
      ],
    );
  }
}