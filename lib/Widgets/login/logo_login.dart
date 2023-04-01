import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(
        'images/logo.jpeg',
        width: 200,
        height: 200,
        fit: BoxFit.cover,
      ),
    );
  }
}