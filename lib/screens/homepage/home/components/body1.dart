
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:wajah_id/clinic/all_clinic.dart';
import 'package:wajah_id/clinic/clinic_doctor/clinic_doctor_profile.dart';
import 'package:wajah_id/doctor/all_doctor.dart';
import 'package:wajah_id/model/clinic_model/clinicModel.dart';
import 'package:wajah_id/model/product_Model.dart';
import 'package:wajah_id/model/colorPallete.dart';
import 'package:wajah_id/model/doctor_model/doctorData.dart';
import 'package:wajah_id/model/doctor_model/doctorModel.dart';
import 'package:wajah_id/model/view_models/globalVariables_viewModel.dart';
import 'package:wajah_id/screens/doctorsList.dart';
import 'package:wajah_id/screens/homepage/home/components/cliniclistview.dart';
import 'package:wajah_id/screens/homepage/home/components/homeShimmer.dart';
import 'package:wajah_id/screens/homepage/home/components/searchBar.dart';
import 'package:wajah_id/utils/constants.dart';
import 'package:wajah_id/utils/size_config.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../category/categories.dart';

import 'package:provider/provider.dart';

import 'package:carousel_slider/carousel_slider.dart';

class HomeBody extends StatefulWidget {
  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  Future _futureProds;
  Future _futureHomeImages;
  bool _connection;
  List<DoctorModel> doctorDataList;
  List<allClinicCard> clinic ;


  @override
  void initState() {
    _futureProds =
        Provider.of<globalVars>(context, listen: false).getAllProds();
    _futureHomeImages =
        Provider.of<globalVars>(context, listen: false).getHomeImages();
    doctorDataList = doctorMapList.map((x) => DoctorModel.fromJson(x)).toList();

    super.initState();
  }



  Future connection_checker() async {
    _connection = await InternetConnectionChecker().hasConnection;
  }

