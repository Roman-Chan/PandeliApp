import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pandeli_app/dtos/providers/orders_provider.dart';
import 'package:provider/provider.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      context.read<OrdersProvider>().clearOptions();
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[600],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline_outlined,
              size: 100,
              color: Colors.white,
            ),
            Text(
              'La compra se realizo exitosamente',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.merge(const TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}
