import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wajah_id/chat/chats/chats_screen.dart';
import 'package:wajah_id/chat/messages/message_screen.dart';
import 'package:wajah_id/clinic/clinic_doctor/clinic_doctor_profile.dart';
import 'package:wajah_id/model/clinic_model/clinicModel.dart';


import '../colorPallete.dart';

class AllDoctorCard extends StatelessWidget {

  final ClinicDoctor clinicDoctor;
  //final ClinicDoctor clinicDoctor;

  final VoidCallback callback;

  final AnimationController animationController;
  final Animation<double> animation;

  const AllDoctorCard({
    Key key,
    @required this.clinicDoctor,
    this.animationController,
    this.animation,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: WajahColors.WajahBrandColor,
      onTap: () async {
        Navigator.push(context,MaterialPageRoute(
          builder: (context) => DetailClinicDoctorScreen(model: clinicDoctor,),
        ),);

      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        height: 140,
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
        child: Stack(
          children: [
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Container(
                height: 130,
                width: 90,
                decoration: BoxDecoration(
                    color: WajahColors.WajahBrandColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Image.asset(
                    clinicDoctor.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:<Widget> [
                      Container(
                        child: Row(
                          children: [
                            Text(clinicDoctor.name,
                                style: TextStyle(color: WajahColors.WajahPrimary, fontSize: 16)),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Text(
                              clinicDoctor.type,
                              style: TextStyle(color: WajahColors.WajahPrimary, fontSize: 14),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        child: Row(

                          children: <Widget> [
                            Icon(FlutterIcons.star_ant, color: WajahColors.WajahRating, size: 17,),
                            SizedBox(width: 5,),
                            Text(clinicDoctor.rating.toString(),
                                style: TextStyle(color: WajahColors.WajahPrimary, fontSize: 14)),
                            SizedBox(width: 15,),
                            Icon(FlutterIcons.briefcase_faw, color: WajahColors.WajahPrimary, size: 17,),
                            SizedBox(width: 5,),
                            Text(clinicDoctor.experience.toString() + ' '+'Years',
                                style: TextStyle(color: WajahColors.WajahPrimary, fontSize: 14)),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: Row(
                          children:<Widget> [
                            Text('Rp. '+clinicDoctor.price.toString(),
                              style:  GoogleFonts.roboto(
                                  color: WajahColors.WajahPrimary,
                                  backgroundColor: WajahColors.WajahPrimaryLightColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                         Spacer(),


                         IconButton(
                                color: WajahColors.WajahPrimary,
                                hoverColor: WajahColors.WajahPrimaryLightColor,
                                splashColor: WajahColors.WajahDisabledButton,
                                iconSize: 40,
                                icon: Icon(FlutterIcons.chat_ent),
                           onPressed: () => Navigator.push(context,
                             MaterialPageRoute(
                               builder: (context) => MessagesScreen(),
                             ),
                           ),
                              ),

                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              )
            ]),


          ],
        ),
      ),
    );
  }
}