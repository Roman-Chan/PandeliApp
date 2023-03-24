import 'package:flutter/material.dart';
import 'package:pandeli_app/Widgets/option_card_test.dart';
import 'package:pandeli_app/Widgets/option_design.dart';
import 'package:pandeli_app/Widgets/title_section.dart';
import 'package:pandeli_app/dtos/providers/designs_provider.dart';
import 'package:pandeli_app/dtos/providers/order_provider.dart';
import 'package:provider/provider.dart';

class MakeOrderPage extends StatelessWidget {
  const MakeOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final designProvider = context.read<DesignsProvider>().fetchDesigns();

    var orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.background,
      body: Consumer2<DesignsProvider, OrderProvider>(
        builder: (context, designsProvider, orderProvider, child) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const TitleSection(
                title: "pasteles",
              ),
              designsProvider.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.all(12),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              orientation == Orientation.portrait ? 2 : 4,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio:
                              orientation == Orientation.portrait ? 0.90 : 0.85,
                        ),
                        itemCount: designsProvider.designs?.length,
                        itemBuilder: (BuildContext context, int index) {
                          final design = designsProvider.designs![index];

                          return OptionCardTest(
                            imageUrl: design.imgUrl,
                            title: design.description,
                            price: design.price.toString(),
                            active:
                                orderProvider.design?.id == design.id,
                            onTapHandler: () {
                              orderProvider.design = design;
                              Navigator.pushNamed(
                                context,
                                '/options',
                              );
                            },
                          );
                        },
                      ),
                    ),
            ],
          );
        },
      ),
    );
  }
}
