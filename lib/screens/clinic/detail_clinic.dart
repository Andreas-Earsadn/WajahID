import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:rect_getter/rect_getter.dart';
import 'package:wajah_id/clinic/clinic_product/product_list_view.dart';
import 'package:wajah_id/clinic/clinic_treatment/treatment_list_view.dart';
import 'package:wajah_id/clinic/fade_routes.dart';

import 'package:wajah_id/model/clinic_model/clinicModel.dart';
import 'package:wajah_id/model/colorPallete.dart';
import 'package:wajah_id/model/doctor_model/doctortheme/doctorTheme.dart';
import 'package:wajah_id/screens/homepage/home/home_screen.dart';
import 'package:wajah_id/widget/blur_icon.dart';

import 'clinic_doctor/doctor_list_view.dart';
import 'clinic_reviewer/reviewer_list_view.dart';
import 'clinic_reviewer/reviewer_slider.dart';
import 'clinic_sliding_view.dart';


class DetailClinicScreen extends StatefulWidget {
  final String heroTag;
  final String imageAsset;
  final Clinic clinic;
  // final ClinicDoctor clinicDoctor;

  DetailClinicScreen({
    this.heroTag,
    this.imageAsset,
    this.clinic,
  });

  @override
  _DetailClinicScreenState createState() =>
      _DetailClinicScreenState(heroTag: heroTag, imageAsset: imageAsset, clinic: clinic);
}

class _DetailClinicScreenState extends State<DetailClinicScreen> with SingleTickerProviderStateMixin {
  final String heroTag;
  final String imageAsset;
  final double bottomSheetCornerRadius = 50;
  final Clinic clinic;
  final ClinicReviewer reviewer;
  final Duration animationDuration = Duration(milliseconds: 600);
  final Duration delay = Duration(milliseconds: 300);
  GlobalKey rectGetterKey = RectGetter.createGlobalKey();
  Rect rect;
  GlobalKey<PageSliderState> _slider = GlobalKey();

  _DetailClinicScreenState({
    this.heroTag,
    this.imageAsset,
    this.clinic,
    this.reviewer
  });

  static double bookButtonBottomOffset = -60;
  double bookButtonBottom = bookButtonBottomOffset;
  AnimationController _bottomSheetController;

