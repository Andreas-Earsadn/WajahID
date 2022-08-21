import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wajah_id/screens/doctorProfile.dart';

import 'package:wajah_id/screens/homepage/cart/cart_screen.dart';
import 'package:wajah_id/screens/homepage/category/categoryScreen.dart';
import 'package:wajah_id/screens/homepage/favourites/Favs_screen.dart';
import 'package:wajah_id/screens/homepage/home/home_screen.dart';
import 'package:wajah_id/screens/homepage/prodDetails/details_screen.dart';
import 'package:wajah_id/screens/myAppointments.dart';
import 'package:wajah_id/screens/register.dart';
import 'package:wajah_id/screens/signIn.dart';
import 'package:wajah_id/screens/skip.dart';
import 'package:wajah_id/screens/userProfile.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wajah_id/utils/routes.dart';
import 'package:wajah_id/utils/theme.dart';
import 'package:provider/provider.dart';

import 'model/view_models/auth_viewModel.dart';
import 'model/view_models/globalVariables_viewModel.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  auth_viewModel(FirebaseAuth.instance).AnonymousOrCurrent();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;
  User user;

  Future<void> _getUser() async {
    user = _auth.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    _getUser();


    return MultiProvider(

      providers: [
        Provider<auth_viewModel>(
            create: (_) => auth_viewModel(FirebaseAuth.instance)),
        StreamProvider(
          initialData: 0,
          create: (context) => context.read<auth_viewModel>().authStateChanges,
        ),
        ChangeNotifierProvider(create: (context) => globalVars()),
      ],

      child:  MaterialApp(

        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        title: 'Wajah ID',
        //theme: theme(),
        //home: Skip(),
        routes: {
          '/': (context) => user == null ? Skip() : HomeScreen(),
    FavScreen.routeName: (context) => FavScreen(),
    SignIn.routeName: (context) => SignIn(),
    Register.routeName: (context) => Register(),
   HomeScreen.routeName: (context) => HomeScreen(),
    DetailsScreen.routeName: (context) => DetailsScreen(),
    CategoryScreen.routeName: (context) => CategoryScreen(),
    CartScreen.routeName: (context) => CartScreen(),
    UserProfile.routeName: (context) => UserProfile (),},



          theme: ThemeData(brightness: Brightness.light),
         // debugShowCheckedModeBanner: false,,
      ),
    );
  }

}
