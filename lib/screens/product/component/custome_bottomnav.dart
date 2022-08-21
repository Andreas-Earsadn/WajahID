import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wajah_id/model/colorPallete.dart';
import 'package:wajah_id/screens/homepage/home/home_screen.dart';
import 'package:wajah_id/screens/product/kart/kart.dart';


import '../enums.dart';

class CustomBottomNavigatorBar extends StatelessWidget {
  const CustomBottomNavigatorBar({
    Key key,
    this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor =
        WajahColors.WajahDisabledSecondaryButtonText;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {


                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );

              },
              icon: SvgPicture.asset(
                'assets/icons/rumah.svg',
                color: MenuState.Home == selectedMenu
                    ? WajahColors.WajahDisabledSecondaryButtonText
                    : inActiveIconColor,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/wislis.svg',
                color: MenuState.Whistlist == selectedMenu
                    ? WajahColors.WajahDisabledSecondaryButtonText
                    : inActiveIconColor,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => mycart(),
                  ),
                );
              },
              icon: SvgPicture.asset(
                'assets/icons/kart.svg',
                color: MenuState.Cart == selectedMenu
                    ? WajahColors.WajahDisabledSecondaryButtonText
                    : inActiveIconColor,
              ),
            ),
            // IconButton(
            //   onPressed: () {},
            //   icon: SvgPicture.asset(
            //     'assets/icons/masage.svg',
            //     color: MenuState.Massage == selectedMenu
            //         ? WajahColors.WajahDisabledSecondaryButtonText
            //         : inActiveIconColor,
            //   ),
            // ),
            // IconButton(
            //   // onPressed: () =>
            //   //     // Navigator.pushNamed(context, skinproduct.routeName)
            //   // ,
            //   icon: SvgPicture.asset(
            //     'assets/icons/orang.svg',
            //     color: MenuState.Profile == selectedMenu
            //         ? WajahColors.WajahDisabledSecondaryButtonText
            //         : inActiveIconColor,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
