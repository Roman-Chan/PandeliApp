import 'package:flutter/material.dart';

class ButtonPassword extends StatelessWidget {
  const ButtonPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {},
            child: const Text('Olvide mi contraseña'),
          ),
        ],
      ),
    );
  }
}