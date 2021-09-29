import 'dart:ui';

import 'package:beyaz_fincan_app/Test/testData.dart';
import 'package:beyaz_fincan_app/Utility/AppColors.dart';
import 'package:beyaz_fincan_app/Utility/AppConstantTexts.dart';
import 'package:beyaz_fincan_app/Utility/AppDecorations.dart';
import 'package:beyaz_fincan_app/Widget/CustomAppBar.dart';
import 'package:beyaz_fincan_app/Widget/CustomAppTitleBar.dart';
import 'package:beyaz_fincan_app/Widget/CustomDrawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key key}) : super(key: key);

  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  bool choicePrivacyValue = false;
  bool choicePersonalValue = false;
  bool choiceDataProcessValue = false;

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: CustomAppBar(faeLoginUser, _scaffoldKey),
                ),
              ),
              CustomAppTitleBar('HAKKIMIZDA'),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(bottom: 30),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 30,
                        ),
                        child: Text(
                          '$aboutUsContent\n\n$aboutUsContent2\n\n$aboutUsContent2\n\n$aboutUsContent2',
                          style: TextStyle(
                            color: Colors.white.withOpacity(.7),
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: CustomAppTitleBar('KVG ile ilgili belgeler'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                ChoiceChip(
                                  label: Icon(FontAwesomeIcons.shieldAlt),
                                  selected: choicePrivacyValue,
                                  selectedColor: appColorPink,
                                  backgroundColor: appColorPurple,
                                  onSelected: (value) {
                                    setState(() {
                                      choicePrivacyValue = value;
                                    });
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Text(
                                    'Gizlilik Politikamız',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                ChoiceChip(
                                  label: Icon(FontAwesomeIcons.userShield),
                                  selected: choicePersonalValue,
                                  selectedColor: appColorPink,
                                  backgroundColor: appColorPurple,
                                  onSelected: (value) {
                                    setState(() {
                                      choicePersonalValue = value;
                                    });
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Text(
                                    'Kişisel Veri Güvenliği',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                ChoiceChip(
                                  label: Icon(FontAwesomeIcons.database),
                                  selected: choiceDataProcessValue,
                                  selectedColor: appColorPink,
                                  backgroundColor: appColorPurple,
                                  onSelected: (value) {
                                    setState(() {
                                      choiceDataProcessValue = value;
                                    });
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Text(
                                    'Veri İşleme Politikamız',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
