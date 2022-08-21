import 'package:flutter/widgets.dart';
import 'package:wajah_id/screens/homepage/cart/cart_screen.dart';
import 'package:wajah_id/screens/homepage/category/categoryScreen.dart';
import 'package:wajah_id/screens/homepage/favourites/Favs_screen.dart';
import 'package:wajah_id/screens/homepage/home/home_screen.dart';
import 'package:wajah_id/screens/homepage/prodDetails/details_screen.dart';
import 'package:wajah_id/screens/register.dart';
import 'package:wajah_id/screens/signIn.dart';
import 'package:wajah_id/screens/skip.dart';
import 'package:wajah_id/screens/userProfile.dart';


final Map<String, WidgetBuilder> routes = {
  //'/': (context) => user == null ? Skip() : MainPage(),
  FavScreen.routeName: (context) => FavScreen(),
  SignIn.routeName: (context) => SignIn(),
  Register.routeName: (context) => Register(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CategoryScreen.routeName: (context) => CategoryScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  UserProfile.routeName: (context) => UserProfile (),

  // OrdersScreen.routeName: (context) => OrdersScreen(),
   //UserInfoScreen.routeName: (context) => UserInfoScreen(),
  // SearchScreen.routeName: (context) => SearchScreen(),
};
