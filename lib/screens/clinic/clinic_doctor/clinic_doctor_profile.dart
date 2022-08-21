import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:provider/provider.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';
import 'package:wajah_id/model/clinic_model/clinicModel.dart';
import 'package:wajah_id/model/colorPallete.dart';
import 'package:wajah_id/model/doctor_model/doctorModel.dart';
import 'package:wajah_id/model/doctor_model/doctortheme/doctorTheme.dart';
import 'package:wajah_id/model/doctor_model/doctortheme/doctor_extention.dart';
import 'package:wajah_id/model/doctor_model/doctortheme/doctortext.dart';
import 'package:wajah_id/model/doctor_model/doctortheme/light_color.dart';

import 'package:wajah_id/model/view_models/globalVariables_viewModel.dart';

import 'package:wajah_id/screens/userProfile.dart';
import 'package:wajah_id/utils/size_config.dart';





class DetailClinicDoctorScreen extends StatefulWidget {
  final ClinicDoctor model;
  DetailClinicDoctorScreen({
    Key key,
    this.model,
  }) : super(key: key);

  @override
  _DetailClinicDoctorPageState createState() => _DetailClinicDoctorPageState();
}

class _DetailClinicDoctorPageState extends State<DetailClinicDoctorScreen> {
   ClinicDoctor model;

  List<Widget> _pageList = [];
  bool _hasBeenPressed1 = false;
  bool _hasBeenPressed2 = false;
  bool _hasBeenPressed3 = false;
  bool _isEnabled = true;
  bool _makeAppointment = false;
  final formatCurrency =  NumberFormat.simpleCurrency(locale: 'id_ID');
  @override
  void initState() {
    model = widget.model;


    super.initState();
    super.initState();
  }

  Widget _appbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        BackButton(
          color: WajahColors.WajahPrimary,
        ),