  @override
  Widget build(BuildContext context) {
    final coverImageHeightCalc = MediaQuery.of(context).size.height / 3 ;

    return SafeArea(
      child: Center(


        child: SingleChildScrollView(

          child: FutureBuilder(
              future: connection_checker(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (_connection == true) {
                    return Consumer<globalVars>(builder: (_, gv, __) {
                      return FutureBuilder(
                          future:
                          Future.wait([_futureProds, _futureHomeImages]),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return Column(

                                children: [
                                  SizedBox(
                                      height: getProportionateScreenHeight(15)),
                                  searchBar(),
                                  SizedBox(
                                      height: getProportionateScreenWidth(5)),
                                  Categories(),


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
                                            padding: EdgeInsets.only(bottom: 10),
                                            indicatorColor: WajahColors.WajahPrimary,
                                            indicatorSelectorColor: Colors.white,
                                            shape: IndicatorShape.circle(size: 8),
                                            child: PageView(
                                              children: <Widget>[
                                                // jika ingin menambahkan foto lebih dari 1

                                                Padding(
                                                  padding: const EdgeInsets.only(left: 16,right: 16),
                                                  child: Image.asset(
                                                    'assets/banner.png',
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 16,right: 16),
                                                  child: Image.asset(
                                                    'assets/banner.png',
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 16,right: 16),
                                                  child: Image.asset(
                                                    'assets/banner.png',
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )),
                                    ),
                                  ),
                                  // CarouselSlider(
                                  //   options: CarouselOptions(
                                  //     viewportFraction: 0.9,
                                  //     autoPlay: true,
                                  //     aspectRatio: 1.7,
                                  //     enlargeCenterPage: true,
                                  //     enlargeStrategy:
                                  //     CenterPageEnlargeStrategy.height,
                                  //   ),
                                  //   items: gv.imgList
                                  //       .map((item) => Container(
                                  //     child: Container(
                                  //       margin: EdgeInsets.all(7.5),
                                  //       child: ClipRRect(
                                  //         borderRadius: BorderRadius
                                  //             .all(Radius.circular(
                                  //             getProportionateScreenWidth(
                                  //                 10))),
                                  //         child: CachedNetworkImage(
                                  //             imageUrl: item,
                                  //             progressIndicatorBuilder:
                                  //                 (context, url,
                                  //                 downloadProgress) =>
                                  //                 SizedBox(
                                  //                   width:
                                  //                   getProportionateScreenWidth(
                                  //                       6),
                                  //                   height:
                                  //                   getProportionateScreenWidth(
                                  //                       6),
                                  //                   child: Center(
                                  //                     child:
                                  //                     CircularProgressIndicator(
                                  //                       value: downloadProgress.progress,
                                  //                       strokeWidth:
                                  //                       5,
                                  //                       color: WajahColors
                                  //                           .WajahPrimary,
                                  //                       backgroundColor:
                                  //                       CardBackgroundColor,
                                  //                     ),
                                  //                   ),
                                  //                 ),
                                  //             errorWidget: (context,
                                  //                 url, error) =>
                                  //                 Icon(Icons.error),
                                  //             fit: BoxFit.cover,
                                  //             placeholderFadeInDuration:
                                  //             Duration.zero,
                                  //             width: double.infinity),
                                  //       ),
                                  //     ),
                                  //   ))
                                  //       .toList(),
                                  // ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    // crossAxisAlignment:
                                    //     CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 8.0, left: 25, right: 16),
                                        child: Text('Nearest Clinic', textAlign: TextAlign.left,
                                          style: GoogleFonts.roboto(color: WajahColors.WajahPrimary,
                                              fontWeight: FontWeight.bold, fontSize: 18),),
                                      ),




                                      TextButton(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "See All",
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                        onPressed: () async {

                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => AllClinicPage()),
                                          );



                                        },
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    //crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      ClinicListView(
                                        callBack: () {
                                          moveTo();
                                        },
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      _doctorsList(),
                                    ],
                                  ),
                                  SizedBox(
                                      height: getProportionateScreenWidth(30)
                                  ),

                                  Container(
                                    padding: EdgeInsets.only(left: 20),
                                    alignment: Alignment.centerLeft,
                                    child: Row(

                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Best Product",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.roboto(
                                                color: WajahColors.WajahPrimary,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Container(
                                    height: 170,
                                    padding: EdgeInsets.only(top: 12,),
                                    child: ListView.builder(
                                      physics: ClampingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                                      itemCount: cards.length,
                                      itemBuilder: (context, index) {
                                        //print("images path: ${cards[index].cardImage.toString()}");
                                        return Container(
                                          margin: EdgeInsets.only(right: 14, bottom: 10),
                                          height: double.infinity,
                                          width: 140,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: Color(cards[index].cardBackground),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: WajahColors.WajahPrimaryLightColor,
                                                  blurRadius: 4.0,
                                                  spreadRadius: 0.0,
                                                  offset: Offset(3, 3),
                                                ),
                                              ]
                                            // image: DecorationImage(
                                            //   image: AssetImage(cards[index].cardImage),
                                            //   fit: BoxFit.fill,
                                            // ),
                                          ),
                                          // ignore: deprecated_member_use
                                          child: FlatButton(
                                            onPressed: () {
                                              // Navigator.push(
                                              //   context,
                                              //   MaterialPageRoute(
                                              //       builder: (context) => ExploreList(
                                              //         type: cards[index].product,
                                              //       )),
                                              // );
                                            },
                                            shape: new RoundedRectangleBorder(
                                                borderRadius: new BorderRadius.circular(20)),
                                            child: SingleChildScrollView(
                                              physics: NeverScrollableScrollPhysics(),
                                              child: Column(

                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Card(
                                                        color:WajahColors.WajahPrimary,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(8.0)),
                                                        child: Padding(
                                                          padding: EdgeInsets.all(4.0),
                                                          child: Text(
                                                            cards[index].product,
                                                            textAlign: TextAlign.left,
                                                            style: TextStyle(

                                                              fontSize: 10.0,
                                                              color: WajahColors.WajahButtonPrimaryText,
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                      height: getProportionateScreenWidth(10)
                                                  ),
                                                  Container(
                                                      child: Image(
                                                        image: AssetImage(cards[index].image),
                                                        //backgroundColor: Colors.white,
                                                        // radius: 9,
                                                        fit: BoxFit.cover,

                                                      )
                                                  ),


                                                  SizedBox(
                                                    height: getProportionateScreenWidth(30),
                                                  ),


                                                  Container(
                                                    alignment: Alignment.bottomCenter,
                                                    child: Text(
                                                      cards[index].product,
                                                      style: GoogleFonts.lato(
                                                          color: WajahColors.WajahPrimary,
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.w600),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),

                                ],


                              );


                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) return homeShimmer();
                            return Container();
                          });
                    });
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.warning_amber_rounded,
                                color: SecondaryColor,
                                size: 23,
                              ),
                              Text(
                                '   No Internet Connection',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: SecondaryColor,
                                    fontFamily: 'PantonBoldItalic'),
                              ),
                            ]),
                        SizedBox(
                          height: 10,
                        ),
                        IconButton(
                          onPressed: () => setState(() {}),
                          icon: Icon(
                            Icons.replay_circle_filled,
                            color: WajahColors.WajahPrimary,
                          ),
                          iconSize: 53,
                        )
                      ],
                    );
                  }
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return homeShimmer();
                }
                return Container();
              }

          ),
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

