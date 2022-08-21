
import 'package:flutter/material.dart';
import 'package:wajah_id/model/colorPallete.dart';
import 'package:wajah_id/screens/homepage/home/components/searchScreen.dart';

import 'package:wajah_id/utils/size_config.dart';


class searchBar extends StatelessWidget {
  const searchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      decoration: BoxDecoration(
        color: WajahColors.WajahSearchBar ,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        textInputAction: TextInputAction.search,
        onSubmitted: (value) {
          Navigator.pushNamed(
                context,
                SearchScreen.routeName,
                arguments: SearchKeyword(
                    keyword: value),
              );
        },
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenWidth(9)),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            labelText: "Search",
            labelStyle: TextStyle(color: WajahColors.WajahButtonPrimaryText),
            prefixIcon: Icon(Icons.search, color: WajahColors.WajahButtonPrimaryText,)),
      ),
    );
  }
}
