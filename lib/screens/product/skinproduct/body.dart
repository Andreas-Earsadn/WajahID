import 'package:flutter/material.dart';
import 'package:wajah_id/model/colorPallete.dart';
import 'package:wajah_id/screens/product/serum/Serum.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.only(left: 16, right: 200),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 204, 223, 210),
                      borderRadius: BorderRadius.circular(20)),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        hintText: 'Search Product',
                        hintStyle: TextStyle(color: Colors.white, fontSize: 15)),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      RaisedButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                        onPressed: () {
                          print('All');
                        },
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30))),
                        child: Text(
                          'All',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      RaisedButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                        onPressed: () {
                          print('Serum');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SerumProduct(),
                            ),
                          );
                        },
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30))),
                        child: Text(
                          'Serum',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      RaisedButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                        onPressed: () {
                          print('Toner');
                        },
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30))),
                        child: Text(
                          'Toner',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      RaisedButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                        onPressed: () {
                          print('Essence');
                        },
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30))),
                        child: Text(
                          'Essence',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      RaisedButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                        onPressed: () {
                          print('Moisturize');
                        },
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30))),
                        child: Text(
                          'Moisturize',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 204, 223, 210),
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/skin_products/images/promosknker.png'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.keyboard_arrow_left,
                      color: WajahColors.WajahHoverPrimary,
                    ),
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: WajahColors.WajahHoverPrimary,
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: WajahColors.WajahHoverPrimary,
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: WajahColors.WajahHoverPrimary,
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Icon(Icons.keyboard_arrow_right,
                        color: WajahColors.WajahHoverPrimary)
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Avoskin',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.normal),
                          ),
                          Icon(Icons.keyboard_arrow_right),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 200,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            product('assets/skin_products/images/Avo1.png'),
                            product('assets/skin_products/images/Avo2.png'),
                            product('assets/skin_products/images/Avo3.png'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Skintific',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.normal),
                          ),
                          Icon(Icons.keyboard_arrow_right),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 200,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            product('assets/skin_products/images/skintific1.png'),
                            product('assets/skin_products/images/skintific2.png'),
                            product('assets/skin_products/images/skintific3.png'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Something',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.normal),
                          ),
                          Icon(Icons.keyboard_arrow_right),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 200,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            product('assets/skin_products/images/something1.png'),
                            product('assets/skin_products/images/something2.png'),
                            product('assets/skin_products/images/something3.png'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'NPure',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.normal),
                          ),
                          Icon(Icons.keyboard_arrow_right),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 200,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            product('assets/skin_products/images/npure1.png'),
                            product('assets/skin_products/images/npure2.png'),
                            product('assets/skin_products/images/npure3.png'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                      onPressed: () {},
                      child: Text(
                        'more',
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ), //child: SingleChildScrollView(
      //  child: Column(
      //children: [
      //Padding(
      //padding: EdgeInsets.symmetric(
      //horizontal: getProportionateScreenWidth(20),
      //),
      //child: Row(
      //children: [
      //Container(
      //width: SizeConfig.screenWidth * 0.6,
      //height: 50,
      //decoration: BoxDecoration(
      //  color: Color.fromARGB(255, 147, 165, 153),
      //borderRadius: BorderRadius.circular(20)),
      //child: TextField(
      //onChanged: (value) {},
      //decoration: InputDecoration(
      //enabledBorder: InputBorder.none,
      //focusedBorder: InputBorder.none,
      // hintText: 'Seacrh Product',
      // prefixIcon: Icon(Icons.search),
      // contentPadding: EdgeInsets.symmetric(
      //   horizontal: getProportionateScreenWidth(20),
      //      vertical: getProportionateScreenWidth(9)),
      //),
      //),
      //),
      //],
      //),
      //)
      //],
      //)),
    );
  }

  Widget product(Image) {
    return AspectRatio(
      aspectRatio: 0.25 / 0.25,
      child: Container(
        margin: EdgeInsets.only(right: 15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.contain,
            image: AssetImage(Image),
          ),
        ),
      ),
    );
  }
}
