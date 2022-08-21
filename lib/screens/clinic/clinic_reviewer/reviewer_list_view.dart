
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:wajah_id/clinic/clinic_reviewer/reviewer_slider.dart';

import 'package:wajah_id/model/clinic_model/clinicModel.dart';
import 'package:wajah_id/model/colorPallete.dart';

class ReviewerListView extends StatefulWidget {
  const ReviewerListView({Key key, this.callBack}) : super(key: key);

  final Function() callBack;
  @override
  _ReviewerListViewState createState() => _ReviewerListViewState();
}

class _ReviewerListViewState extends State<ReviewerListView> with TickerProviderStateMixin {

  GlobalKey<PageSliderState> _slider = GlobalKey();
  AnimationController animationController;

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
                itemCount: ClinicReviewer.clinicReviewer.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final int count = ClinicReviewer.clinicReviewer.length> 10
                      ? 10
                      : ClinicReviewer.clinicReviewer.length;
                  final Animation<double> animation =
                  Tween<double>(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                          parent: animationController,
                          curve: Interval((1 / count) * index, 1.0,
                              curve: Curves.fastOutSlowIn)));
                  animationController?.forward();

                  return reviewerListView(
                    clinicReviewer: ClinicReviewer.clinicReviewer[index],
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
GlobalKey<PageSliderState> _slider = GlobalKey();
class reviewerListView extends StatelessWidget {

  const reviewerListView(
      {Key key,
        this.clinicReviewer,
        this.animationController,
        this.animation,
        this.callback})
      : super(key: key);

  final VoidCallback callback;
  final ClinicReviewer clinicReviewer;
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                PageSlider(
                  key: _slider,
                  duration: Duration(milliseconds: 400),
                  pages: <Widget>[
                    _card(),

                  ],
                ),
                SizedBox(
                  height: 30,
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    Container(
                      child: FloatingActionButton(
                        backgroundColor: WajahColors.WajahButtonPrimaryText,
                        foregroundColor: WajahColors.black,


                        child: Icon(Icons.arrow_back_ios),
                        onPressed: () => _slider.currentState.previous(),
                      ),
                    ),


                    Container(
                      child: FloatingActionButton(
                        backgroundColor: WajahColors.WajahButtonPrimaryText,
                        foregroundColor: WajahColors.black,
                        child: Icon(Icons.arrow_forward_ios),
                        onPressed: () => _slider.currentState.next(),
                      ),
                    ),
                  ],
                ),
                MaterialButton(
                  // jump to zero-indexed page number
                  onPressed: () => _slider.currentState.setPage(3),
                  child: Text('Go to last reviewer'),
                ),


              ],
            ),
          ),
        );

      },

    );


  }
  Widget _card() =>
      Card(
        color: WajahColors.WajahPrimaryLightColor,
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(

            children: <Widget> [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget> [
                  Icon(FlutterIcons.quote_left_faw5s, size: 40,color: WajahColors.WajahPrimary,),

                ],
              ),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget> [

                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: CircleAvatar(
                        backgroundColor: WajahColors.WajahPrimaryLightColor,
                        radius: 50,
                        backgroundImage: AssetImage(clinicReviewer.imagePath),
                      ),
                    ),

                  ],
                ),
              ),

              Container(
                child: Text(clinicReviewer.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    )
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 30),
                child: Text(clinicReviewer.comment,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    )
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget> [
                  Icon(FlutterIcons.quote_right_faw5s,size: 40,color: WajahColors.WajahPrimary,),

                ],
              ),
            ],
          ),
        ),
      );
}
