import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wajah_id/firestore-data/notificationList.dart';
import 'package:wajah_id/model/colorPallete.dart';
import 'package:wajah_id/model/view_models/globalVariables_viewModel.dart';
import 'package:wajah_id/model/view_models/auth_viewModel.dart';
import 'package:wajah_id/screens/homepage/cart/cart_screen.dart';
import 'package:wajah_id/screens/homepage/favourites/Favs_screen.dart';
import 'package:wajah_id/screens/homepage/home/components/body1.dart';
import 'package:wajah_id/screens/userProfile.dart';
import 'package:wajah_id/utils/constants.dart';
import 'package:wajah_id/utils/size_config.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';

import '../../../chat/chats/chats_screen.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
FirebaseAuth _firebaseAuth;
  List<Widget> _pageList = [];



  FirebaseAuth _auth = FirebaseAuth.instance;
  User user;

  Future<void> _getUser() async {
    user = _auth.currentUser;
  }
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  void initState() {
    _getUser();

    _pageList.add(HomeBody());
    _pageList.add(FavScreen());
    _pageList.add(CartScreen());
    _pageList.add(ChatsScreen());//chatscreen
  _pageList.add(UserProfile());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    String _message;
    DateTime now = DateTime.now();
    String _currentHour = DateFormat('kk').format(now);
    int hour = int.parse(_currentHour);

    setState(
          () {
        if (hour >= 5 && hour < 12) {
          _message = 'Hi' + ', ' + user.displayName +'  Good Morning';
        } else if (hour >= 12 && hour <= 17) {
          _message = 'Hi' + ', ' + user.displayName +'  Good Afternoon';
        } else {
          _message = 'Hi' + ', ' + user.displayName +'  Good Night';
        }
      },
    );


    SizeConfig().init(context);
    return Consumer<globalVars>(builder: (_, gv, __) {
      return Scaffold(
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
                padding: EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 5),
                      child: CircleAvatar(
                        backgroundColor: WajahColors.WajahPrimaryLightColor,
                        radius: 20,
                        backgroundImage: AssetImage("assets/user.png"),
                      ),
                    ),
                    // SizedBox(
                    //   width: 20,
                    // ),
                    Container(
                      //width: MediaQuery.of(context).size.width/1.3,
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        _message,
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
                    Container(
                      child: IconButton(
                        iconSize: 35,
                        splashRadius: 20,
                        icon: Icon(Icons.notifications_active),
                        onPressed: (){



                          Navigator.push(
                              context,
                              MaterialPageRoute(

                                  builder: (contex) => NotificationList()));
                        },
                      ),
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

        body: IndexedStack(
          index: gv.selectedPage,
          children: _pageList,
        ),
        bottomNavigationBar: Column(

          mainAxisSize: MainAxisSize.min,
          children: [
            TitledBottomNavigationBar(
              curve: Curves.easeInOutQuint,
              activeColor: PrimaryColor,
              reverse: true,
              items: [
                TitledNavigationBarItem(
                    icon: Icons.home_outlined,
                    title: Text("Home",
                        style: TextStyle(fontFamily: "PantonBold"))),
                TitledNavigationBarItem(
                    icon: Icons.favorite_border_outlined,
                    title: Text("Wishlist",
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(13),
                            fontFamily: "PantonBold"))),
                TitledNavigationBarItem(
                    icon: Icons.shopping_cart_outlined,
                    title: Text("Cart",
                        style: TextStyle(fontFamily: "PantonBold"))),

                TitledNavigationBarItem(
                    icon: Icons.chat_outlined,
                    title: Text("Chat",
                        style: TextStyle(fontFamily: "PantonBold"))),
                TitledNavigationBarItem(
                    icon: Icons.person_outline_rounded,
                    title: Text("ProfIle",
                        style: TextStyle(fontFamily: "PantonBold"))),
              ],
              currentIndex: gv.selectedPage,
              onTap: (index) => _onItemTapped(gv, index),
            ),
            Container(
              color: Colors.white,
              height: Theme.of(context).platform == TargetPlatform.iOS
                  ? getProportionateScreenWidth(16)
                  : 0,
            )
          ],
        ),
      );
    });
  }

  void _onItemTapped(globalVars gv, int index) {
    setState(() {
      gv.selectedPage = index;
    });
  }
}
