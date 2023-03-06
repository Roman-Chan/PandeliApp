import 'package:flutter/material.dart';
import 'package:pandeli_app/dtos/providers/address_provider.dart';
import 'package:pandeli_app/pages/sections/add_address_section.dart';
import 'package:provider/provider.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    const _Color = Color(0xff0a1356b);
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
                color: _Color // establece la letra en negrita
                ),
          ),
          const SizedBox(
            height: 10,
          ),
          Consumer<AddressProvider>(
            builder: (context, addressProvider, child) => addressProvider
                    .isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        addressProvider.address!.length,
                        (i) => ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: addressProvider.address?[i].length ?? 0,
                          itemBuilder: (context, index) {
                            // final address = addressProvider.address?[i].addresses.elementAt(index);
                            final address =
                                addressProvider.address?[i].addresses[index];
                            return Card(
                              margin: const EdgeInsets.only(bottom: 5),
                              child: ListTile(
                                title: Text(
                                  '$address',
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
                      ),
                    ),
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
