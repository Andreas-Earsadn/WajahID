import 'package:flutter/material.dart';
import 'package:wajah_id/model/colorPallete.dart';


AppBar buildAppBar(BuildContext context) {
  return AppBar(
    title: Text('Skin Product'),
    foregroundColor: WajahColors.WajahPressedButton,
    centerTitle: true,
    shadowColor: Colors.black,
    leading: BackButton(),
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}
