
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wajah_id/model/product_card.dart';
import 'package:wajah_id/model/view_models/auth_viewModel.dart';
import 'package:wajah_id/model/view_models/globalVariables_viewModel.dart';
import 'package:wajah_id/utils/constants.dart';
import 'package:wajah_id/utils/size_config.dart';

import 'package:provider/provider.dart';


class FavScreen extends StatefulWidget {
  static String routeName = "/favs";

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  User _u;
  Future _futureUserInfo;

  @override
  void initState() {
    _u = Provider.of<auth_viewModel>(context, listen: false).CurrentUser();
    _futureUserInfo =
        Provider.of<globalVars>(context, listen: false).getUserInfo(_u);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<globalVars>(builder: (_, gv, __) {
          return FutureBuilder(
              future: _futureUserInfo,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    gv.prodsLoaded == true) {
                  if (gv.UserInfo != null &&
                      gv.UserInfo.containsKey('Favorites') &&
                      gv.UserInfo["Favorites"].isNotEmpty) {
                    return GridView.count(
                      padding: EdgeInsets.all(getProportionateScreenWidth(25)),
                      childAspectRatio:
                          Theme.of(context).platform == TargetPlatform.iOS
                              ? MediaQuery.of(context).size.width /
                                  (MediaQuery.of(context).size.height / 1.5)
                              : MediaQuery.of(context).size.width /
                                  (MediaQuery.of(context).size.height / 1.35),
                      crossAxisSpacing: getProportionateScreenWidth(25),
                      crossAxisCount: 2,
                      children: List.generate(
                        gv.UserInfo["Favorites"].length,
                        (index) {
                          return ProductCard(
                              product: gv.getSpecificProd(
                                  gv.UserInfo["Favorites"][index].toString()));
                        },
                      ),
                    );
                  } else {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.favorite_border_outlined,
                            size: 90,
                            color: PrimaryColor,
                          ),
                          SizedBox(height: getProportionateScreenHeight(10)),
                          Text(
                            "No Favourite Items",
                            style: TextStyle(
                                fontFamily: 'Panton',
                                color: SecondaryColor,
                                fontWeight: FontWeight.w900),
                          )
                        ],
                      ),
                    );
                  }
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.favorite_border_outlined,
                          size: 90,
                          color: PrimaryColor,
                        ),
                        SizedBox(height: getProportionateScreenHeight(10)),
                        Text(
                          "No Favourite Items",
                          style: TextStyle(
                              fontFamily: 'Panton',
                              color: SecondaryColor,
                              fontWeight: FontWeight.w900),
                        )
                      ],
                    ),
                  );
                }
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.favorite_border_outlined,
                        size: 90,
                        color: PrimaryColor,
                      ),
                      SizedBox(height: getProportionateScreenHeight(10)),
                      Text(
                        "No Favourite Items",
                        style: TextStyle(
                            fontFamily: 'Panton',
                            color: SecondaryColor,
                            fontWeight: FontWeight.w900),
                      )
                    ],
                  ),
                );
              });
        }),
      ),
    );
  }
}
