import 'package:flutter/material.dart';
import 'package:wajah_id/model/product_card.dart';
import 'package:wajah_id/model/view_models/globalVariables_viewModel.dart';
import 'package:wajah_id/utils/constants.dart';
import 'package:wajah_id/utils/size_config.dart';

import 'package:provider/provider.dart';

import '../../doctorsList.dart';


class CategoryScreen extends StatelessWidget {
  static String routeName = "/category";

  @override
  Widget build(BuildContext context) {
    final CategoryDetailsArguments args =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: PrimaryLightColor,
      appBar: AppBar(
        elevation: 5,
        shadowColor: SecondaryColorDark.withOpacity(0.2),
        iconTheme: IconThemeData(color: SecondaryColorDark),
        title: Text(
          args.category,
          style: TextStyle(
            color: SecondaryColorDark,
            fontSize: getProportionateScreenWidth(20),
            fontWeight: FontWeight.w900,
            fontFamily: 'Panton',
          ),
        ),
        backgroundColor: CardBackgroundColor,
      ),
      body: Consumer<globalVars>(builder: (_, gv, __) {
        return GridView.count(
          padding: EdgeInsets.all(getProportionateScreenWidth(25)),
          childAspectRatio: Theme.of(context).platform == TargetPlatform.iOS
              ? MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 1.5)
              : MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 1.35),
          crossAxisSpacing: getProportionateScreenWidth(25),
          crossAxisCount: 2,
          children: List.generate(
            gv.AllCategory[args.category].length,
            (index) {
              return DoctorsList();
                //ProductCard(product: gv.AllCategory[args.category][index]);
            },
          ),
        );
      }),
    );
  }
}

class CategoryDetailsArguments {
  final String category;
  CategoryDetailsArguments({@required this.category});
}
