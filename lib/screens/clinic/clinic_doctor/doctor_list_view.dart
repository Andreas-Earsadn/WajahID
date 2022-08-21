
import 'package:flutter/material.dart';
import 'package:wajah_id/clinic/clinic_doctor/clinic_doctor_profile.dart';
import 'package:wajah_id/clinic/detail_clinic.dart';
import 'package:wajah_id/model/clinic_model/clinicData.dart';
import 'package:wajah_id/model/clinic_model/clinicModel.dart';
import 'package:wajah_id/model/colorPallete.dart';
import 'package:wajah_id/model/doctor_model/doctorModel.dart';


class DoctorListView extends StatefulWidget {
  const DoctorListView({Key key, this.callBack}) : super(key: key);

  final Function() callBack;
  @override
  _DoctorListViewState createState() => _DoctorListViewState();
}

class _DoctorListViewState extends State<DoctorListView> with TickerProviderStateMixin {


  AnimationController animationController;
  ClinicDoctor clinicDoctor;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);

    super.initState();



  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16,right: 16),
      child: Container(
        height: 134,
        width: double.infinity,
        child: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return ListView.builder(
                padding: const EdgeInsets.only(
                    top: 0, bottom: 0, right: 16, left: 16),
                itemCount: ClinicDoctor.clinicDoctor.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final int count = ClinicDoctor.clinicDoctor.length > 10
                      ? 10
                      : ClinicDoctor.clinicDoctor.length;
                  final Animation<double> animation =
                  Tween<double>(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                          parent: animationController,
                          curve: Interval((1 / count) * index, 1.0,
                              curve: Curves.fastOutSlowIn)));
                  animationController?.forward();

                  return doctorListView(
                    clinicDoctor: ClinicDoctor.clinicDoctor[index],

                    animation: animation,
                    animationController: animationController,
                    callback: widget.callBack,
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class doctorListView extends StatelessWidget {
  const doctorListView(
      {Key key,
        this.clinicDoctor,
        this.animationController,
        this.animation,
        this.callback})
      : super(key: key);

  final VoidCallback callback;
  final ClinicDoctor clinicDoctor;
  final AnimationController animationController;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
                100 * (1.0 - animation.value), 0.0, 0.0),
            child: Card(
              child: InkWell(
                splashColor: WajahColors.WajahBrandColor,
                onTap: () async {
                  Navigator.push(context,MaterialPageRoute(
                    builder: (context) => DetailClinicDoctorScreen(model: clinicDoctor,),
                  ),);
                  // Navigator.push(context, MaterialPageRoute(
                  //   builder: (context) => DetailClinicScreen(clinic: clinic),
                  //
                  // ));
                },
                child: SizedBox(
                  width: 120,
                  //
                  // height: double.infinity,

                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize:  MainAxisSize.max,
                      children:<Widget>[



                        Container(

                            margin: EdgeInsets.all(7.5),

                            child:  ClipRRect(
                              borderRadius:
                              const BorderRadius.all(Radius.circular(5.0)),
                              child: AspectRatio(
                                  aspectRatio: 2.0,
                                  child: Image.asset(clinicDoctor.image)
                              ),
                            )
                        ),

                        Container(
                          padding: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  colors: [
                                    WajahColors.WajahButtonSecondary.withOpacity(.8),
                                    WajahColors.WajahButtonSecondary.withOpacity(.8),
                                  ]
                              )
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[

                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        '${clinicDoctor.name}',
                                        textAlign:
                                        TextAlign.left,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          letterSpacing: 0.27,
                                          color:Colors.black,
                                        ),
                                      ),
                                    ),


                                  ],
                                ),
                              ),

                              Container(

                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      '${clinicDoctor.rating}',
                                      textAlign:
                                      TextAlign.left,
                                      style: TextStyle(
                                        fontWeight:
                                        FontWeight.normal,
                                        fontSize: 12,
                                        letterSpacing: 0.27,
                                        color:WajahColors.WajahPrimary,
                                      ),
                                    ),

                                    Icon(
                                      Icons.star,
                                      color: WajahColors.WajahRating,
                                      size: 17,
                                    ),
                                  ],
                                ),


                              ),

                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      '${clinicDoctor.price}',
                                      textAlign:
                                      TextAlign.left,
                                      style: TextStyle(
                                        fontWeight:
                                        FontWeight.bold,
                                        fontSize: 12,
                                        letterSpacing: 0.27,
                                        color:WajahColors.WajahPrimary,
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
            ),
          ),
        );
      },
    );
  }
}