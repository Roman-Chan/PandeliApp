import 'package:flutter/material.dart';

class ButtonPassword extends StatelessWidget {
  final Function onPressed;
  const ButtonPassword({
    Key? key, required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {onPressed(context);},
            child: const Text('Olvide mi contraseña'),
          ),
        ],
      ),
    );
  }
}