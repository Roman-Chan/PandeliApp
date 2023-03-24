import 'package:flutter/material.dart';
import 'package:pandeli_app/Widgets/info_inputs/button_save.dart';
import 'package:pandeli_app/Widgets/info_inputs/inputs_info_user.dart';
import 'package:pandeli_app/dtos/providers/info_provider.dart';
import 'package:provider/provider.dart';

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
          child: Consumer<InfoProvider>(builder:((context, infoProvider, child) =>
          infoProvider.isloadin ? const Center(
                    child: CircularProgressIndicator(),)
          : Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    InputInfo(
                    text: 'Correo',
                    value: infoProvider.user?.email ?? '',
                  ),
                    const SizedBox(
                      height: 10,
                    ),
                    InputInfo(
                      text: 'name',
                      value:infoProvider.user?.name  ?? '' ,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InputInfo(
                      text: 'Apellido',
                      value: infoProvider.user?.lastname ?? '',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const InputInfo(
                      text: 'Número de telefono',
                      value:  '',
                    ),
                    const SizedBox(width: 50),
                    const ButtonSave()
                  ],
                ),
              )
            ],
          )   
  ))
        ));
  }
}

