import 'package:flutter/material.dart';
import 'package:pandeli_app/Widgets/info_inputs/button_save.dart';
import 'package:pandeli_app/Widgets/info_inputs/inputs_info_user.dart';

class ViewProfile extends StatelessWidget {
  const ViewProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: Container(
          width: double.infinity,
          height: 450,
          decoration: BoxDecoration(
            color: Colors.white, // Agregar color de fondo
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: const [
                    SizedBox(height: 20),
                    InputInfo(
                      text: 'Nombre',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InputInfo(
                      text: 'Apellido',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InputInfo(
                      text: 'Correo',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InputInfo(
                      text: 'Número de telefono',
                    ),
                    SizedBox(width: 50),
                    ButtonSave()
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

