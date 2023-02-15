import 'package:flutter/material.dart';

class TitleInfo extends StatelessWidget {
  const TitleInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: const Text("Mi información",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Color(0xffA1356B))),
    );
  }
}