import 'package:flutter/material.dart';

class InputInfo extends StatelessWidget {
  final String text;
  final String value;
  const InputInfo({super.key, required this.text, required this.value});

  @override
  Widget build(BuildContext context) {
    final _controller = TextEditingController(text: value);
    return Column(
      children: [
        SizedBox(
          child: TextField(
            controller:  _controller,
            decoration: InputDecoration(
              filled: true,
              labelText: text,
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
