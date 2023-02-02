import 'package:flutter/material.dart';

class InfoOrderPage extends StatelessWidget {
  const InfoOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order information'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/ninth');
              },
              child: const Text('Pago'),
            ),
          ],
        ),
      ),
    );
  }
}
