
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:wajah_id/model/clinic_model/clinicModel.dart';
import 'package:wajah_id/model/colorPallete.dart';
import 'package:wajah_id/model/doctor_model/doctortheme/doctorTheme.dart';
import 'package:wajah_id/model/doctor_model/doctortheme/doctor_extention.dart';
import 'package:wajah_id/model/doctor_model/doctortheme/doctortext.dart';
import 'package:wajah_id/model/doctor_model/doctortheme/light_color.dart';

import 'package:wajah_id/model/view_models/globalVariables_viewModel.dart';






class  DetailClinicTreatmentScreen extends StatefulWidget {
  final ClinicTreatment model;
  DetailClinicTreatmentScreen({
    Key key,
    this.model,
  }) : super(key: key);

  @override
  _DetailTreatmentPageState createState() => _DetailTreatmentPageState();
}

class _DetailTreatmentPageState extends State<DetailClinicTreatmentScreen> {
  ClinicTreatment model;

  List<Widget> _pageList = [];
  DateTime _selectedDate;
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

  }



  @override
  Widget build(BuildContext context) {
    final coverImageHeightCalc = MediaQuery.of(context).size.height / 2.5 ;


    TextStyle titleStyle = TextStyles.title.copyWith(fontSize: 25).bold;
    if (AppTheme.fullWidth(context) < 393) {
      titleStyle = TextStyles.title.copyWith(fontSize: 23).bold;
    }

    return Scaffold(
      backgroundColor: WajahColors.WajahButtonPrimaryText,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Container(

          decoration: BoxDecoration(),
          //margin: EdgeInsets.only(right: 15, top: 15),

        ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          children: <Widget> [
            Container(
              margin: EdgeInsets.only(left: 0, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BackButton(),

                  Container(
                    margin: EdgeInsets.only(left: 80, right: 80),
                   // width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: Text(
                      'Treatment',
                      style: GoogleFonts.roboto(
                        color: WajahColors.WajahPrimary,
                        fontSize: 23,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),

                ],
              ),
            ),
          ],
        ),
        iconTheme: IconThemeData(
          color: WajahColors.WajahPrimary,
        ),
      ),

     // backgroundColor: WajahColors.WajahPrimaryLightColor,

      body: SingleChildScrollView(
        child: SafeArea(

          bottom: true,
          child: Column(
            children: <Widget>[


              Hero(

                tag: 'heroTag',
                child: Container(
                  height: coverImageHeightCalc,
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      child: PageIndicatorContainer(
                        align: IndicatorAlign.bottom,
                        length: 3,
                        indicatorSpace: 12.0,
                        padding: EdgeInsets.only(bottom: 60),
                        indicatorColor: WajahColors.WajahPrimary,
                        indicatorSelectorColor: Colors.white,
                        shape: IndicatorShape.circle(size: 8),
                        child: PageView(
                          children: <Widget>[
                            // jika ingin menambahkan foto lebih dari 1

                            Image.asset(
                              model.imagePath,
                              fit: BoxFit.cover,
                            ),
                            Image.asset(
                              model.imagePath,
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                model.imagePath,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
              ),

                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                     // controller: scrollController,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ListTile(
                            title: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  model.title,
                                  style: GoogleFonts.roboto(
                                    color: WajahColors.black,

                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),


                                ),
                                SizedBox(
                                  width: 27,
                                ),


                                Spacer(),
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



                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[


                                  Expanded(
                                    child: Text(
                                      model.description, textAlign: TextAlign.justify,
                                      style: GoogleFonts.roboto(
                                        color: WajahColors.titleTextColor,

                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),

                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          Divider(
                            thickness: .2,
                            color: LightColor.black,
                          ),


                          Container(

                            child: Padding(
                              padding: const EdgeInsets.only(left: 15,right: 10),
                              child: Row(
                                children: <Widget> [
                                  Text(
                                    'Estimate Time',
                                    style:GoogleFonts.roboto(
                                      color: WajahColors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  Spacer(),
                                  Container(

                                    child: Text(model.estimateTime.toString()+' '+'Minutes',
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
                            ),
                          ),
                          Divider(
                            thickness: .2,
                            color: LightColor.black,
                          ),
                          Container(
                            margin: const EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Terms & Conditions',
                                  style:GoogleFonts.roboto(
                                    color: WajahColors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),


                              ],
                            ),
                          ),

                          Container(
                            margin: const EdgeInsets.only(left: 30, right: 10),
                            child: Row(
                              children:<Widget> [

                                Container(
                                  margin: EdgeInsets.only(top: 20),

                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: <Widget> [

                                      Container(

                                        child: Row(
                                          children: [
                                            Icon(
                                              FlutterIcons.numeric_1_circle_mco,
                                              color: WajahColors.WajahTermsnConditions,
                                              size: 20,
                                            ),
                                            Image.asset(
                                              model.tncImage1, // <- stubbed data
                                              fit: BoxFit.cover,
                                            ),
                                          ],
                                        ),

                                      ),
                                      SizedBox(height: 5,),

                                      Text(model.tncDesc1.toString() , style: GoogleFonts.roboto())

                                    ],
                                  ),
                                ),

                               Spacer(),


                                Container(
                                  margin: EdgeInsets.only(top: 20),

                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: <Widget> [

                                      Container(

                                        child: Row(
                                          children: [
                                            Icon(
                                              FlutterIcons.numeric_2_circle_mco,
                                              color: WajahColors.WajahTermsnConditions,
                                              size: 20,
                                            ),
                                            Image.asset(
                                              model.tncImage2, // <- stubbed data
                                              fit: BoxFit.cover,
                                            ),
                                          ],
                                        ),

                                      ),
                                      SizedBox(height: 5,),

                                      Text(model.tncDesc2.toString() , style: GoogleFonts.roboto())

                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            margin: const EdgeInsets.only(top: 10, left: 20,right: 30),
                            child: Row(
                              children:<Widget> [

                                Container(
                                  margin: EdgeInsets.only(top: 20, bottom: 20),

                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: <Widget> [

                                      Container(

                                        child: Row(
                                          children: [
                                            Icon(
                                              FlutterIcons.numeric_3_circle_mco,
                                              color: WajahColors.WajahTermsnConditions,
                                              size: 20,
                                            ),
                                            Image.asset(
                                              model.tncImage3, // <- stubbed data
                                              fit: BoxFit.cover,
                                            ),
                                          ],
                                        ),

                                      ),
                                      SizedBox(height: 5,),

                                      Text(model.tncDesc3.toString() , style: GoogleFonts.roboto())

                                    ],
                                  ),
                                ),
                                Spacer(),


                                Container(
                                  margin: EdgeInsets.only(top: 20, bottom: 20),

                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: <Widget> [

                                      Container(

                                        child: Row(
                                          children: [
                                            Icon(
                                              FlutterIcons.numeric_4_circle_mco,
                                              color: WajahColors.WajahTermsnConditions,
                                              size: 20,
                                            ),
                                            Image.asset(
                                              model.tncImage4, // <- stubbed data
                                              fit: BoxFit.cover,
                                            ),
                                          ],
                                        ),

                                      ),
                                      SizedBox(height: 5,),

                                      Text(model.tncDesc4.toString() , style: GoogleFonts.roboto())

                                    ],
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
                            margin: const EdgeInsets.only(right: 20, left: 20, top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                                Text('Pick a date',
                                  style: GoogleFonts.roboto(
                                    color: WajahColors.black,

                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),),


                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 20, left: 20),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(
                                      color: Colors.black,
                                      width: 1.5,
                                    ),
                                        ),

                                  child: DatePicker(
                                    DateTime.now(),
                                    initialSelectedDate: DateTime.now(),
                                    selectionColor: WajahColors.WajahPrimaryLightColor,
                                    selectedTextColor: WajahColors.WajahPrimary,
                                    onDateChange: (date) {
                                      // New date selected
                                      setState(() {
                                        _selectedDate = date;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Divider(
                            thickness: .2,
                            color: LightColor.black,
                          ),




                          Container(
                            margin: const EdgeInsets.only(right: 20, left: 20),
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
                            padding: const EdgeInsets.only(right: 15, left: 15),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                              Icon(
                                                FlutterIcons.cloud_ant,
                                                color: WajahColors.WajahTermsnConditions,
                                                size: 25,
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                  "09:00",
                                                  style: TextStyle(fontSize: 17)
                                              ),
                                            ],
                                          ),
                                          style: ButtonStyle(
                                              padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(5)),
                                              backgroundColor: _hasBeenPressed1 ?  MaterialStateProperty.all<Color>(WajahColors.WajahPrimary) :  MaterialStateProperty.all<Color>(WajahColors.WajahButtonPrimaryText),
                                              foregroundColor:  _hasBeenPressed1?  MaterialStateProperty.all<Color>(WajahColors.WajahButtonPrimaryText) :  MaterialStateProperty.all<Color>(WajahColors.WajahPrimary),

                                              // shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                              //     RoundedRectangleBorder(
                                              //         borderRadius: BorderRadius.circular(18.0),
                                              //         side: BorderSide(color: WajahColors.WajahPrimary)
                                              //     )
                                              // )
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
                                              Icon(
                                                FlutterIcons.cloud_sun_faw5s,
                                                color: WajahColors.WajahTermsnConditions,
                                                size: 25,
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                  "12:00",
                                                  style: TextStyle(fontSize: 17)
                                              ),
                                            ],
                                          ),
                                          style: ButtonStyle(
                                              padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(5)),
                                              backgroundColor: _hasBeenPressed2 ?  MaterialStateProperty.all<Color>(WajahColors.WajahPrimary) :  MaterialStateProperty.all<Color>(WajahColors.WajahButtonPrimaryText),
                                              foregroundColor:  _hasBeenPressed2?  MaterialStateProperty.all<Color>(WajahColors.WajahButtonPrimaryText) :  MaterialStateProperty.all<Color>(WajahColors.WajahPrimary),
                                              // shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                              //     RoundedRectangleBorder(
                                              //         borderRadius: BorderRadius.circular(18.0),
                                              //         side: BorderSide(color: WajahColors.WajahPrimary)
                                              //     )
                                              // )
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
                                              Icon(
                                                FlutterIcons.weather_sunset_mco,
                                                color: WajahColors.WajahTermsnConditions,
                                                size: 25,
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                  "15:00",
                                                  style: TextStyle(fontSize: 17)
                                              ),
                                            ],
                                          ),
                                          style: ButtonStyle(
                                              padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(5)),
                                              backgroundColor: _hasBeenPressed3 ?  MaterialStateProperty.all<Color>(WajahColors.WajahPrimary) :  MaterialStateProperty.all<Color>(WajahColors.WajahButtonPrimaryText),
                                              foregroundColor:  _hasBeenPressed3?  MaterialStateProperty.all<Color>(WajahColors.WajahButtonPrimaryText) :  MaterialStateProperty.all<Color>(WajahColors.WajahPrimary),

                                              // shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                              //     RoundedRectangleBorder(
                                              //         borderRadius: BorderRadius.circular(18.0),
                                              //         side: BorderSide(color: WajahColors.WajahPrimary)
                                              //     )
                                              // )
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
                            height: 20,
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
                                padding: EdgeInsets.only(left: 20, right: 20),
                                height: 40,
                                width: MediaQuery.of(context).size.width/1,
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
                                    'Book Now',
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

            ],
          ),



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
                    ),
                    expanded: Column(
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
