import 'package:flutter/material.dart';

class BtnFgPassword extends StatefulWidget {
  final String textp;
  final TextEditingController controller;
  const BtnFgPassword({Key? key, required this.controller, required this.textp}) : super(key: key);

  @override
  State<BtnFgPassword> createState() => _BtnFgPasswordState();
}

class _BtnFgPasswordState extends State<BtnFgPassword> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
      child: Column(
        children: [
          SizedBox(
            child: TextField(
              controller: widget.controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: widget.textp,
                labelStyle: const TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
                ),
              ),
              obscureText: _obscureText,
            ),
          ),
        ],
      ),
    );
  }
}
