import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/sixth');
          },
          child: const Text('Payment methods'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/seventh');
          },
          child: const Text('Info_Profile'),
        ),
      ],
    ));
  }
}
