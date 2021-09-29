import 'dart:ui';

import 'package:beyaz_fincan_app/Test/testData.dart';
import 'package:beyaz_fincan_app/Utility/AppColors.dart';
import 'package:beyaz_fincan_app/Utility/AppDecorations.dart';
import 'package:beyaz_fincan_app/Utility/AppUtility.dart';
import 'package:beyaz_fincan_app/Widget/CustomAppBar.dart';
import 'package:beyaz_fincan_app/Widget/CustomAppTitleBar.dart';
import 'package:beyaz_fincan_app/Widget/CustomDrawer.dart';
import 'package:beyaz_fincan_app/Widget/CustomGlowButton.dart';
import 'package:flutter/material.dart';
import 'package:rubber/rubber.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class FTRequestDetailPage extends StatefulWidget {
  const FTRequestDetailPage({Key key}) : super(key: key);

  @override
  _FTRequestDetailPageState createState() => _FTRequestDetailPageState();
}

class _FTRequestDetailPageState extends State<FTRequestDetailPage>
    with SingleTickerProviderStateMixin {
  // MediaQuery.of(context).padding.top * 2.5 + 79 + 55, // 79:appBar, 55: contentTitle
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _commentController;

  // RUBBER VARIABLES
  RubberAnimationController _ruberController;
  ScrollController _ruberScrollController;
  double ruberInitialHeightValue = 0.1;
  double ruberMaxHeightValue = 0.9;
  double ruberStandartHeightValue = 0.4;
  double ruberCurrentValue = 0.1;

  // RATING VARIABLES
  double ratingValue = 0;

  @override
  void initState() {
    super.initState();
    _commentController = TextEditingController();
    _ruberController = RubberAnimationController(
        vsync: this,
        dismissable: false,
        duration: Duration(milliseconds: 200),
        upperBoundValue:
            AnimationControllerValue(percentage: ruberMaxHeightValue),
        initialValue: ruberInitialHeightValue);

    _ruberController.addListener(() {
      ruberCurrentValue = _ruberController.value;
      if (_ruberController.value == 0) {
        setState(() {
          // isClickedButton = false;
          // isClickedRegisterPage = false;
        });
      }
      if (_ruberController.value > 0) {
        setState(() {
          // isClickedButton = true;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _commentController.dispose();
    _ruberController.dispose();
    _ruberScrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SafeArea(
        child: Scaffold(
            key: _scaffoldKey,
            drawer: CustomDrawer(faeLoginUser),
            body: Container(
              width: getSize(context),
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: appCrossGradientBackground,
              ),
              child: RubberBottomSheet(
                animationController: _ruberController,
                scrollController: _ruberScrollController,
                headerHeight: 0,
                upperLayer: buildBottomSheet(),
                lowerLayer: buildLowerLayer(),
              ),
            )),
      ),
    );
  }

  Widget buildLowerLayer() {
    return Column(
      children: [
        ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: CustomAppBar(faeLoginUser, _scaffoldKey),
          ),
        ),
        CustomAppTitleBar('Kahve Falım'),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(
              top: 20,
              bottom: 120,
              left: 25,
              right: 25,
            ),
            children: [
              Text(
                '$requestDetailContentText $requestDetailContentText',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildBottomSheet() {
    return StatefulBuilder(
      builder: (context, setStateC) {
        return Container(
          width: getSize(context),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
            color: appColorBgDarkPurple,
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              width: getSize(context),
              padding: EdgeInsets.only(
                top: 15,
                left: 20,
                right: 20,
              ),
              child: ClipRRect(
                child: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Falını beğendin mi?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Center(
                          child: SmoothStarRating(
                        allowHalfRating: false,
                        starCount: 5,
                        size: 35,
                        rating: ratingValue,
                        color: Color.fromARGB(255, 252, 86, 99),
                        borderColor: Color.fromARGB(255, 252, 86, 99),
                        onRated: (rating) {
                          setState(() {
                            ratingValue = rating;
                          });
                        },
                      )),
                    ),
                    Container(
                      width: getSize(context),
                      height: getSize(context),
                      margin: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: _commentController,
                        scrollPadding: EdgeInsets.zero,
                        style: TextStyle(color: Colors.grey.shade700, fontSize: 15,),
                        decoration: InputDecoration(
                          hintText: 'Falını yorumla...',
                          hintStyle: TextStyle(color: appColorGrey.withOpacity(.7), fontSize: 15,),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: CustomGlowButton(
                        onPressed: () {},
                        title: 'YORUMLA',
                        width: getSize(context),
                        gradientColorStart: appColorButtonOrangeGradientStart,
                        gradientColorEnd: appColorButtonOrangeGradientEnd,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
