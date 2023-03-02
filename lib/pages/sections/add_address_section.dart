import 'package:flutter/material.dart';
import 'package:pandeli_app/dtos/providers/address_provider.dart';
import 'package:provider/provider.dart';

class AddAddresSection extends StatelessWidget {
  const AddAddresSection({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final addressController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Añadir Direccion'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Añadir Direccion'),
                  border: OutlineInputBorder(),
                ),
                controller: addressController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(double.maxFinite, 50),
                  textStyle: const TextStyle(fontSize: 15),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context
                        .read<AddressProvider>()
                        .createAddres(addressController.text,context);
                  }
                },
                child: const Text('Agregar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
