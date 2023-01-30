import 'package:flutter/material.dart';

class ButtonForm extends StatelessWidget {
  final String text;
  final Function functionOnPressed;
  const ButtonForm({super.key,
  required this.text,
  required this.functionOnPressed
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:20.0, right:20.0),
      child: Column(
        children: [
          Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFF8C3F7C),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: TextButton(
                onPressed: (){
                  functionOnPressed(context);},
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ),
        ],
      ),
    );
  }
}
