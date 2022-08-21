import 'package:flutter/material.dart';
import 'package:wajah_id/screens/product/appBar.dart';
import 'package:wajah_id/screens/product/component/custome_bottomnav.dart';
import 'package:wajah_id/screens/product/skinproduct/body.dart';

import 'enums.dart';



class skinproduct extends StatelessWidget {
  static String routeName = '/Profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CustomBottomNavigatorBar(
        selectedMenu: MenuState.Profile,
      ),
    );
  }
}
