import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wajah_id/model/colorPallete.dart';
import 'package:wajah_id/screens/product/SkinProduct.dart';
import 'package:wajah_id/screens/product/component/custome_bottomnav.dart';
import 'package:wajah_id/screens/product/component/products.dart';
import 'package:wajah_id/screens/product/enums.dart';


class SerumProduct extends StatefulWidget {
  @override
  _SerumProductState createState() => _SerumProductState();
}

class _SerumProductState extends State<SerumProduct>
    with SingleTickerProviderStateMixin {
    TabController tabcontroller;

  @override
  void initState() {
    super.initState();
    tabcontroller = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => skinproduct(),
              ),
            );
          },
        ),
        title: Text(
          'Skin Product',
          style: TextStyle(color: WajahColors.WajahDisabledButtonText),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(

          child: Column(
            // scrollDirection: Axis.vertical,
            // physics: PageScrollPhysics(),
            // shrinkWrap: true,
            // padding: EdgeInsets.only(left: 16, right: 16),
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.only(left: 16, right: 16),
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
              ),
              SizedBox(
                height: 15,
              ),
              TabBar(
                controller: tabcontroller,
                indicatorColor: Colors.transparent,
                isScrollable: true,
                labelPadding: EdgeInsets.only(right: 45),
                tabs: [
                  Tab(
                    child: Text(
                      'All',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Serum',
                      style: TextStyle(
                          color: WajahColors.WajahButtonPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Toner',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Essence',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Moisturizer',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height - 50,
                  width: double.infinity,
                  child: TabBarView(controller: tabcontroller, children: [
                    products(),
                    products(),
                    products(),
                    products(),
                    products(),
                  ]),
                ),
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigatorBar(
        selectedMenu: MenuState.Profile,
      ),
    );
  }
}