        Text('Doctor Profile'
          ,style:  GoogleFonts.roboto(
              color: WajahColors.WajahButtonPrimaryText,
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),

        IconButton(
          icon: Icon(
              model.isfavourite ? Icons.favorite : Icons.favorite_border,
              color: model.isfavourite ? WajahColors.WajahPrimary : WajahColors.WajahPrimaryLightColor
          ),
          onPressed: () {
            setState(() {
              model.isfavourite = !model.isfavourite;
            });
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final coverImageHeightCalc =
        MediaQuery.of(context).size.height / 2.5 ;


    TextStyle titleStyle = TextStyles.title.copyWith(fontSize: 25).bold;
    if (AppTheme.fullWidth(context) < 393) {
      titleStyle = TextStyles.title.copyWith(fontSize: 23).bold;
    }

    return Scaffold(

      backgroundColor: WajahColors.WajahPrimaryLightColor,

      body: SafeArea(

        bottom: true,
        child: Stack(
          children: <Widget>[


            Hero(

              tag: 'heroTag',
              child: Container(
                height: coverImageHeightCalc,
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    child: PageIndicatorContainer(
                      align: IndicatorAlign.bottom,
                      length: 1,
                      indicatorSpace: 12.0,
                      padding: EdgeInsets.only(bottom: 60),
                      indicatorColor: WajahColors.WajahPrimary,
                      indicatorSelectorColor: Colors.white,
                      shape: IndicatorShape.circle(size: 8),
                      child: PageView(
                        children: <Widget>[
                          //jika ingin menambahkan foto lebih dari 1

                          // Image.asset(
                          //   "assets/414.jpg",
                          //   fit: BoxFit.cover,
                          // ),
                          // Image.asset(
                          //   "assets/414.jpg", // <- stubbed data
                          //   fit: BoxFit.cover,
                          // ),
                          Image.asset(
                            model.image, // <- stubbed data
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    )),
              ),
            ),
            DraggableScrollableSheet(
              maxChildSize: .8,
              initialChildSize: .6,
              minChildSize: .6,
              builder: (context, scrollController) {
                return Container(
                  height: AppTheme.fullHeight(context) * .5,
                  padding: EdgeInsets.only(
                    left: 12,
                    right: 10,
                    top: 16,
                  ), //symmetric(horizontal: 19, vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ListTile(
                          title: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                model.name,
                                style: GoogleFonts.roboto(
                                  color: WajahColors.black,

                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                ),


                              ),
                              SizedBox(
                                width: 27,
                              ),



                              Container(

                                child: Text('Rp.'+ model.price.toString(),
                                  style: GoogleFonts.roboto(
                                    color: WajahColors.WajahButtonPrimaryText,
                                    backgroundColor: WajahColors.WajahPrimary,

                                    fontSize: 15.7,
                                    fontWeight: FontWeight.bold,
                                  ),

                                ),

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: WajahColors.WajahPrimary,
                                  boxShadow: [
                                    BoxShadow(color: WajahColors.WajahPrimary, spreadRadius: 3),
                                  ],
                                ),

                              ),

                            ],
                          ),

                          subtitle: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                FlutterIcons.user_nurse_faw5s,
                                color: WajahColors.WajahPrimary,
                                size: 20,
                              ),
                              Text(
                                model.type,
                                style: GoogleFonts.roboto(
                                  color: WajahColors.titleTextColor,

                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),

                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: .2,
                          color: LightColor.black,
                        ),


                        Container(
                          margin: const EdgeInsets.all(10),
                          child: Text(
                            model.description,textAlign: TextAlign.justify,
                            style:TextStyle(color:WajahColors.titleTextColor,fontSize: 15),
                          ),
                        ),
                        Divider(
                          thickness: .2,
                          color: LightColor.black,
                        ),

                        Container(
                          margin: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                FlutterIcons.md_briefcase_ion,
                                color: WajahColors.black,
                                size: 17,
                              ),
                              Text(model.experience.toString() +'  '+ 'Years', style: GoogleFonts.roboto()),
                              Icon(
                                FlutterIcons.user_friends_faw5s,
                                color: WajahColors.black,
                                size: 17,
                              ),
                              Text('220+', style: GoogleFonts.roboto()),
                              Icon(
                                Icons.star_rounded,
                                color: WajahColors.black,
                                size: 20,
                              ),
                              Text(model.rating.toString() , style: GoogleFonts.roboto()),

                            ],
                          ),
                        ),
                        Divider(
                          thickness: .2,
                          color: LightColor.black,
                        ),




                        Container(
                          margin: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                              Text('Available Time',
                                style: GoogleFonts.roboto(
                                  color: WajahColors.black,

                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),),


                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(right: 5, left: 5),

                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    height:80,
                                    width: 110,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: BorderSide(
                                          color: WajahColors.WajahPrimary,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Container(
                                        child: TextButton(
                                          child: Column(
                                            children:<Widget> [
                                              Text(
                                                "Mon", style: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 17),),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                "09:00", style: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 17),),
                                            ],
                                          ),
                                          style: ButtonStyle(
                                              padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(5)),
                                              backgroundColor: _hasBeenPressed1 ?  MaterialStateProperty.all<Color>(WajahColors.WajahPrimary) :  MaterialStateProperty.all<Color>(WajahColors.WajahButtonPrimaryText),
                                              foregroundColor:  _hasBeenPressed1?  MaterialStateProperty.all<Color>(WajahColors.WajahButtonPrimaryText) :  MaterialStateProperty.all<Color>(WajahColors.WajahPrimary),

                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(10.0),
                                                      side: BorderSide(color: WajahColors.WajahPrimary)
                                                  )
                                              )
                                          ),
                                          onPressed: () =>  {
                                            _makeAppointment = true,
                                            _hasBeenPressed2 = false,
                                            _hasBeenPressed3 = false,
                                            setState(() {

                                              _hasBeenPressed1 = !_hasBeenPressed1;
                                            })
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),

                                  SizedBox(
                                    height:80,
                                    width: 110,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: BorderSide(
                                          color: WajahColors.WajahPrimary,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Container(

                                        child: TextButton(
                                          child: Column(
                                            children:<Widget> [
                                              Text(
                                                "Tue", style: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 17),),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                "12:00", style: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 17),),
                                            ],
                                          ),
                                          style: ButtonStyle(
                                              padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(5)),
                                              backgroundColor: _hasBeenPressed2 ?  MaterialStateProperty.all<Color>(WajahColors.WajahPrimary) :  MaterialStateProperty.all<Color>(WajahColors.WajahButtonPrimaryText),
                                              foregroundColor:  _hasBeenPressed2?  MaterialStateProperty.all<Color>(WajahColors.WajahButtonPrimaryText) :  MaterialStateProperty.all<Color>(WajahColors.WajahPrimary),

                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(10.0),
                                                      side: BorderSide(color: WajahColors.WajahPrimary)
                                                  )
                                              )

                                          ),
                                          onPressed: () =>  {
                                            _makeAppointment = true,
                                            _hasBeenPressed1 = false,
                                            _hasBeenPressed3 = false,
                                            setState(() {

                                              _hasBeenPressed2 = !_hasBeenPressed2;
                                            })
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),

