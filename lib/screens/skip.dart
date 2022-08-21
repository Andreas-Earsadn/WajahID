import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wajah_id/model/colorPallete.dart';
import 'package:wajah_id/screens/signIn.dart';
import 'package:introduction_screen/introduction_screen.dart';


class Skip extends StatefulWidget {
  @override
  _SkipState createState() => _SkipState();
}

class _SkipState extends State<Skip> {

  List<PageViewModel> getpages() {
    return [

      PageViewModel(

        title: '',


        image: Image.asset(
          'assets/next1.png',

          // fit: BoxFit.contain,
        ),

        bodyWidget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome To Wajah ID',
              style:
                  GoogleFonts.lato(fontSize: 30, fontWeight: FontWeight.w900),
            ),
            Text(
              'Now you can be beauty anytime just using your mobile phone  ',
              style: GoogleFonts.lato(
                  fontSize: 15,
                  color: Colors.grey[500],
                  fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ),

      PageViewModel(

        title: '',

        image: Image.asset(
          'assets/next2.png',

          //fit: BoxFit.cover,
        ),
        //body: "Search Doctors",
        bodyWidget: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Find a beauty clinic',
              style:
              GoogleFonts.lato(fontSize: 30, fontWeight: FontWeight.w900),
            ),
            Text(
              'We will help you to find the best clinic for your skin needs',

              style: GoogleFonts.lato(
                  fontSize: 15,
                  color: Colors.grey[500],
                  fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ),
      PageViewModel(
        title: '',
        image: Container(
          alignment: Alignment.center,
          child: Image.asset(
            'assets/skip.png',
            fit: BoxFit.none,
          ),
        ),
        //body: "Search Doctors",
        bodyWidget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Consultation with doctor',
              style:
                  GoogleFonts.lato(fontSize: 30, fontWeight: FontWeight.w900),
            ),
            Text(
              'Consult your skin needs with a trusted doctor',
              style: GoogleFonts.lato(
                  fontSize: 15,
                  color: Colors.grey[500],
                  fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: IntroductionScreen(

        dotsDecorator: DotsDecorator(
          activeColor: WajahColors.WajahPrimary ,
          size: Size.square(15.0),
          activeSize: Size.square(15.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),

        globalBackgroundColor: Colors.white,
        pages: getpages(),
        showNextButton: false,
        showSkipButton: true,


        skip: SizedBox(
          width: 80,
          height: 48,
          child: Card(
            child: Center(
              child: Text(
                'Skip',

                textAlign: TextAlign.center,
                style:
                    GoogleFonts.roboto(fontSize: 25, fontWeight: FontWeight.w900, color: WajahColors.WajahPrimary),
              ),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: WajahColors.WajahButtonSecondary,
            shadowColor: Colors.blueGrey[100],
            elevation: 5,
          ),
        ),
        done: SizedBox(
          height: 48,
          child: Card(
            child: Center(
              child: Text(
                'Lanjutkan',
                textAlign: TextAlign.center,
                style:
                    GoogleFonts.lato(fontSize: 15, fontWeight: FontWeight.w900, color: WajahColors.WajahButtonPrimaryText),
              ),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: WajahColors.WajahPrimary,
            shadowColor: WajahColors.WajahPrimaryLightColor,
            elevation: 5,
          ),
        ),
        onDone: () => _pushPage(context, SignIn()),
      ),
    );
  }

  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }
}
