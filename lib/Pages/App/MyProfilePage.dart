import 'package:beyaz_fincan_app/Model/UserEntity.dart';
import 'package:beyaz_fincan_app/Utility/AppAssetPaths.dart';
import 'package:beyaz_fincan_app/Utility/AppColors.dart';
import 'package:beyaz_fincan_app/Utility/AppCostant.dart';
import 'package:beyaz_fincan_app/Utility/AppUtility.dart';
import 'package:beyaz_fincan_app/Widget/CustomAppBar.dart';
import 'package:beyaz_fincan_app/Widget/CustomAppTitleBar.dart';
import 'package:beyaz_fincan_app/Widget/CustomDrawer.dart';
import 'package:beyaz_fincan_app/Widget/CustomDropDown.dart';
import 'package:beyaz_fincan_app/Widget/CustomGlowButton.dart';
import 'package:flutter/material.dart';

import 'dart:ui';

import 'package:beyaz_fincan_app/Utility/AppDecorations.dart';
import 'package:beyaz_fincan_app/Test/testData.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyProfilePage extends StatefulWidget {
  UserEntity user;
  MyProfilePage(this.user, {Key key}) : super(key: key);

  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _userEmailController = TextEditingController();
  DateTime _userBirthdayDateTime;
  String _userGenderStatusString;
  String _userRelationshipStatusString;
  String _userWorkStatusString;
  String _userEducationStatusString;

  int genderValue;
  int workStatusValue;
  int relationshipStatusValue;
  int educationStatusValue;

  @override
  void initState() {
    _userNameController.text = faeLoginUser.name;
    _userEmailController.text = faeLoginUser.email;
    _userBirthdayDateTime = faeLoginUser.birdtday;

    genderValue = widget.user.gender.index;
    workStatusValue = widget.user.work.index;
    relationshipStatusValue = widget.user.relationship.index;
    educationStatusValue = widget.user.education.index;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _userNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _userGenderStatusString = genderDropdownItems[genderValue];
    _userRelationshipStatusString =
        relationshipStatusDropdownItems[relationshipStatusValue];
    _userWorkStatusString = workStatusDropDownItems[workStatusValue];
    _userEducationStatusString =
        educationStatusDropdownItems[educationStatusValue];

    return Scaffold(
        key: _scaffoldKey,
        drawer: CustomDrawer(faeLoginUser),
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: appCrossGradientBackground,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: CustomAppBar(faeLoginUser, _scaffoldKey),
                ),
              ),
              CustomAppTitleBar('KİŞİSEL BİLGİLER'),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    Center(
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: appColorBgDarkPurple,
                          border: Border.all(
                            color: appColorMyProfileCircleBorder,
                            width: 3,
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: appColorMyProfileCircleShadow,
                                blurRadius: 22,
                                offset: Offset(0, 7))
                          ],
                          shape: BoxShape.circle,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(1000),
                          child: Stack(
                            children: [
                              Center(
                                child: CircleAvatar(
                                  radius: 75,
                                  backgroundImage:
                                      NetworkImage(faeLoginUser.photoUrl),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: InkWell(
                                  onTap: () {
                                    // update PP
                                  },
                                  child: Container(
                                    width: 150,
                                    height: 40,
                                    color: Colors.white.withOpacity(.4),
                                    child: Icon(
                                      FontAwesomeIcons.camera,
                                      color:
                                          appColorBgDarkPurple.withOpacity(.6),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${faeLoginUser.point}',
                            style: TextStyle(color: Colors.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 3.0,
                            ),
                            child: Image.asset(appAssetsPathRate),
                          ),
                        ],
                      ),
                    ),
                    buildNameController(context),
                    buildBirthdayController(context),
                    buildEmailController(context),
                    buildGenderController(context),
                    buildRelationsshipController(context),
                    buildEducationController(context),
                    buildWorkController(context),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 25,
                        right: 25,
                      ),
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: CustomGlowButton(
                          title: 'KAYDET',
                          onPressed: () {},
                          gradientColorStart: appColorButtonOrangeGradientStart,
                          gradientColorEnd: appColorButtonOrangeGradientEnd,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget buildWorkController(BuildContext context) {
    return Container(
      width: getSize(context),
      height: 60,
      margin: EdgeInsets.only(
        top: 15,
        left: 25,
        right: 25,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: CustomDropDown(
        items: workStatusDropDownItems,
        onChange: (value) {
          setState(() {
            workStatusValue = value;
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              FontAwesomeIcons.briefcase,
              color: appColorGrey,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Çalışma durumu',
                    style: appTextStylePersonalInfoDropTitle,
                  ),
                  Text(
                    '$_userWorkStatusString',
                    style: appTextStylePersonalInfoDropContent,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildEducationController(BuildContext context) {
    return Container(
      width: getSize(context),
      height: 60,
      margin: EdgeInsets.only(
        top: 15,
        left: 25,
        right: 25,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: CustomDropDown(
        items: educationStatusDropdownItems,
        onChange: (value) {
          setState(() {
            educationStatusValue = value;
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              FontAwesomeIcons.graduationCap,
              color: appColorGrey,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Eğitim durumu',
                    style: appTextStylePersonalInfoDropTitle,
                  ),
                  Text(
                    '$_userEducationStatusString',
                    style: appTextStylePersonalInfoDropContent,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildRelationsshipController(BuildContext context) {
    return Container(
      width: getSize(context),
      height: 60,
      margin: EdgeInsets.only(
        top: 15,
        left: 25,
        right: 25,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: CustomDropDown(
        items: relationshipStatusDropdownItems,
        onChange: (value) {
          setState(() {
            relationshipStatusValue = value;
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              FontAwesomeIcons.heart,
              color: appColorGrey,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'İlişki durumu',
                    style: appTextStylePersonalInfoDropTitle,
                  ),
                  Text(
                    '$_userRelationshipStatusString',
                    style: appTextStylePersonalInfoDropContent,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildGenderController(BuildContext context) {
    return Container(
      width: getSize(context),
      height: 60,
      margin: EdgeInsets.only(
        top: 15,
        left: 25,
        right: 25,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: CustomDropDown(
        items: genderDropdownItems,
        onChange: (value) {
          setState(() {
            genderValue = value;
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              FontAwesomeIcons.user,
              color: appColorGrey,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cinsiyet',
                    style: appTextStylePersonalInfoDropTitle,
                  ),
                  Text(
                    '$_userGenderStatusString',
                    style: appTextStylePersonalInfoDropContent,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildEmailController(BuildContext context) {
    return Container(
      width: getSize(context),
      height: 60,
      margin: EdgeInsets.only(
        top: 15,
        left: 25,
        right: 25,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            FontAwesomeIcons.at,
            color: appColorGrey,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Email',
                  style: appTextStylePersonalInfoDropTitle,
                ),
                Container(
                  width: getSize(context) * 0.6,
                  child: TextField(
                    controller: _userEmailController,
                    style: appTextStylePersonalInfoDropContent,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      border: InputBorder.none,
                      isDense: true,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildNameController(BuildContext context) {
    return Container(
      width: getSize(context),
      height: 60,
      margin: EdgeInsets.only(
        top: 15,
        left: 25,
        right: 25,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            FontAwesomeIcons.user,
            color: appColorGrey,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Adı',
                  style: appTextStylePersonalInfoDropTitle,
                ),
                Container(
                  width: getSize(context) * 0.6,
                  child: TextField(
                    controller: _userNameController,
                    style: appTextStylePersonalInfoDropContent,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      border: InputBorder.none,
                      isDense: true,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildBirthdayController(BuildContext context) {
    return InkWell(
      onTap: () async {
        _userBirthdayDateTime = await showDatePicker(
          context: context,
          initialDate: _userBirthdayDateTime,
          currentDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
          initialEntryMode: DatePickerEntryMode.calendar,
          initialDatePickerMode: DatePickerMode.year,
          cancelText: 'İptal',
          confirmText: 'Seç',
          helpText: 'Doğum tarihini seçiniz.',
        ).whenComplete(() {
          setState(() {});
        });
      },
      child: Container(
        width: getSize(context),
        height: 60,
        margin: EdgeInsets.only(
          top: 15,
          left: 25,
          right: 25,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              FontAwesomeIcons.calendarAlt,
              color: appColorGrey,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Doğum Tarihi',
                    style: appTextStylePersonalInfoDropTitle,
                  ),
                  Text(
                    _userBirthdayDateTime == null
                        ? 'Doğum tarihini giriniz.'
                        : '${_userBirthdayDateTime.day.toString()}.${_userBirthdayDateTime.month.toString()}.${_userBirthdayDateTime.year.toString()}',
                    style: appTextStylePersonalInfoDropContent,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
