import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wajah_id/doctor_search.dart';
import 'package:wajah_id/firestore-data/searchList.dart';

import 'package:wajah_id/model/colorPallete.dart';
import 'package:wajah_id/model/doctor_model/doctorData.dart';
import 'package:wajah_id/model/doctor_model/doctorModel.dart';

import '../doctor_search_screen.dart';
import 'homepage/home/components/searchBar.dart';

class DoctorsList extends StatefulWidget {
  @override
  _DoctorsListState createState() => _DoctorsListState();
}

class _DoctorsListState extends State<DoctorsList> {
  TextEditingController _textController = new TextEditingController();
  String search;
  var _length = 0;
  List<DoctorModel> doctorDataList;

  @override
  void initState() {
    search = _textController.text;
    _length = search.length;
    doctorDataList = doctorMapList.map((x) => DoctorModel.fromJson(x)).toList();
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(

        child: Center(
          child: SingleChildScrollView(

            child: Column(

                children: [
                // SizedBox(child: doctorSearchBar()),
                  Column(
                    children: [
                     // doctorSearchBar(),

                      Container(



                        padding: EdgeInsets.all(10),

                        child: _length == 0
                            ? Center(

                          child: Container(
                            child: Column(

                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      SizedBox(child: searchBar());

                                      getdoctorWidgetList();
                                      _length = 3;
                                    });
                                  },
                                  child: Text(
                                    'Tampilkan Semua Dokter Kami',
                                    style: GoogleFonts.lato(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Image(image: AssetImage('assets/search-bg.png')),
                              ],
                            ),
                          ),
                        )
                            : getdoctorWidgetList()
                        ,


                        // SearchList(
                        //   searchKey: search,
                        // ),
                      ),
                    ],
                  ),
                ],
              ),

          ),
        ),
      ),
    );
  }


  Widget getdoctorWidgetList() {


    return Column(

        children: doctorDataList.map((x) {
          return _doctorTile(x);
        }).toList());

  }

  Widget _doctorTile(DoctorModel model) {
    return SafeArea(

      child: Container(

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
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: WajahColors.WajahPrimaryLightColor,
                ),
                child: Image.asset(
                  model.image,
                  height: 80,
                  width: 80,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            title: Text(model.name, style: GoogleFonts.roboto()),

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
                      Text(model.experience.toString() + '  ' + 'Years',
                          style: GoogleFonts.roboto()),
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
          ),

          //borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    );
  }
}