import 'package:flutter/material.dart';
import 'package:pandeli_app/pages/account_page.dart';
import 'package:pandeli_app/pages/menu_page.dart';
import 'package:pandeli_app/pages/info_order_page.dart';
import 'package:pandeli_app/pages/info_profile_page.dart';
import 'package:pandeli_app/pages/login_page.dart';
import 'package:pandeli_app/pages/options_page.dart';
import 'package:pandeli_app/pages/list_view_orders.dart';
/* import 'package:pandeli_app/pages/orders_page.dart'; */
import 'package:pandeli_app/pages/payment_page.dart';
import 'package:pandeli_app/pages/payment_methods_page.dart';
import 'package:pandeli_app/pages/register_page.dart';
import 'package:pandeli_app/providers/designs_provider.dart';
import 'package:pandeli_app/providers/flavors_provider.dart';
import 'package:pandeli_app/providers/sizes_provider.dart';
import 'package:pandeli_app/providers/stuffings_provider.dart';
import 'package:pandeli_app/themes/color_schemes.g.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<DesignsProvider>(
          create: (context) => DesignsProvider()..fetchDesigns()),
      ChangeNotifierProvider<FlavorsProvider>(
          create: (context) => FlavorsProvider()..fetchFlavors()),
      ChangeNotifierProvider<StuffingsProvider>(
          create: (context) => StuffingsProvider()..fetchStuffings()),
      ChangeNotifierProvider<SizesProvider>(
          create: (context) => SizesProvider()..fetchSizes()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pandeli',

      debugShowCheckedModeBanner: false,

      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      // darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),

      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/signup': (context) => const RegisterPage(),
        '/home': (context) => const MenuPage(),
        '/options': (context) => const OptionsPage(),
        /* '/orders': (context) => const OrdersPage(), */
        '/orders': (context) => const ListViewOrders(),
        '/account': (context) => const AccountPage(),
        '/payment_methods': (context) => const PaymentMethodsPage(),
        '/info_profile': (context) => const InfoProfilePage(),
        '/info_order': (context) => const InfoOrderPage(),
        '/payment': (context) => const PaymentPage(),
      },
    );
  }
}
