import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children : [ 
          ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/fourth');
                },
                child: const Text('Order history'),
              ),
            
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/fifth');
              },
              child: const Text('Account'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/eighth');
              },
              child: const Text('order'),
            ),
          ],
        ),
      ),
    );
  }
}