import 'package:flutter/material.dart';

class ButtonSave extends StatelessWidget {
  const ButtonSave({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:20.0, right:20.0, top: 20),
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
                onPressed: (){},
                child: const Text(
                  'Guardar',
                  style: TextStyle(
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