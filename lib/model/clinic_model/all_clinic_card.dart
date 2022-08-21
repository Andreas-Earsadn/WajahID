import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wajah_id/clinic/detail_clinic.dart';
import 'package:wajah_id/model/clinic_model/clinicModel.dart';


import '../colorPallete.dart';

class AllClinicCard extends StatelessWidget {

  final Clinic clinic;
  //final ClinicDoctor clinicDoctor;

  final VoidCallback callback;

  final AnimationController animationController;
  final Animation<double> animation;

  const AllClinicCard({
    Key key,
    @required this.clinic,
    this.animationController,
    this.animation,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        height: 300,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: <BoxShadow>[
              BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 10,
                color: WajahColors.WajahPrimaryLightColor,
              ),
            ]),
        child: Card(
          child: InkWell(
            splashColor: WajahColors.WajahBrandColor,
            onTap: () async {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => DetailClinicScreen(clinic: clinic),

              ));

            },


            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize:  MainAxisSize.max,
                children:<Widget>[
                  Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 40),
                        child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                            child: AspectRatio(aspectRatio: 2, child: Image.asset(clinic.imagePath, fit: BoxFit.cover),)),
                      ),
                      ClipRRect(
                        borderRadius: new BorderRadius.circular(40.0),
                        child: Image.asset(clinic.logo, height: 80, width: 80),
                      ),
                    ],
                  ),


                  Container(
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(

                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            colors: [
                              WajahColors.WajahButtonSecondary.withOpacity(.8),
                              WajahColors.WajahButtonSecondary.withOpacity(.8),
                            ]
                        )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[

                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    '${clinic.title}'+' '+'-' +' '+ '${clinic.placeName}',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19,
                                      letterSpacing: 0.27,
                                      color:Colors.black,
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  '${clinic.location}',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 13,
                                    letterSpacing: 0.27,
                                    color:WajahColors.grey,
                                  ),
                                ),
                              ),




                            ],
                          ),
                        ),


                        Container(

                          child: Row(
                            children: <Widget>[
                              Text(
                                '${clinic.rating}',
                                textAlign:
                                TextAlign.left,
                                style: TextStyle(
                                  fontWeight:
                                  FontWeight.normal,
                                  fontSize: 12,
                                  letterSpacing: 0.27,
                                  color:WajahColors.black.withAlpha(150),
                                ),
                              ),

                              RatingBar.builder(
                                initialRating: clinic.rating,
                                unratedColor: WajahColors.grey.withAlpha(50),
                                minRating: 1,
                                maxRating: 5,
                                itemSize: 15.0,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: WajahColors.WajahRating,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                                updateOnDrag: true,
                              ),

                              Text(
                                  '  '
                              ),


                              Text(
                                '${clinic.reviewer}'+' '+'reviews',
                                textAlign:
                                TextAlign.left,
                                style: TextStyle(
                                  fontWeight:
                                  FontWeight.normal,
                                  fontSize: 12,
                                  letterSpacing: 0.27,
                                  color:WajahColors.black.withAlpha(150),
                                ),
                              ),


                            ],
                          ),


                        ),

                        currentWidget(),

                        SizedBox(
                          height: 5,
                        )

                      ],
                    ),
                  ),
                ],




              ),
            ),
          ),
        )

    );
  }

  static DateTime now = DateTime.now();

  Widget currentWidget() {
    var hours = now.hour;

    if (hours >= clinic.openHour && hours < clinic.closeHour) {
      return _openSaat();
    } else
      return _closeSaat();
  }

  Widget _openSaat() {
    return

      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget> [Text("Opened", style:TextStyle(fontWeight: FontWeight.normal, fontSize: 12, letterSpacing: 0.27, color:WajahColors.black.withAlpha(150),


          ),
          )
          ],
        ),
      );
  }

  Widget _closeSaat() {
    return Container(

      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget> [
          Text("Closed" +' ',
            style:TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12, letterSpacing: 0.27,
              color:Colors.red.withAlpha(150),
            ),
          ),
          Text("Opened at " + '${clinic.openHour.toString() + ' '+'AM'}',
            style:TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12, letterSpacing: 0.27,
              color:WajahColors.black.withAlpha(150),
            ),
          ),


        ],
      ),
    );
  }
}