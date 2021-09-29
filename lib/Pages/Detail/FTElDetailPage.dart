import 'package:beyaz_fincan_app/Utility/AppDecorations.dart';
import 'package:beyaz_fincan_app/Widget/CustomAppBar.dart';
import 'package:beyaz_fincan_app/Widget/CustomAppTitleBar.dart';
import 'package:beyaz_fincan_app/Widget/CustomDrawer.dart';
import 'package:beyaz_fincan_app/Widget/CustomDropDown.dart';
import 'package:beyaz_fincan_app/Widget/CustomGlowButton.dart';
import 'package:flutter/material.dart';

import 'dart:ui';

import 'package:beyaz_fincan_app/Test/testData.dart';
import 'package:beyaz_fincan_app/Utility/AppAssetPaths.dart';
import 'package:beyaz_fincan_app/Utility/AppColors.dart';
import 'package:beyaz_fincan_app/Utility/AppCostant.dart';
import 'package:beyaz_fincan_app/Utility/AppUtility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FTElDetailPage extends StatefulWidget {
  const FTElDetailPage({Key key}) : super(key: key);

  @override
  _FTElDetailPageState createState() => _FTElDetailPageState();
}

class _FTElDetailPageState extends State<FTElDetailPage> {
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
              CustomAppTitleBar('EL FALI'),
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
                                      padding: const EdgeInsets.only(bottom: 25.0),
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
                                            borderRadius: BorderRadius.circular(20),
                                            border: Border.all(
                                              color: appColorPurple,
                                              width: 1,
                                            )),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: AspectRatio(
                                                    aspectRatio: 1,
                                                    child: InkWell(
                                                      onTap: () {},
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(10),
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
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  child: AspectRatio(
                                                      aspectRatio: 1,
                                                      child: Center(
                                                        child: Transform.scale(
                                                            scale: 0.9,
                                                            child: Image.asset(
                                                                appAssetsPathElFalScrIcon,
                                                                color:
                                                                    appColorPurple)),
                                                      )),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  child: AspectRatio(
                                                    aspectRatio: 1,
                                                    child: InkWell(
                                                      onTap: () {},
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(10),
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
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceAround,
                                                children: [
                                                  Expanded(
                                                    child: Text('SOL EL',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                            color: Colors.white)),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Expanded(
                                                    child: SizedBox(),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Expanded(
                                                    child: Text('SAĞ EL',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                            color: Colors.white)),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                              CustomGlowButton(
                                title: 'GÖNDER',
                                onPressed: () {},
                                gradientColorStart: appColorButtonOrangeGradientStart,
                                gradientColorEnd: appColorButtonOrangeGradientEnd,
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
