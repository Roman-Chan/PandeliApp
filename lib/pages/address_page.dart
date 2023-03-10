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
        title: const Text('Direcciones'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Mis Direcciones",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: _color,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Consumer<AddressProvider>(
              builder: (context, addressProvider, child) {
                if (addressProvider.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (addressProvider.address == null ||
                    addressProvider.address!.isEmpty) {
                  return const Center(
                    child: Text('No hay Direcciones.'),
                  );
                } else {
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    itemCount: addressProvider.address!.length,
                    itemBuilder: (context, i) {
                      final addresses = addressProvider.address![i].addresses;
                      return Column(
                        children: List.generate(
                          addresses.length,
                          (index) {
                            final address = addresses[index];
                            return Card(
                              margin: const EdgeInsets.only(bottom: 5),
                              child: ListTile(
                                title: Text(
                                  address,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                leading: const Icon(
                                  Icons.directions_outlined,
                                  color: Colors.blue,
                                ),
                                trailing: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
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
          color: Colors.blue,
        ),
      ),
    );
  }
}