import 'package:flutter/material.dart';
import 'package:pandeli_app/dtos/providers/address_provider.dart';
import 'package:pandeli_app/pages/sections/add_address_section.dart';
import 'package:provider/provider.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _color = Color(0xff0a1356b);
    const _backgroundColor = Color(0xff0F3DDE1);
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: const Text('Direcciones'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<AddressProvider>(
              builder: (context, addressProvider, child) {
                return addressProvider.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : addressProvider.address!.isEmpty
                        ? const Center(
                            child: Text('No hay direcciones'),
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            itemCount: addressProvider.address!.length,
                            itemBuilder: (context, i) {
                              final address = addressProvider.address![i];
                              return Card(
                                margin: const EdgeInsets.only(bottom: 4),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide.none,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                child: ListTile(
                                  title: Text(
                                    address.address,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  leading: const Icon(
                                    Icons.directions_outlined,
                                    color: Colors.blue,
                                  ),
                                  trailing: IconButton(
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      addressProvider.deleteAddress(i);
                                    },
                                  ),
                                ),
                              );
                            },
                          );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: _color,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddAddresSection(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
