import 'package:beyaz_fincan_app/Utility/AppRouteProviders.dart';
import 'package:beyaz_fincan_app/Widget/CustomAppBar.dart';
import 'package:beyaz_fincan_app/Widget/CustomAppTitleBar.dart';
import 'package:beyaz_fincan_app/Widget/CustomDrawer.dart';
import 'package:beyaz_fincan_app/Widget/CustomDropDown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:ui';

import 'package:beyaz_fincan_app/Widget/CustomGlowButton.dart';
import 'package:beyaz_fincan_app/Utility/AppDecorations.dart';
import 'package:beyaz_fincan_app/Test/testData.dart';
import 'package:beyaz_fincan_app/Utility/AppColors.dart';
import 'package:beyaz_fincan_app/Utility/AppCostant.dart';
import 'package:beyaz_fincan_app/Utility/AppUtility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ForWhomPage extends StatefulWidget {
  int indexToPage;
  ForWhomPage(this.indexToPage, {Key key}) : super(key: key);

  @override
  _ForWhomPageState createState() => _ForWhomPageState();
}

class _ForWhomPageState extends State<ForWhomPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  TextEditingController _nameSurnameController =
      TextEditingController(text: '');
  FocusNode _nameSurnameFocusNode = FocusNode();
  GlobalKey _formKey = GlobalKey<FormState>();
  int forWhomValue;
  int genderValue;
  int workStatusValue;
  int relationshipStatusValue;
  int educationStatusValue;
  DateTime selectedBirthday;

  bool checkAllValue() {
    if (forWhomValue != null &&
        genderValue != null &&
        workStatusValue != null &&
        relationshipStatusValue != null &&
        educationStatusValue != null &&
        selectedBirthday != null &&
        _nameSurnameController.text != '') {
      return true;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: _scaffoldKey,
          resizeToAvoidBottomPadding: false,
          drawer: CustomDrawer(faeLoginUser),
          body: Form(
            key: _formKey,
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: appCrossGradientBackground,
              ),
              child: Column(
                children: [
                  ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: CustomAppBar(faeLoginUser, _scaffoldKey),
                    ),
                  ),
                  CustomAppTitleBar('KİŞİSEL BİLGİLER'),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 12,
                      ),
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(40)),
                        child: Container(
                          width: getSize(context),
                          decoration: BoxDecoration(
                              color: appColorBgDarkPurple,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(40))),
                          padding: EdgeInsets.only(
                            // top: 25,
                            // bottom: 40,
                            left: 20,
                            right: 20,
                          ),
                          child: ListView(
                            shrinkWrap: true,
                            padding: EdgeInsets.only(bottom: 30, top: 25),
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 25.0,
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 25.0),
                                          child: Text(
                                            'Kimin İçin',
                                            style:
                                                appTextStyleDetailContentContainerTitle,
                                          ),
                                        ),
                                        CustomDropDown(
                                          items: forWhomDropdownItems,
                                          // items: [
                                          //   'test',
                                          //   'test',
                                          //   'test',
                                          //   'test',
                                          //   'test',
                                          //   'test',
                                          //   'test',
                                          //   'test',
                                          //   'test',
                                          //   'test',
                                          //   'test',
                                          //   'test',
                                          // ],
                                          child: Container(
                                            height: 40,
                                            child: Stack(
                                              children: [
                                                Center(
                                                  child: Text(
                                                    forWhomValue != null
                                                        ? forWhomDropdownItems[
                                                            forWhomValue]
                                                        : 'SEÇİM YAPINIZ.',
                                                    style:
                                                        appTextStyleDropdownStyle,
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 15.0),
                                                    child: FaIcon(
                                                      FontAwesomeIcons
                                                          .chevronDown,
                                                      size: 20,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          onChange: (value) {
                                            setState(() {
                                              forWhomValue = value;
                                            });
                                          },
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 20.0),
                                          child: Container(
                                            width: getSize(context),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: getSize(context),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                      vertical: 10),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Adı Soyadı',
                                                        style:
                                                            appTextStylePersonalInfoDropTitle,
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            _nameSurnameController,
                                                        focusNode:
                                                            _nameSurnameFocusNode,
                                                        decoration: InputDecoration(
                                                            isDense: true,
                                                            isCollapsed: true,
                                                            border: InputBorder
                                                                .none,
                                                            hintText:
                                                                'İsmini giriniz.'),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Divider(
                                                  color: Colors.black
                                                      .withOpacity(.5),
                                                  height: 1,
                                                ),
                                                InkWell(
                                                  onTap: () async {
                                                    FocusScope.of(context)
                                                        .requestFocus(
                                                            new FocusNode());
                                                    selectedBirthday =
                                                        await showDatePicker(
                                                      context: context,
                                                      initialDate:
                                                          DateTime.now(),
                                                      currentDate:
                                                          DateTime.now(),
                                                      firstDate: DateTime(1900),
                                                      lastDate: DateTime.now(),
                                                      initialEntryMode:
                                                          DatePickerEntryMode
                                                              .calendar,
                                                      initialDatePickerMode:
                                                          DatePickerMode.year,
                                                      cancelText: 'İptal',
                                                      confirmText: 'Seç',
                                                      helpText:
                                                          'Doğum tarihini seçiniz.',
                                                    ).whenComplete(() {
                                                      // _nameSurnameFocusNode.requestFocus(false);
                                                      setState(() {});
                                                    });
                                                  },
                                                  child: Container(
                                                    width: getSize(context),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20,
                                                            vertical: 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Doğum Tarihi',
                                                              style:
                                                                  appTextStylePersonalInfoDropTitle,
                                                            ),
                                                            Text(
                                                              selectedBirthday ==
                                                                      null
                                                                  ? 'Doğum tarihini giriniz.'
                                                                  : '${selectedBirthday.day.toString()}.${selectedBirthday.month.toString()}.${selectedBirthday.year.toString()}',
                                                              style:
                                                                  appTextStylePersonalInfoDropContent,
                                                            ),
                                                          ],
                                                        ),
                                                        FaIcon(
                                                          FontAwesomeIcons
                                                              .chevronDown,
                                                          size: 20,
                                                          color: Colors.grey,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Divider(
                                                  color: Colors.black
                                                      .withOpacity(.5),
                                                  height: 1,
                                                ),
                                                CustomDropDown(
                                                  items: genderDropdownItems,
                                                  onChange: (value) {
                                                    setState(() {
                                                      genderValue = value;
                                                    });
                                                  },
                                                  child: Container(
                                                    width: getSize(context),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20,
                                                            vertical: 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Cinsiyet',
                                                              style:
                                                                  appTextStylePersonalInfoDropTitle,
                                                            ),
                                                            Text(
                                                              genderValue ==
                                                                      null
                                                                  ? 'Seçim yapınız.'
                                                                  : genderDropdownItems[
                                                                      genderValue],
                                                              style:
                                                                  appTextStylePersonalInfoDropContent,
                                                            ),
                                                          ],
                                                        ),
                                                        FaIcon(
                                                          FontAwesomeIcons
                                                              .chevronDown,
                                                          size: 20,
                                                          color: Colors.grey,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Divider(
                                                  color: Colors.black
                                                      .withOpacity(.5),
                                                  height: 1,
                                                ),
                                                CustomDropDown(
                                                  items:
                                                      workStatusDropDownItems,
                                                  onChange: (value) {
                                                    setState(() {
                                                      workStatusValue = value;
                                                    });
                                                  },
                                                  child: Container(
                                                    width: getSize(context),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20,
                                                            vertical: 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'İş Durumu',
                                                              style:
                                                                  appTextStylePersonalInfoDropTitle,
                                                            ),
                                                            Text(
                                                              workStatusValue ==
                                                                      null
                                                                  ? 'Seçim yapınız.'
                                                                  : workStatusDropDownItems[
                                                                      workStatusValue],
                                                              style:
                                                                  appTextStylePersonalInfoDropContent,
                                                            ),
                                                          ],
                                                        ),
                                                        FaIcon(
                                                          FontAwesomeIcons
                                                              .chevronDown,
                                                          size: 20,
                                                          color: Colors.grey,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Divider(
                                                  color: Colors.black
                                                      .withOpacity(.5),
                                                  height: 1,
                                                ),
                                                CustomDropDown(
                                                  items:
                                                      relationshipStatusDropdownItems,
                                                  onChange: (value) {
                                                    setState(() {
                                                      relationshipStatusValue =
                                                          value;
                                                    });
                                                  },
                                                  child: Container(
                                                    width: getSize(context),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20,
                                                            vertical: 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'İlişkisi',
                                                              style:
                                                                  appTextStylePersonalInfoDropTitle,
                                                            ),
                                                            Text(
                                                              relationshipStatusValue ==
                                                                      null
                                                                  ? 'Seçim yapınız.'
                                                                  : relationshipStatusDropdownItems[
                                                                      relationshipStatusValue],
                                                              style:
                                                                  appTextStylePersonalInfoDropContent,
                                                            ),
                                                          ],
                                                        ),
                                                        FaIcon(
                                                          FontAwesomeIcons
                                                              .chevronDown,
                                                          size: 20,
                                                          color: Colors.grey,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Divider(
                                                  color: Colors.black
                                                      .withOpacity(.5),
                                                  height: 1,
                                                ),
                                                CustomDropDown(
                                                  items:
                                                      educationStatusDropdownItems,
                                                  onChange: (value) {
                                                    setState(() {
                                                      educationStatusValue =
                                                          value;
                                                    });
                                                  },
                                                  child: Container(
                                                    width: getSize(context),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20,
                                                            vertical: 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Eğitim Durumu',
                                                              style:
                                                                  appTextStylePersonalInfoDropTitle,
                                                            ),
                                                            Text(
                                                              educationStatusValue ==
                                                                      null
                                                                  ? 'Seçim yapınız.'
                                                                  : educationStatusDropdownItems[
                                                                      educationStatusValue],
                                                              style:
                                                                  appTextStylePersonalInfoDropContent,
                                                            ),
                                                          ],
                                                        ),
                                                        FaIcon(
                                                          FontAwesomeIcons
                                                              .chevronDown,
                                                          size: 20,
                                                          color: Colors.grey,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                //
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  CustomGlowButton(
                                    title: 'DEVAM',
                                    onPressed: () {
                                      if (checkAllValue()) {
                                        fortunaTellItemRouteProvider(
                                            context, widget.indexToPage);
                                      } else {
                                        _scaffoldKey.currentState
                                            .showSnackBar(SnackBar(
                                          content:
                                              Text('Doldurulmamış alanlar var'),
                                          backgroundColor: appColorPurple,
                                        ));
                                      }
                                    },
                                    gradientColorStart:
                                        appColorButtonBlueGradientStart,
                                    gradientColorEnd:
                                        appColorButtonBlueGradientEnd,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
