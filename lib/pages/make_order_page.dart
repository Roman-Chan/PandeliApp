import 'package:flutter/material.dart';
import 'package:pandeli_app/Widgets/option_design.dart';
import 'package:pandeli_app/Widgets/title_section.dart';

class MakeOrderPage extends StatelessWidget {
  const MakeOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> urls = [
      "https://cdn.pixabay.com/photo/2016/03/27/22/38/cake-1284548_640.jpg",
      "https://cdn.pixabay.com/photo/2018/09/11/11/47/cake-3669245_640.jpg",
      "https://cdn.pixabay.com/photo/2018/08/30/20/47/gugelhupf-3643259_640.jpg",
      "https://cdn.pixabay.com/photo/2017/05/23/22/33/birthday-2338813_640.jpg",
      "https://cdn.pixabay.com/photo/2016/11/22/18/52/cake-1850011_640.jpg"
    ];

    var orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const TitleSection(
            title: "pasteles",
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: urls.length,
              itemBuilder: (BuildContext context, int index) {
                return OptionDesign(
                  imageUrl: urls[index],
                  title: "Nuevo pastel ${index + 1}",
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}