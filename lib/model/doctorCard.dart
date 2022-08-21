
import 'package:flutter/material.dart';
import 'package:wajah_id/screens/doctorsList.dart';

import 'package:wajah_id/screens/homepage/prodDetails/details_screen.dart';
import '../utils/constants.dart';
import '../utils/size_config.dart';


import 'Product.dart';
import 'colorPallete.dart';
import 'doctor_model/doctorModel.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    Key key,
    this.width = 140,
    this.aspectRetio = 1.02,
    @required this.doctor,
  }) : super(key: key);

  final double width, aspectRetio;
  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(width),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(
          context,
          DetailsScreen.routeName,
          arguments: DoctorsList(),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.02,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                decoration: BoxDecoration(
                  color: CardBackgroundColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Hero(
                  tag: UniqueKey(),
                  child: Image(


                  ),

                ),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(6.5)),
            Text(doctor.name,
                maxLines: 1,
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black)),
            Text(
              "${doctor.experience} years",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                fontFamily: 'PantonBold',
                color: WajahColors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
