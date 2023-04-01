import 'package:flutter/material.dart';
import 'package:pandeli_app/Widgets/info_inputs/title.dart';
import 'package:pandeli_app/Widgets/info_inputs/view_info_user.dart';

class InfoProfilePage extends StatelessWidget {
  const InfoProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff0F3DDE1),
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: ListView(
          children: [
            Column(
              children: const [
                TitleInfo(),
                SizedBox(height: 10,),
                ViewProfile(),
              ],
            ),
          ],
        )
      );
  }
}
