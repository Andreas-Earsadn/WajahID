import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wajah_id/clinic/all_clinic.dart';
import 'package:wajah_id/doctor/all_doctor.dart';
import 'package:wajah_id/model/colorPallete.dart';
import 'package:wajah_id/screens/homepage/category/categoryScreen.dart';
import 'package:wajah_id/utils/size_config.dart';

import '../../doctorsList.dart';


class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/SkinClinic.svg", "text": "Skin Clinic"},
      {"icon": "assets/icons/Doctor.svg", "text": "Doctor"},
      {"icon": "assets/icons/SkinProduct.svg", "text": "Skin Products"},
      {"icon": "assets/icons/SpecialOffer.svg", "text": "Special Offer"},

    ];
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,


        children: <Widget>[
          CategoryCard(icon: "assets/icons/SkinClinic.svg", text: 'Skin Clinic',
              press: () async {Navigator.push(context, MaterialPageRoute(builder: (context) => AllClinicPage()),);}),

          CategoryCard(icon: "assets/icons/Doctor.svg", text: 'Doctor',
              press: () async {Navigator.push(context, MaterialPageRoute(builder: (context) => AllDoctorPage()),);}),

          CategoryCard(icon: "assets/icons/SkinProduct.svg", text: 'Skin Product',
              press: () async {Navigator.push(context, MaterialPageRoute(builder: (context) => AllClinicPage()),);}),

          CategoryCard(icon: "assets/icons/SpecialOffer.svg", text: 'Special Offer',
              press: () async {Navigator.push(context, MaterialPageRoute(builder: (context) => AllClinicPage()),);}),



        ],

      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(13)),
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                color: WajahColors.WajahCategories,
                borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: WajahColors.WajahPrimary)
               // border: WajahColors.WajahHoverPrimary,
              ),
              child: SvgPicture.asset(
                icon,
                color: WajahColors.WajahHoverPrimaryText,
              ),
            ),
            SizedBox(height: getProportionateScreenWidth(7)),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'PantonBold',
                  fontSize: getProportionateScreenWidth(10),
                  color: WajahColors.WajahPrimary),
            )
          ],
        ),
      ),
    );
  }
}
