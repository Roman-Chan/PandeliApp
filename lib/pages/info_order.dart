import 'package:flutter/material.dart';

class InfoOrder extends StatelessWidget {
  const InfoOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order information'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children : [ 
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