  void _onTap() {
    setState(() => rect = RectGetter.getRectFromKey(rectGetterKey));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() =>
      rect = rect.inflate(1.3 * MediaQuery.of(context).size.longestSide));
      Future.delayed(animationDuration + delay, _goToNextPage);
    });
  }

  void _goToNextPage() {
    Navigator.of(context)
        .push(FadeRouteBuilder(page: HomeScreen()))
        .then((_) => setState(() => rect = null));
  }

  @override
  void initState() {
    super.initState();
    _bottomSheetController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    Future.delayed(Duration(milliseconds: 700)).then((v) {
      setState(() {
        bookButtonBottom = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //final themeData = HotelConceptThemeProvider.get();
    final coverImageHeightCalc =
        MediaQuery.of(context).size.height / 2.8;
    return WillPopScope(
      onWillPop: () async {
        if (_bottomSheetController.value <= 0.5) {
          setState(() {
            bookButtonBottom = bookButtonBottomOffset;
          });
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: <Widget>[Container(

            decoration: BoxDecoration(),
            //margin: EdgeInsets.only(right: 15, top: 15),

          ),
          ],
          backgroundColor: Colors.white,
          elevation: 0,
          title: Column(
            children: <Widget> [
              Container(
                margin: EdgeInsets.only(left: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    BackButton(),

                    // SizedBox(
                    //   width: 20,
                    // ),
                    Container(
                      margin: EdgeInsets.only(left: 100, right: 100),
                      //width: MediaQuery.of(context).size.width/1.3,
                      alignment: Alignment.center,
                      child: Text(
                        'Clinic',
                        style: GoogleFonts.roboto(
                          color: WajahColors.WajahPrimary,
                          fontSize: 23,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   width: 110,
                    // ),

                  ],
                ),
              ),
            ],
          ),
          iconTheme: IconThemeData(
            color: WajahColors.WajahPrimary,
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(

            bottom: true,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
                            padding: EdgeInsets.only(bottom: 15),
                            indicatorColor: WajahColors.WajahPrimary,
                            indicatorSelectorColor: Colors.white,
                            shape: IndicatorShape.circle(size: 8),
                            child: PageView(
                              children: <Widget>[
                                //jika ingin menambahkan foto lebih dari 1

                                Image.asset(
                                  clinic.imagePath,
                                  fit: BoxFit.cover,
                                ),
                                Image.asset(
                                  clinic.imagePath, // <- stubbed data
                                  fit: BoxFit.cover,
                                ),
                                Image.asset(
                                  clinic.imagePath, // <- stubbed data
                                  fit: BoxFit.cover,
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
                              Container(

                                child: ListTile(
                                  title: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        clinic.title,
                                        style: GoogleFonts.roboto(
                                          color: WajahColors.black,

                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),


                                      ),



                                      Spacer(),


                                    ],
                                  ),



                                  subtitle: Row(

                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        FlutterIcons.location_pin_ent,
                                        color: WajahColors.WajahPrimary,
                                        size: 22,
                                      ),
                                      SizedBox(width: 8,),
                                      Text(
                                        clinic.location,
                                        style: GoogleFonts.roboto(
                                          color: WajahColors.titleTextColor,

                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                        ),

                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                 SizedBox(width: 14,),
                                  Icon(
                                    FlutterIcons.phone_ant,
                                    color: WajahColors.WajahPrimary,
                                    size: 18,
                                  ),
                                  SizedBox(width: 14,),
                                  Text(
                                    clinic.phone,
                                    style: GoogleFonts.roboto(
                                      color: WajahColors.titleTextColor,

                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),

                                  ),
                                ],
                              ),

                              Container(
                                margin: EdgeInsets.only(top: 5),

                                child: Column(
                                  children: <Widget>[

                                    Row(
                                      children:<Widget> [
                                        SizedBox(width: 14,),
                                        Text(
                                            clinic.rating.toString(),
                                            style: GoogleFonts.roboto(
                                              color: WajahColors.titleTextColor,

                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        ),
                                        SizedBox(width: 12,),

                                        for (var i = 0; i < clinic.rating -1; i++)
                                          Icon(
                                            Icons.star_rounded,
                                            color: WajahColors.WajahRating,
                                            size: 15,
                                          ),
                                        if (5 - clinic.rating > 0)
                                          for (var i = 0; i < 5 - clinic.rating; i++)
                                            Icon(
                                              Icons.star_rounded,
                                              color: Colors.black12,
                                              size: 15,
                                            ),


                                      ],

                                    ),
                                    SizedBox(),


                                  ],
                                ),
                              ),
                              Divider(
                                thickness: .2,
                                color: WajahColors.grey,
                              ),


                              Container(
                                margin: const EdgeInsets.all(10),
                                child: Text(
                                 'Location',
                                  style: GoogleFonts.roboto(
                                    color: WajahColors.black,

                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                  child: Card(
                                    child: Image.asset(
                                      clinic.imgLocation, // <- stubbed data
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Divider(
                                thickness: .2,
                                color: WajahColors.grey,
                              ),

                              Container(
                                margin: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [

                                    Text('Treatment', style: GoogleFonts.roboto(
                                      color: WajahColors.black,

                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    ),



                                  ],

                                ),

                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                //crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const SizedBox(
                                    height: 0,
                                  ),
                                  TreatmentListView(
                                    callBack: () {
                                      moveTo();
                                    },
                                  ),

                                ],
                              ),


                              Divider(
                                thickness: .2,
                                color: WajahColors.grey,
                              ),



                              Container(
                                margin: const EdgeInsets.only(top:10,right: 10, left: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [

                                    Text('Doctor',
                                        style: GoogleFonts.roboto(
                                          color: WajahColors.black,

                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),),


                                  ],
                                ),
                              ),
                              //SizedBox(height: 20),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                //crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[

                                  DoctorListView(
                                    callBack: () {
                                      moveTo();
                                    },
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),


                                ],
                              ),
                              Divider(
                                thickness: .2,
                                color: WajahColors.grey,
                              ),



                              Container(
                                margin: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [

                                    Text('Skin Product Clinic',
                                      style: GoogleFonts.roboto(
                                        color: WajahColors.black,

                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),),


                                  ],
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                //crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[

                                  ClinicProductListView(
                                    callBack: () {
                                      moveTo();
                                    },
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),


                                ],
                              ),
                              Divider(
                                thickness: .2,
                                color: WajahColors.grey,
                              ),
                              SizedBox(height: 20),

                              Container(
                                margin: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [

                                    Text('Clinic Review',
                                      style: GoogleFonts.roboto(
                                        color: WajahColors.black,

                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),


                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                //crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[


                                  PageSlider(
                                    key: _slider,
                                    duration: Duration(milliseconds: 400),
                                    pages: <Widget>[
                                      _card('Pevita Pearce','assets/clinicreviewer.png',"Saya memastikan bahwa klinik ini aman dan terpercaya. Layanan yang diberikan sungguh memuaskan"),
                                      _card('Putri','assets/clinicreviewer.png',"Produk yang ditawarkan sangat lengkap. Terimakasih :)"),
                                      _card('Alfina','assets/clinicreviewer.png',"Ga nyesel datang kesini. Makasih"),
                                      _card('Alya','assets/clinicreviewer.png',"Pelayanan yang sangat ramah"),

                      ],
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),


                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[

                                      Container(
                                        child: FloatingActionButton(
                                          backgroundColor: WajahColors.WajahButtonPrimaryText,
                                          foregroundColor: WajahColors.black,


                                          child: Icon(Icons.arrow_back_ios),
                                          onPressed: () => _slider.currentState.previous(),
                                        ),
                                      ),


                                      Container(
                                        child: FloatingActionButton(
                                          backgroundColor: WajahColors.WajahButtonPrimaryText,
                                          foregroundColor: WajahColors.black,
                                          child: Icon(Icons.arrow_forward_ios),
                                          onPressed: () => _slider.currentState.next(),
                                        ),
                                      ),
                                    ],
                                  ),
                                  MaterialButton(
                                    // jump to zero-indexed page number
                                    onPressed: () => _slider.currentState.setPage(3),
                                    child: Text('Go to last reviewer'),
                                  ),


                                ],
                              ),
                              Divider(
                                thickness: .2,
                                color: WajahColors.grey,
                              ),
                              SizedBox(height: 20),




                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[


                                 // Card1(),


                                ],
                              ),






                            ],
                          ),
                        ),



                 // _appbar(),

                ],
              ),
            ),


          ),
        ),

      ),
    );
  }

  Widget _card( String name, String image, String comment) =>
      Card(
        margin: EdgeInsets.only(left: 20, right: 20),
        color: WajahColors.WajahPrimaryLightColor,
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.only(left: 10, ),
          child: Column(

            children: <Widget> [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget> [
              Icon(FlutterIcons.quote_left_faw5s, size: 40,color: WajahColors.WajahPrimary,),

                ],
              ),


                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget> [

                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        child: CircleAvatar(
                          backgroundColor: WajahColors.WajahPrimaryLightColor,
                          radius: 50,
                          backgroundImage: AssetImage(image),
                        ),
                      ),

                    ],
                ),
                 ),

              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text(name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    )
                ),
              ),
              Container(
                margin: EdgeInsets.only(left:20,bottom: 30, right: 20),

                child: Text(comment,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    )
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget> [
                  Icon(FlutterIcons.quote_right_faw5s,size: 40,color: WajahColors.WajahPrimary,),

                ],
              ),
            ],
          ),
        ),
      );

  Widget _ripple(ThemeData themeData) {
    if (rect == null) {
      return Container();
    }
    return AnimatedPositioned(
      duration: animationDuration,
      left: rect.left,
      right: MediaQuery.of(context).size.width - rect.right,
      top: rect.top,
      bottom: MediaQuery.of(context).size.height - rect.bottom,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: themeData.accentColor,
        ),
      ),
    );
  }

  void moveTo() {
    //
    // Navigator.push<dynamic>(
    //   context,
    //   MaterialPageRoute<dynamic>(
    //     builder: (BuildContext context) => CourseInfoScreen(),
    //   ),
    // );
  }
}


