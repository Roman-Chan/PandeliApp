import 'package:flutter/material.dart';
import 'package:pandeli_app/pages/account_page.dart';
import 'package:pandeli_app/pages/make_order_page.dart';
import 'package:pandeli_app/pages/list_view_orders.dart';
/* import 'package:pandeli_app/pages/orders_page.dart'; */

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _selectedIndex = 1;

  static const List<Widget> _pageOptions = <Widget>[
   /*  OrdersPage(), */
   ListViewOrders(),
    MakeOrderPage(),
    AccountPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: Theme.of(context).colorScheme.outline,
        surfaceTintColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text('Home'),
      ),
      body: _pageOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
        unselectedItemColor: Theme.of(context).colorScheme.onSurfaceVariant,
        selectedItemColor: const Color(0xFFC26B00),
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_sharp),
            label: "Orders",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Account",
          ),
        ],
      ),
    );
  }
}
