import 'package:flutter/material.dart';

class InputInfo extends StatelessWidget {
  final String text;
  final String value;
  const InputInfo({super.key, required this.text, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              labelText: text,
              hintText: value,
              fillColor: Colors.white,
              labelStyle:const  TextStyle(
                color: Colors.black,
              ),
              enabledBorder:const  OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0.6, color: Colors.black
                )
              )
            ),
          ),
        )
      ],
    );
  }
}
