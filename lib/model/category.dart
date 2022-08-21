import 'package:flutter/material.dart';
import 'package:wajah_id/model/product_card.dart';
import 'package:wajah_id/model/view_models/globalVariables_viewModel.dart';

import 'package:wajah_id/screens/homepage/category/categoryScreen.dart';
import 'package:wajah_id/screens/homepage/home/components/section_title.dart';
import '../utils/size_config.dart';

import 'package:provider/provider.dart';


class category extends StatelessWidget {
  final String cat;

  category({@required this.cat});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: getProportionateScreenWidth(20)),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
              title: cat,
              press: () {
                Navigator.pushNamed(
                  context,
                  CategoryScreen.routeName,
                  arguments: CategoryDetailsArguments(category: cat),
                );
              }),
        ),
        SizedBox(height: getProportionateScreenHeight(8)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Consumer<globalVars>(builder: (_, gv, __) {
            return Row(
              children: [
                ...List.generate(
                  gv.AllCategory[cat].length < 5 ? gv.AllCategory[cat].length : 5,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: ProductCard(product: gv.AllCategory[cat][index]),
                    );
                  },
                ),
                SizedBox(width: getProportionateScreenWidth(20)),
              ],
            );
          }),
        ),
      ],
    );
  }
}
