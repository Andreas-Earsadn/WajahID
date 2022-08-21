
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:wajah_id/model/clinic_model/clinicData.dart';
import 'package:wajah_id/model/clinic_model/clinicModel.dart';
import 'package:wajah_id/model/colorPallete.dart';
import 'package:wajah_id/model/doctor_model/doctortheme/doctorTheme.dart';
import 'package:wajah_id/model/doctor_model/doctortheme/doctor_extention.dart';
import 'package:wajah_id/model/doctor_model/doctortheme/doctortext.dart';
import 'package:wajah_id/model/doctor_model/doctortheme/light_color.dart';

import 'package:wajah_id/model/view_models/globalVariables_viewModel.dart';






class  ProductDetailScreen extends StatefulWidget {
  final ClinicProduct model;
  final Clinic clinicTitle;
  ProductDetailScreen({
    Key key,
    this.model,
    this.clinicTitle,
  }) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State< ProductDetailScreen> {
  ClinicProduct model;
  Clinic clinicTitle;
  List<ClinicReviewer> reviewerList;


  final formatCurrency =  NumberFormat.simpleCurrency(locale: 'id_ID');
  @override
  void initState() {
    model = widget.model;
    reviewerList = reviewerMapList.map((x) => ClinicReviewer.fromJson(x)).toList();
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
              margin: EdgeInsets.only(left: 0, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BackButton(),

                  Container(
                    margin: EdgeInsets.only(left: 80, right: 60),
                    // width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: Text(
                      'Skin Product',
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
                              model.image,
                              fit: BoxFit.cover,
                            ),
                            Image.asset(
                              model.image,
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                model.image,
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Card(
                        color: WajahColors.WajahPrimaryLightColor,
                        child: ListTile(
                          title: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                model.productOwner,
                                style: GoogleFonts.roboto(
                                  color: WajahColors.black,

                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),




                              ),
                          Text(
                            '  |  '
                            ),
                              SizedBox(
                                width: 7,
                              ),

                              Text(
                                model.name,
                                style: GoogleFonts.roboto(
                                  color: WajahColors.grey,

                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                ),

                              ),


                              Spacer(),
                              Text(
                                model.volume,
                                style: GoogleFonts.roboto(
                                  color: WajahColors.grey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                ),

                              ),


                            ],
                          ),



                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[

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
                          ),
                        ),
                      ),

                      SizedBox(height: 10,),



                      Container(
                        //margin: const EdgeInsets.all(1),
                        child:  ExpandableNotifier(
                          child: Padding(
                            padding: const EdgeInsets.all(0),
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
                                          padding: EdgeInsets.only(left: 15),
                                          child: Text(
                                            "Description Product",
                                            style: GoogleFonts.roboto(
                                              color: WajahColors.WajahPrimary,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )),

                                      collapsed: Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          model.description,
                                          softWrap: true,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      expanded: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[

                                            Padding(
                                                padding: EdgeInsets.only(bottom: 10),
                                                child: Text(
                                                  model.description,
                                                  softWrap: true,
                                                  overflow: TextOverflow.fade,
                                                  textAlign: TextAlign.justify,
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
                          ),
                        ),
                      ),

                      SizedBox(height: 10,),


                      Container(

                      ),

                      // Divider(
                      //   thickness: .2,
                      //   color: LightColor.black,
                      // ),

                      Container(
                        margin: const EdgeInsets.only(right: 20, left: 20, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            Text('Rating & Review',
                              style: GoogleFonts.roboto(
                                color: WajahColors.black,

                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),),


                          ],
                        ),
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                           padding: const EdgeInsets.all(5),
                            child:
                              Container(
                                margin: EdgeInsets.only(top: 5),

                                child: Column(
                                  children: <Widget>[

                                    Padding(
                                      padding: const EdgeInsets.only(left: 15, right: 10),
                                      child: Row(
                                        children:<Widget> [



                                          for (var i = 0; i < model.rating -1; i++)
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

                                          Text(
                                            '('+ model.rating.toString()+'/5' + ')',
                                            style: GoogleFonts.roboto(
                                              color: WajahColors.grey,

                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),

                                          Spacer(),
                                          Text(
                                            model.reviewer.toString()+' '+'Review',
                                            style: GoogleFonts.roboto(
                                              color: WajahColors.black,

                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),



                                        ],

                                      ),
                                    ),
                                    SizedBox(),

                                    _reviewerList(),


                                  ],
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



                          ],
                        ),
                      ),
                      SizedBox(height: 20),

                      SizedBox(
                        height: 20,
                      ),




                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: Container(
                              padding: EdgeInsets.only(left: 15, right: 15),
                              height: 40,
                              width: MediaQuery.of(context).size.width/1.05,
                              //width: 100,
                              child: ElevatedButton(


                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(5)),
                                    backgroundColor:MaterialStateProperty.all<Color>(WajahColors.WajahHoverPrimary),
                                    foregroundColor:  MaterialStateProperty.all<Color>(WajahColors.WajahPrimaryLightColor) ,
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),

                                        )
                                    )

                                ),
                                onPressed:(){

                                },
                                child: Text(
                                  'Buy Now',
                                  style: GoogleFonts.roboto(
                                    color: WajahColors.WajahButtonPrimaryText,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
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
  Widget _reviewerList() {
    return Column(

      children: <Widget>
      [

        getReviewerList()
      ],

    );
  }


  Widget getReviewerList() {
    return Column(
        children: reviewerList.map((x) {
          return _reviewerTile(x);
        }).toList());
  }

  Widget _reviewerTile(ClinicReviewer model) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: WajahColors.WajahPrimaryLightColor,
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
                model.imagePath,
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

                    Expanded(child: Text(model.comment,textAlign: TextAlign.start, style: GoogleFonts.roboto())),
                  ],
                ),
              ],
            ),
          ),
          trailing: Icon(
            FlutterIcons.like_evi,
            size: 30,
            color: WajahColors.WajahPrimary,
          ),
          onTap: () {
            // // Navigator.pushNamed(context, "/DetailPage", arguments: model);
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => DetailScreen(model: model),
            //   ),
            // );
          },
        ),


        //borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    );
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
