import 'package:beyaz_fincan_app/Widget/CustomAppBar.dart';
import 'package:beyaz_fincan_app/Widget/CustomAppTitleBar.dart';
import 'package:beyaz_fincan_app/Widget/CustomDrawer.dart';
import 'package:beyaz_fincan_app/Widget/CustomDropDown.dart';
import 'package:beyaz_fincan_app/Widget/CustomGlowButton.dart';
import 'package:flutter/material.dart';

import 'dart:ui';

import 'package:beyaz_fincan_app/Utility/AppDecorations.dart';
import 'package:beyaz_fincan_app/Test/testData.dart';
import 'package:beyaz_fincan_app/Utility/AppColors.dart';
import 'package:beyaz_fincan_app/Utility/AppCostant.dart';
import 'package:beyaz_fincan_app/Utility/AppUtility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FTYuzDetailPage extends StatefulWidget {
  const FTYuzDetailPage({Key key}) : super(key: key);

  @override
  _FTYuzDetailPageState createState() => _FTYuzDetailPageState();
}

class _FTYuzDetailPageState extends State<FTYuzDetailPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  int dropDownValue = 0;
  // MediaQuery.of(context).padding.top * 2.5 + 79 + 55, // 79:appBar, 55: contentTitle

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: CustomDrawer(faeLoginUser),
        body: Container(
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
              CustomAppTitleBar('YÜZ FALI'),
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
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(40))),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 25.0),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 25.0),
                                      child: Text(
                                        'İstek Türü',
                                        style:
                                            appTextStyleDetailContentContainerTitle,
                                      ),
                                    ),
                                    CustomDropDown(
                                      items: requestTypeDropdownItems,
                                      child: Container(
                                        height: 40,
                                        child: Stack(
                                          children: [
                                            Center(
                                              child: Text(
                                                requestTypeDropdownItems[
                                                    dropDownValue],
                                                style:
                                                    appTextStyleDropdownStyle,
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 15.0),
                                                child: FaIcon(
                                                  FontAwesomeIcons.chevronDown,
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
                                          dropDownValue = value;
                                        });
                                      },
                                    ),
                                    Container(
                                        width: getSize(context),
                                        margin: EdgeInsets.only(top: 25),
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                              color: appColorPurple,
                                              width: 1,
                                            )),
                                        child: Column(
                                          children: [
                                            InkWell(
                                              onTap: () {},
                                              child: Container(
                                                width: 100,
                                                height: 100,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(10),
                                                    border: Border.all(
                                                      color: appColorPurple,
                                                      width: 1,
                                                    )),
                                                child: Center(
                                                  child: Icon(
                                                    FontAwesomeIcons.image,
                                                    color: appColorPurple,
                                                    size: 50,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 8.0),
                                              child: Text('YÜZ FOTOĞRAFI',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                            )
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 25.0),
                                child: CustomGlowButton(
                                  title: 'GÖNDER',
                                  onPressed: () {},
                                  width: getSize(context),
                                  gradientColorStart:
                                      appColorButtonOrangeGradientStart,
                                  gradientColorEnd: appColorButtonOrangeGradientEnd,
                                ),
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
        ));
  }
}
