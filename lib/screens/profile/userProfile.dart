import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:wajah_id/firestore-data/appointmentHistoryList.dart';
import 'package:wajah_id/model/colorPallete.dart';
import 'package:wajah_id/screens/userSettings.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key key}) : super(key: key);
 static String routeName = "/users";

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  FirebaseAuth _auth = FirebaseAuth.instance;
  User user;

  Future<void> _getUser() async {
   user = _auth.currentUser;
  }

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowGlow();
            return;
          },
          child: ListView(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.1, 0.5],
                            colors: [
                              WajahColors.WajahPrimaryLightColor,
                              WajahColors.WajahPrimaryLightColor,
                            ],
                          ),
                        ),
                        height: MediaQuery.of(context).size.height / 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 15),
                              child: CircleAvatar(
                                radius: 60,
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage('assets/user.png'),
                              ),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.teal[50],
                                    width: 4,
                                  ),
                                  shape: BoxShape.circle),
                            ),

                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                   Text(
                                      user.displayName,
                                      style: GoogleFonts.roboto(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                ],
                              ),
                            ),

                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    user.displayName,
                                    style: GoogleFonts.roboto(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Container(

                              padding: EdgeInsets.only(top: 10),
                              alignment: Alignment.topRight,
                              child: IconButton(
                                icon: Icon(
                                  FlutterIcons.gear_faw,
                                  color: WajahColors.WajahPrimary,
                                  size: 20,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => UserSettings(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Container(
                      //   margin: const EdgeInsets.all(20),
                      //   decoration: BoxDecoration(
                      //     gradient: LinearGradient(
                      //       begin: Alignment.topCenter,
                      //       end: Alignment.bottomCenter,
                      //       stops: [0.1, 0.5],
                      //       colors: [
                      //         WajahColors.WajahPrimaryLightColor,
                      //         WajahColors.WajahPrimaryLightColor,
                      //       ],
                      //     ),
                      //   ),
                      //   alignment: Alignment.center,
                      //   height: MediaQuery.of(context).size.height / 5,
                      //   padding: EdgeInsets.only(top: 75),
                      //   child: Text(
                      //     user.displayName,
                      //     style: GoogleFonts.lato(
                      //       fontSize: 25,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      // ),

                    ],
                  ),
                  // Container(
                  //   child: CircleAvatar(
                  //     radius: 80,
                  //     backgroundColor: Colors.white,
                  //     backgroundImage: AssetImage('assets/person.jpg'),
                  //   ),
                  //   decoration: BoxDecoration(
                  //       border: Border.all(
                  //         color: Colors.teal[50],
                  //         width: 5,
                  //       ),
                  //       shape: BoxShape.circle),
                  // ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                padding: EdgeInsets.only(left: 20),
                height: MediaQuery.of(context).size.height / 7,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: WajahColors.WajahPrimaryLightColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            height: 27,
                            width: 27,
                            color: WajahColors.WajahPrimary,
                            child: Icon(
                              Icons.mail_rounded,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          user.email,
                          style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            height: 27,
                            width: 27,
                            color: WajahColors.WajahPrimary,
                            child: Icon(
                              Icons.phone,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          user?.phoneNumber?.isEmpty ?? true
                              ? "Not Added"
                              : user.phoneNumber,
                          style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Container(
              //   margin: EdgeInsets.only(left: 15, right: 15, top: 20),
              //   padding: EdgeInsets.only(left: 20, top: 20),
              //   height: MediaQuery.of(context).size.height / 7,
              //   width: MediaQuery.of(context).size.width,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     color: Colors.blueGrey[50],
              //   ),
              //   child: Column(
              //     children: [
              //       Row(
              //         children: [
              //           ClipRRect(
              //             borderRadius: BorderRadius.circular(30),
              //             child: Container(
              //               height: 27,
              //               width: 27,
              //               color: Colors.indigo[600],
              //               child: Icon(
              //                 FlutterIcons.pencil_ent,
              //                 color: Colors.white,
              //                 size: 16,
              //               ),
              //             ),
              //           ),
              //           SizedBox(
              //             width: 10,
              //           ),
              //           Text(
              //             'Bio',
              //             style: GoogleFonts.lato(
              //               fontSize: 16,
              //               fontWeight: FontWeight.bold,
              //               color: Colors.black,
              //             ),
              //           ),
              //         ],
              //       ),
              //       Container(
              //         child: getBio(),
              //       )
              //     ],
              //   ),
              // ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15, top: 20),
                padding: EdgeInsets.only(left: 20, top: 20),
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Container(
                            height: 27,
                            width: 27,
                            color: WajahColors.WajahPrimary,
                            child: Icon(
                              FlutterIcons.ios_body_ion,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Skin Profile",
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(right: 10),
                            alignment: Alignment.centerRight,
                            child: SizedBox(
                              height: 30,
                              child: TextButton(
                                onPressed: () {},

                                  child: Icon(
                                    FlutterIcons.right_ant,
                                    color: WajahColors.WajahPrimary,
                                    size: 16,

                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Scrollbar(
                        child: Container(
                          padding: EdgeInsets.only(left: 35, right: 15),
                          child: SingleChildScrollView(
                            //child: AppointmentHistoryList(),
                          ),
                        ),
                      ),
                    ),

                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Container(
                            height: 27,
                            width: 27,
                            color: WajahColors.WajahPrimary,
                            child: Icon(
                              FlutterIcons.place_mdi,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Shopping Address",
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(right: 10),
                            alignment: Alignment.centerRight,
                            child: SizedBox(
                              height: 30,
                              child: TextButton(
                                onPressed: () {},

                                child: Icon(
                                  FlutterIcons.right_ant,
                                  color: WajahColors.WajahPrimary,
                                  size: 16,

                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Scrollbar(
                        child: Container(
                          padding: EdgeInsets.only(left: 35, right: 15),
                          child: SingleChildScrollView(
                            //child: AppointmentHistoryList(),
                          ),
                        ),
                      ),
                    ),


                    //====

                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Container(
                            height: 27,
                            width: 27,
                            color: WajahColors.WajahPrimary,
                            child: Icon(
                              FlutterIcons.note_multiple_mco,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Transactions History",
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(right: 10),
                            alignment: Alignment.centerRight,
                            child: SizedBox(
                              height: 30,
                              child: TextButton(
                                onPressed: () {},

                                child: Icon(
                                  FlutterIcons.right_ant,
                                  color: WajahColors.WajahPrimary,
                                  size: 16,

                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Scrollbar(
                        child: Container(
                         // height: double.maxHeight,
                         // width: double.infinity,

                          padding: EdgeInsets.only(left: 35, right: 15),
                          child: SingleChildScrollView(
                            child: Container(
                                child: UserSettings()),
                          ),
                        ),
                      ),
                    ),

                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Container(
                            height: 27,
                            width: 27,
                            color: WajahColors.WajahPrimary,
                            child: Icon(
                              FlutterIcons.setting_ant,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Settings",
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(right: 10),
                            alignment: Alignment.centerRight,
                            child: SizedBox(
                              height: 30,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                      builder: (context) => UserSettings(),
                                  ),
                                  );

                                },

                                child: Icon(
                                  FlutterIcons.right_ant,
                                  color: WajahColors.WajahPrimary,
                                  size: 16,

                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 2,
                    primary: WajahColors.WajahButtonPrimary.withOpacity(0.9),
                    onPrimary: WajahColors.WajahHoverPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {

                  },
                  child: Text(
                    'Logout',
                    style: GoogleFonts.lato(
                      color: WajahColors.WajahButtonPrimaryText,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),


            ],
          ),
        ),
      ),
    );
  }

  Widget getBio() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(),
          );
        var userData = snapshot.data;
        return Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(top: 10, left: 40),
          child: Text(
            userData['bio'] == null ? "No Bio" : userData['bio'],
            style: GoogleFonts.lato(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black38,
            ),
          ),
        );
      },
    );
  }
}