  Widget _doctorsList() {
    return Column(

      children: <Widget>
      [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(
                    top: 8.0, left: 25, right: 16),
                child: Text("Top Doctors", style: GoogleFonts.roboto(
                    color: WajahColors.WajahPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
                )
            ),
            TextButton(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "See All",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              onPressed: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AllDoctorPage(),

                    ));
              },
            )
            // .p(12).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(20))),
          ],
        ),
        getdoctorWidgetList()
      ],

    );
  }


  Widget getdoctorWidgetList() {
    return Column(
        children: doctorDataList.map((x) {
          return _doctorTile(x);
        }).toList());
  }

  Widget _doctorTile(ClinicDoctor model) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(4, 4),
            blurRadius: 10,
            color: WajahColors.WajahPrimaryLightColor.withOpacity(.2),
          ),
          BoxShadow(
            offset: Offset(-3, 0),
            blurRadius: 15,
            color: WajahColors.WajahPrimaryLightColor.withOpacity(.1),
          )
        ],
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        child: ListTile(
          contentPadding: EdgeInsets.all(0),
          leading: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(13)),
            child: Container(
              height: 85,
              width: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: WajahColors.WajahPrimaryLightColor,
              ),
              child: Image.asset(
                model.image,
                height: 200,
                width: 200,
                fit: BoxFit.fill,
              ),
            ),
          ),
          title: Text(model.name, style: GoogleFonts.roboto(
              color: WajahColors.WajahPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 13),),

          subtitle: Container(
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    for (var i = 0; i < model.rating; i++)
                      Icon(
                        Icons.star_rounded,
                        color: WajahColors.WajahRating,
                        size: 15,
                      ),
                    if (5 - model.rating > 0)
                      for (var i = 0; i < 5 - model.rating; i++)
                        Icon(
                          Icons.star_rounded,
                          color: Colors.black12,
                          size: 15,
                        ),


                  ],

                ),
                SizedBox(),

                Row(
                  children: [
                    Icon(
                      FlutterIcons.md_briefcase_ion,
                      color: Colors.black12,
                      size: 17,
                    ),
                    Text(model.experience.toString() +'  '+ 'Years', style: GoogleFonts.roboto()),
                  ],
                ),
              ],
            ),
          ),
          trailing: Icon(
            FlutterIcons.heart_circle_mco,
            size: 30,
            color: WajahColors.WajahPrimary,
          ),
          onTap: () {
            // Navigator.pushNamed(context, "/DetailPage", arguments: model);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailClinicDoctorScreen(model: model,),
              ),
            );
          },
        ),


        //borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    );
  }
}