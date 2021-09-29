import 'dart:ui';

import 'package:beyaz_fincan_app/Model/UserEntity.dart';
import 'package:beyaz_fincan_app/Test/testData.dart';
import 'package:beyaz_fincan_app/Utility/AppColors.dart';
import 'package:beyaz_fincan_app/Utility/AppDecorations.dart';
import 'package:beyaz_fincan_app/Utility/AppUtility.dart';
import 'package:beyaz_fincan_app/Widget/CustomAppBar.dart';
import 'package:beyaz_fincan_app/Widget/CustomAppTitleBar.dart';
import 'package:beyaz_fincan_app/Widget/CustomDrawer.dart';
import 'package:beyaz_fincan_app/Widget/CustomGlowButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  bool settingsOption1 = false;
  bool settingsOption2 = false;

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
              CustomAppTitleBar('AYARLAR'),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ayar 1',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                ),
                              ),
                              Text(
                                'Ayar açıklaması',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        CupertinoSwitch(
                          value: settingsOption1,
                          activeColor: appColorPink,
                          onChanged: (value) {
                            setState(() {
                              settingsOption1 = value;
                            });
                          },
                        )
                      ],
                    ),
                    Divider(
                      color: appColorPink,
                      height: 40,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ayar 2',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                ),
                              ),
                              Text(
                                'Ayar açıklaması',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        CupertinoSwitch(
                          value: settingsOption2,
                          activeColor: appColorPink,
                          onChanged: (value) {
                            setState(() {
                              settingsOption2 = value;
                            });
                          },
                        )
                      ],
                    ),
                    Divider(
                      color: appColorPink,
                      height: 40,
                    ),
                    buildPromotionItem(faeLoginUser)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: CustomGlowButton(
                  title: 'KAYDET',
                  onPressed: () {},
                  gradientColorStart: appColorButtonOrangeGradientStart,
                  gradientColorEnd: appColorButtonOrangeGradientEnd,
                ),
              )
            ],
          ),
        ));
  }

  Widget buildPromotionItem(UserEntity user) {
    return Container(
      width: getSize(context),
      height: 60,
      margin: EdgeInsets.only(
        top: 20,
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
                  'Promosyon kodu öncelikli kullanıcı',
                  style: appTextStylePersonalInfoDropTitle,
                ),
                Text(
                  'A78FFADS7242',
                  style: appTextStylePersonalInfoDropContent,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