                                  SizedBox(
                                    height: 80,
                                    width: 110,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: BorderSide(
                                          color: WajahColors.WajahPrimary,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Container(
                                        child: TextButton(
                                          child: Column(
                                            children:<Widget> [
                                              Text(
                                                "Wed", style: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 17),),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                "15:00", style: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 17),),
                                            ],
                                          ),
                                          style: ButtonStyle(
                                              padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(5)),
                                              backgroundColor: _hasBeenPressed3 ?  MaterialStateProperty.all<Color>(WajahColors.WajahPrimary) :  MaterialStateProperty.all<Color>(WajahColors.WajahButtonPrimaryText),
                                              foregroundColor:  _hasBeenPressed3?  MaterialStateProperty.all<Color>(WajahColors.WajahButtonPrimaryText) :  MaterialStateProperty.all<Color>(WajahColors.WajahPrimary),

                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(10.0),
                                                      side: BorderSide(color: WajahColors.WajahPrimary)
                                                  )
                                              )
                                          ),
                                          onPressed: () =>  {
                                            _makeAppointment = true,
                                            _hasBeenPressed1 = false,
                                            _hasBeenPressed2 = false,
                                            setState(() {

                                              _hasBeenPressed3 = !_hasBeenPressed3;
                                            })
                                          },
                                        ),
                                      ),
                                    ),
                                  ),

                                ]
                            ),

                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Divider(
                          thickness: .2,
                          color: LightColor.black,
                        ),




                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[


                            Card1(),


                          ],
                        ).vP16,



                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              height: 40,
                              width: MediaQuery.of(context).size.width/1.11,
                              //width: 100,
                              child: ElevatedButton(


                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(5)),
                                    backgroundColor: _makeAppointment ?  MaterialStateProperty.all<Color>(WajahColors.WajahButtonPrimary.withOpacity(0.9)) :  MaterialStateProperty.all<Color>(WajahColors.WajahPrimaryLightColor),
                                    foregroundColor:  _makeAppointment?  MaterialStateProperty.all<Color>(WajahColors.WajahHoverPrimary) :  MaterialStateProperty.all<Color>(WajahColors.WajahPrimary),

                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),

                                        )
                                    )

                                ),
                                onPressed:_hasBeenPressed1 || _hasBeenPressed2 || _hasBeenPressed3 ? (){

                                }:null,
                                child: Text(
                                  'Make An Appointment',
                                  style: GoogleFonts.roboto(
                                    color: WajahColors.WajahButtonPrimaryText,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),


                            SizedBox(
                              height: 40,
                            ),

                          ],
                        ).vP16

                      ],
                    ),
                  ),
                );
              },

            ),
            _appbar(),

          ],
        ),


      ),

    );
  }

  void _onItemTapped(globalVars gv, int index) {
    setState(() {
      gv.selectedPage = index;
    });
  }
  enableButton(){

    setState(() {
      _isEnabled = true;
    });
  }

  disableButton(){

    setState(() {
      _isEnabled = false;
    });
  }
}

const loremIpsum =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

class Card1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: <Widget>[

                ScrollOnExpand(
                  scrollOnExpand: true,
                  scrollOnCollapse: false,
                  child: ExpandablePanel(
                    theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToCollapse: true,
                    ),
                    header: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Rating & Review",
                          style: GoogleFonts.roboto(
                            color: WajahColors.WajahPrimary,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    collapsed: Text(
                      loremIpsum,
                      softWrap: true,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ), expanded:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        for (var _ in Iterable.generate(5))
                          Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                loremIpsum,
                                softWrap: true,
                                overflow: TextOverflow.fade,
                              )),
                      ],
                    ),
                    builder: (_, collapsed, expanded) {
                      return Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        child: Expandable(
                          collapsed: collapsed,
                          expanded: expanded,
                          theme: const ExpandableThemeData(crossFadePoint: 0),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}