import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wajah_id/model/colorPallete.dart';
import 'package:wajah_id/screens/skin/skinscreen.dart';





class TermsConditions extends StatefulWidget {
  const TermsConditions({Key key}) : super(key: key);

  @override
  _TermsConditionsState createState() => _TermsConditionsState();
}

class _TermsConditionsState extends State<TermsConditions> {
  // By defaut, the checkbox is unchecked and "agree" is "false"
  bool agree1 = false;
  bool agree2 = false;

  // This function is triggered when the button is clicked
  void _doSomething() {
    // Do something

    _pushPage(context, SkinScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(10, 30, 10, 10),

              ),
              Container(
               // padding: EdgeInsets.all(15),
                child: Text(
                  'Terms and Conditions',
                  style: GoogleFonts.lato(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(
                //width: double.infinity,

                child: Container(
                  child: Image.asset(
                    'assets/otpscreen.png',
                    // scale: 3.5,
                  ),
                ),
              ),
              SizedBox(
                height: 15,

              ),
              Container(
                padding: EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:<Widget>[
                  Text(
                    '[WAJAH ID] TERMS OF SERVICE\n',
                    style: GoogleFonts.lato(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,

                  ),
                ),
                    Text(
                      'Last Updated: March, 6, 2022\n\n'
                          'These terms of service ("Terms") apply to your access and use of WAJAH ID (the "Service"). Please read them carefully.\n',
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.lato(
                        fontSize: 10,
                        fontWeight: FontWeight.normal,


                      ),
                    ),

                    Text(
                      'ACCEPTING THESE TERMS\n',
                      style: GoogleFonts.lato(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,

                      ),
                    ),

                    Text(
                      'If you access or use the Service, it means you agree to be bound by all of the terms below. So, before you use the Service, please read all of the terms.'
                          "If you don't agree to all of the terms below, please do not use the Service. Also, if a term does not make sense to you, please let us know by e-mailing earsadn@gmail.com\n",
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.lato(
                        fontSize: 10,
                        fontWeight: FontWeight.normal,

                      ),
                    ),

                    Text(
                      'CHANGES TO THESE TERMS\n',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.lato(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,

                      ),
                    ),

                    Text(
                      "We reserve the right to modify these Terms at any time. For instance, we may need to change these Terms if we come out with a new feature or for some other reason."

                       " Whenever we make changes to these Terms, the changes are effective [TIME PERIOD] after we post such revised Terms (indicated by revising the date at the top of these Terms) or upon your acceptance if we provide a mechanism for your immediate acceptance of the revised Terms (such as a click-through confirmation or acceptance button). It is your responsibility to check [APP NAME] for changes to these Terms."
       "If you continue to use the Service after the revised Terms go into effect, then you have accepted the changes to these Terms.",
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.lato(
                        fontSize: 10,
                        fontWeight: FontWeight.normal,

                      ),
                    ),
                 ],
                ),
              ),
              Row(
            children: [
              Material(
                child: Checkbox(
                  value: agree1,
                  onChanged: (value) {
                    setState(() {
                      agree1 = value ?? false;
                    });
                  },
                ),
              ),
              const Text(
                'I have read the agreement',
                overflow: TextOverflow.ellipsis,
              )


            ],


          ),
          Row(
            children: [
              Material(
                child: Checkbox(
                  value: agree2,
                  onChanged: (value) {
                    setState(() {
                      agree2 = value ?? false;
                    });
                  },
                ),
              ),
              const Text(
                'I accept the agreement',
                overflow: TextOverflow.ellipsis,
              )


            ],


          ),

          ElevatedButton(
              onPressed: agree1 && agree2 ? _doSomething : null,
              child: Text('Continue',
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),


              ),
            style: ElevatedButton.styleFrom(
            elevation: 2,
            primary: WajahColors.WajahPrimary,
            onPrimary: WajahColors.WajahPrimaryLightColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),),)
          ],),
      ),
    );
  }

  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }
}

