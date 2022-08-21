
import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:wajah_id/all_clinic_listview.dart';
import 'package:wajah_id/model/colorPallete.dart';
import 'package:wajah_id/model/filter_model/city_model.dart';
import 'package:wajah_id/model/filter_model/province_model.dart';




class AllClinicPage extends StatefulWidget {
  const AllClinicPage({ Key key }) : super(key: key);

  @override
  _AllClinicState createState() => _AllClinicState();
}

class _AllClinicState extends State<AllClinicPage>  with TickerProviderStateMixin{
  PageController _pageController;
  int _selectedPage = 0;
// PageController _pageController;

  ScrollController _scrollController;
  bool _isScrolled = false;
  AnimationController animationController;
  String dropdownValue;
  var dropdownProvinceValue;
  var dropdownCityValue;

  List<dynamic> productList = [];
  List<int> rating = [1,2,3,4,5];

  List<String> clinicFilter = [
    "All",
    "Location",
    "Rating",
    "Treatment"

  ];



  int _selectedSize = 1;

  int _selectedClinicFilter = 0;


  var selectedRange = RangeValues(150.00, 1500.00);




  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
      //_pageController.jumpToPage(index);
    });
  }
  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    //_pageController = PageController(initialPage: 0);
    _scrollController = ScrollController();
    animationController = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);



    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
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
                    margin: EdgeInsets.only(left: 80, right: 80),
                    // width: MediaQuery.of(context).size.width,
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

      // body: SafeArea(
      //   child: Column(
      //     children:<Widget> [
      //
      //
      //
      //
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Container(
      //           child: AllDoctorListView(
      //             callBack: (){
      //
      //             },
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      body:  SingleChildScrollView(
        physics: BouncingScrollPhysics(),


        child: SafeArea(
          bottom: true,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 16),
            child: Column(
              children: <Widget> [
                Container(
                  child: Column(
                    children: <Widget>[

                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Row(
                            children: <Widget>[

                              Icon(
                                FlutterIcons.location_pin_ent, color: WajahColors.WajahPrimary,

                              ),

                              Container(
                                //teks berasal dari geolocation user ( gps permission to access)
                                  child:Text(
                                      'South Jakarta'
                                  )
                              )

                            ]

                        ),
                      ),

                      Row(
                        children: <Widget> [
                          Expanded(
                            child: Container(
                                  child: TextField(
                                    readOnly: false,
                                    cursorColor: WajahColors.WajahButtonPrimaryText,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      filled: true,
                                      fillColor: WajahColors.WajahPrimaryLightColor,
                                      prefixIcon: Icon(Icons.search,
                                          color: WajahColors.WajahButtonPrimaryText),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide.none),
                                      hintText: "Search Clinic",
                                      hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: WajahColors.WajahButtonPrimaryText),
                                    ),
                                  ),
                                ),
                          ),

                          SizedBox(width: 10),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: WajahColors.WajahPrimary,
                                borderRadius: BorderRadius.circular(10)),
                            child: IconButton(
                              onPressed: () {
                                showFilterModal(context);
                              },
                              icon: Icon(
                                FlutterIcons.sliders_faw,
                                color: WajahColors.WajahButtonPrimaryText,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),


                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 5),


                          child: Container(
                            height: 30,
                            width: double.maxFinite,

                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,

                              scrollDirection: Axis.horizontal,
                              itemCount: clinicFilter.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedClinicFilter = index;
                                    });
                                  },
                                  child: Container(

                                    margin: EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey, width: 2),
                                        borderRadius: BorderRadius.circular(10),
                                        color: _selectedClinicFilter == index ? WajahColors.WajahPrimary : WajahColors.WajahButtonPrimaryText,
                                        shape: BoxShape.rectangle),

                                    height: 20,

                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10, right: 10),
                                          child: Text(
                                            clinicFilter[index],
                                            style: TextStyle(
                                                color: _selectedClinicFilter == index ? Colors.white : WajahColors.black,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),

                      ),

                      SizedBox(height: 10),


                      Container(

                        child: Column(
                          children: [
                            SingleChildScrollView(
                              child: AllClinicListView(
                                callBack: () {

                                },
                              ),
                            ),

                          ],
                        ),

                      ),






                    ],
                  ),


                ),

              ],
            ),
          ),
        ),
      ),


    );
  }

  showFilterModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      builder: (context) {
        return SingleChildScrollView(
          child: StatefulBuilder(builder: (context, setState) {
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                padding: EdgeInsets.only(top: 20, left: 20, right: 10),
                height: MediaQuery.of(context).size.height/1.3,
                child: Column(

                  // mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          color: WajahColors.WajahPrimary,
                          hoverColor: WajahColors.WajahPrimaryLightColor,
                          splashColor: WajahColors.WajahDisabledButton,
                          iconSize: 30,
                          icon: Icon(FlutterIcons.close_box_mco),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Text('Filter Clinic',
                          style:  GoogleFonts.roboto(
                              color: WajahColors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        MaterialButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          minWidth: 80,
                          height: 30,
                          color: Colors.grey.shade300,
                          elevation: 0,
                          padding: EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                              'Reset'
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Location',
                      style:  GoogleFonts.roboto(
                          color: WajahColors.black,

                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Province :',
                          style:  GoogleFonts.roboto(
                              color: WajahColors.black,

                              fontWeight: FontWeight.normal,
                              fontSize: 16),
                        ),
                        SizedBox(width: 130,),
                        Text('City :',
                          style:  GoogleFonts.roboto(
                              color: WajahColors.black,

                              fontWeight: FontWeight.normal,
                              fontSize: 16),
                        ),
                      ],
                    ),

                    //Dropdown kota dan provinsi dengan memanfaatkan API raja ongkir
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget> [
                        Container(
                          width: 150,
                          height: 30,


                          child:DropdownSearch<Province>(
                            // maxHeight: 10,
                            // dialogMaxWidth: 10,


                            // popupBarrierColor:kPrimaryColor,
                            dropdownSearchBaseStyle:   GoogleFonts.roboto(
                                color: WajahColors.WajahPrimary,
                                fontWeight: FontWeight.normal,
                                fontSize: 12),

                            // showSelectedItems: true,


                            showClearButton: true,
                            onFind: (String filter) async {

                              Uri url = Uri.parse(
                                  "https://api.rajaongkir.com/starter/province");
                              // Uri urlc = Uri.parse("https://api.rajaongkir.com/starter/city");

                              try {
                                final response = await http.get(
                                  url,
                                  headers: {
                                    "key": "6cfef77420547f9bf2f093096cbe160d",
                                  },
                                );

                                var data = json.decode(response.body)
                                as Map<String, dynamic>;

                                var statusCode =
                                data["rajaongkir"]["status"]["code"];

                                if (statusCode != 200) {
                                  throw data["rajaongkir"]["status"]
                                  ["description"];
                                }

                                var listAllProvince = data["rajaongkir"]
                                ["results"] as List<dynamic>;

                                var models = Province.fromJsonList(listAllProvince);
                                return models;
                              } catch (err) {
                                print(err);
                                return List<Province>.empty();
                              }
                            },
                            selectedItem: dropdownProvinceValue,
                            onChanged: (prov) {
                              if (prov != null) {
                                print(prov.province);
                                dropdownProvinceValue = prov.province.toString();

                              } else {
                                print("Tidak memilih provinsi manapun");
                              }
                            },
                            showSearchBox: true,

                            dropdownSearchDecoration: InputDecoration(
                                labelText: "Provinsi",
                                hintText: "Pilih Provinsi Anda",
                                border:  OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 10,
                                )),
                            popupItemBuilder:
                                (context, item, isSelected) {
                              return Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: WajahColors.WajahPrimary

                                    ),
                                  ),
                                ),
                                child: Text("${item.province}", ),
                              );
                            },
                            itemAsString: (item) => item.province,
                          ),
                        ),
                        SizedBox(width: 50,),

                        Container(
                          width: 150,
                          height: 30,

                          child: DropdownSearch<City>(

                            dropdownSearchBaseStyle:   GoogleFonts.roboto(
                                color: WajahColors.WajahPrimary,
                                fontWeight: FontWeight.normal,
                                fontSize: 12),

                            showClearButton: true,

                            // ignore: deprecated_member_use
                            // hint: 'Kota',

                            onFind: (String filter) async {
                              Uri url = Uri.parse(
                                  "https://api.rajaongkir.com/starter/city");
                              // Uri urlc = Uri.parse("https://api.rajaongkir.com/starter/city");

                              try {
                                final response = await http.get(
                                  url,
                                  headers: {
                                    "key": "6cfef77420547f9bf2f093096cbe160d",
                                  },
                                );

                                var data = json.decode(response.body)
                                as Map<String, dynamic>;

                                var statusCode =
                                data["rajaongkir"]["status"]["code"];

                                if (statusCode != 200) {
                                  throw data["rajaongkir"]["status"]
                                  ["description"];
                                }

                                var listAllCity = data["rajaongkir"]
                                ["results"] as List<dynamic>;

                                var models =
                                City.fromJsonList(listAllCity);
                                return models;
                              } catch (err) {
                                print(err);
                                return List<City>.empty();
                              }
                            },
                            selectedItem: dropdownCityValue,

                            onChanged: (city) {
                              if (city != null) {
                                print(city.cityName);
                                dropdownCityValue = city.cityName;

                              } else {
                                print("Tidak memilih kota manapun");
                              }
                            },


                            showSearchBox: true,
                            dropdownSearchDecoration: InputDecoration(
                                labelText: "Kota",
                                hintText: "Pilih Kota Anda",

                                border:  OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 10,
                                )),
                            popupItemBuilder:
                                (context, item, isSelected) {
                              return Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: Color(0xFF792727)

                                    ),
                                  ),
                                ),
                                child: Text("${item.cityName}"),
                              );
                            },
                            itemAsString: (item) => item.cityName,
                          ),
                        ),

                      ],
                    ),


                    // Container(
                    //   height: 60,
                    //   child: ListView.builder(
                    //     scrollDirection: Axis.horizontal,
                    //     itemCount: colors.length,
                    //     itemBuilder: (context, index) {
                    //       return GestureDetector(
                    //         onTap: () {
                    //           setState(() {
                    //             _selectedColor = index;
                    //           });
                    //         },
                    //         child: AnimatedContainer(
                    //           duration: Duration(milliseconds: 300),
                    //           margin: EdgeInsets.only(right: 10),
                    //           decoration: BoxDecoration(
                    //               color: _selectedColor == index
                    //                   ? colors[index]
                    //                   : colors[index].withOpacity(0.5),
                    //               shape: BoxShape.circle),
                    //           width: 40,
                    //           height: 40,
                    //           child: Center(
                    //             child: _selectedColor == index ? Icon(Icons.check, color: Colors.white,
                    //             )
                    //                 : Container(),
                    //           ),
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Rating',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),

                    Container(
                      height: 30,

                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: rating.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedClinicFilter = index;
                                });
                              },

                                child: Container(

                                  margin: EdgeInsets.only(right: 50),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: WajahColors.WajahPrimary, width: 2),
                                      borderRadius: BorderRadius.circular(0),
                                      color: _selectedClinicFilter == index ? WajahColors.WajahPrimary : WajahColors.WajahButtonPrimaryText,
                                      shape: BoxShape.rectangle),
                                  width: 30,
                                  height: 10,
                                  child: Center(
                                    child: Row(
                                      children:<Widget> [
                                        Icon(FlutterIcons.star_ant, color: WajahColors.WajahRating, size: 15,),
                                        Text(rating[index].toString(), style: TextStyle(
                                            color: _selectedClinicFilter == index ? WajahColors.WajahButtonPrimaryText : WajahColors.black,
                                            fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                            );
                          },
                        ),

                    ),

                    // Slider Price Renge filter
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Price Range',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '\$ ${selectedRange.start.toStringAsFixed(2)}',
                              style: TextStyle(
                                  color: Colors.grey.shade500, fontSize: 12),
                            ),
                            Text(" - ",
                                style: TextStyle(color: Colors.grey.shade500)),
                            Text(
                              '\$ ${selectedRange.end.toStringAsFixed(2)}',
                              style: TextStyle(
                                  color: Colors.grey.shade500, fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: WajahColors.WajahPrimary, width: 2),
                          borderRadius: BorderRadius.circular(10),
                          color:  WajahColors.WajahPrimaryLightColor,
                          shape: BoxShape.rectangle),

                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: WajahColors.WajahPrimary, width: 2),
                                  borderRadius: BorderRadius.circular(0),
                                  color:  WajahColors.WajahButtonPrimaryText,
                                  shape: BoxShape.rectangle),
                              width: 60,
                              height: 30,
                              child: Center(
                                child: Text('MIN', style: TextStyle(
                                    color: WajahColors.black,
                                    fontSize: 15),


                                ),
                              ),
                            ),
                            RangeSlider(
                                values: selectedRange,
                                min: 0.00,
                                max: 2000.00,
                                divisions: 100,
                                inactiveColor: Colors.grey.shade300,
                                activeColor: WajahColors.WajahPrimary,
                                labels: RangeLabels(
                                  '\$ ${selectedRange.start.toStringAsFixed(2)}',
                                  '\$ ${selectedRange.end.toStringAsFixed(2)}',
                                ),
                                onChanged: (RangeValues values) {
                                  setState(() => selectedRange = values);
                                }),

                            Container(


                              decoration: BoxDecoration(
                                  border: Border.all(color: WajahColors.WajahPrimary, width: 2),
                                  borderRadius: BorderRadius.circular(0),
                                  color:  WajahColors.WajahButtonPrimaryText,
                                  shape: BoxShape.rectangle),
                              width: 60,
                              height: 30,
                              child: Center(
                                child: Text('MAX', style: TextStyle(
                                    color: WajahColors.black,
                                    fontSize: 15),


                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    button('Apply', () {}),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            );
          }),
        );
      },
    );
  }

  button(String text, Function onPressed) {
    return MaterialButton(
      onPressed: () => onPressed(),
      height: 40,
      elevation: 0,
      splashColor: WajahColors.WajahPrimaryLightColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: WajahColors.WajahPrimary,
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }

}