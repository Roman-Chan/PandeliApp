import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children : [ 
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
        ),
      ),
    );
  }
}