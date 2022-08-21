
import 'package:flutter/material.dart';
import 'package:wajah_id/clinic/clinic_doctor/clinic_doctor_profile.dart';
import 'package:wajah_id/model/clinic_model/all_clinic_card.dart';
import 'package:wajah_id/model/clinic_model/clinicModel.dart';
import 'package:wajah_id/model/colorPallete.dart';
import 'package:wajah_id/model/doctor_model/allDoctorCard.dart';

class AllClinicListView extends StatefulWidget {
  const AllClinicListView({Key key, this.callBack}) : super(key: key);

  final Function() callBack;
  @override
  _AllClinicListViewState createState() => _AllClinicListViewState();
}

class _AllClinicListViewState extends State<AllClinicListView> with TickerProviderStateMixin {


  AnimationController animationController;
  Clinic clinic;

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

    return FutureBuilder<bool>(

      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();

        } else {
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,

            padding: const EdgeInsets.only(
                top: 0, bottom: 0, right: 8, left: 8),
            itemCount: Clinic.allClinicList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              final int count = Clinic.allClinicList.length > 10
                  ? 10
                  : Clinic.popularClinicList.length;
              final Animation<double> animation =
              Tween<double>(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                      parent: animationController,
                      curve: Interval((1 / count) * index, 1.0,
                          curve: Curves.fastOutSlowIn)));
              animationController?.forward();

              return AllClinicCard(
                // clinicDoctor: ClinicDoctor.allClinicDoctor[index],
                clinic: Clinic.allClinicList[index],
                animation: animation,
                animationController: animationController,
                //callback: widget.callBack,
              );
            },
          );
        }
      },


    );
  }




}
