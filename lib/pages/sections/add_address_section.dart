import 'package:flutter/material.dart';
import 'package:pandeli_app/dtos/providers/address_provider.dart';
import 'package:provider/provider.dart';

class AddAddresSection extends StatelessWidget {
  const AddAddresSection({super.key});

  @override
  Widget build(BuildContext context) {
    const _Color = Color(0xff0a1356b);
    final formKey = GlobalKey<FormState>();
    final calleController = TextEditingController();
    final numeroController = TextEditingController();
    final cruzamientosController = TextEditingController();
    final coloniaController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Añadir Direccion'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Calle'),
                    border: OutlineInputBorder(),
                  ),
                  controller: calleController,
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
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Numero de casa'),
                    border: OutlineInputBorder(),
                  ),
                  controller: numeroController,
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
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Cruzamientos'),
                    border: OutlineInputBorder(),
                  ),
                  controller: cruzamientosController,
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
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Colonia'),
                    border: OutlineInputBorder(),
                  ),
                  controller: coloniaController,
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _Color,
                        fixedSize: const Size(double.maxFinite, 50),
                        textStyle: const TextStyle(fontSize: 15),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          final address = '${calleController.text} ${numeroController.text} ${cruzamientosController.text} ${coloniaController.text}';
                          context
                              .read<AddressProvider>()
                              .createAddres(address, context);
                        }
                      },
                      child: const Text('Agregar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
