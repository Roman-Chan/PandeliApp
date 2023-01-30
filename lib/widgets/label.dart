import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String text;
  const Label({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
      child: Column(
        children: [
          SizedBox(
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: text,
                labelStyle: const TextStyle(
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
