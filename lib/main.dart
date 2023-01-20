import 'package:flutter/material.dart';
import 'package:holamundo/pages/account.dart';
import 'package:holamundo/pages/home.dart';
import 'package:holamundo/pages/info_order.dart';
import 'package:holamundo/pages/info_profile.dart';
import 'package:holamundo/pages/login.dart';
import 'package:holamundo/pages/order_history.dart';
import 'package:holamundo/pages/pay.dart';
import 'package:holamundo/pages/payment_methods.dart';
import 'package:holamundo/pages/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Routes Demo',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const Login(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => const Register(),
        '/third': (context) => const Home(),
        '/fourth': (context) => const OrderHistory(), 
        '/fifth': (context) => const Account(), 
        '/sixth': (context) => const PaymentMethods(), 
        '/seventh': (context) => const InfoProfile(), 
        '/eighth': (context) => const InfoOrder(),
        '/ninth': (context) => const Pay(), 

      },
    );
  }
}
