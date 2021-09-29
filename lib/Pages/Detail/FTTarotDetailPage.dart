import 'package:beyaz_fincan_app/Widget/CustomAppBar.dart';
import 'package:beyaz_fincan_app/Widget/CustomAppTitleBar.dart';
import 'package:beyaz_fincan_app/Widget/CustomDrawer.dart';
import 'package:beyaz_fincan_app/Widget/CustomDropDown.dart';
import 'package:beyaz_fincan_app/Widget/CustomGlowButton.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import 'dart:ui';

import 'package:beyaz_fincan_app/Utility/AppDecorations.dart';
import 'package:beyaz_fincan_app/Test/testData.dart';
import 'package:beyaz_fincan_app/Utility/AppAssetPaths.dart';
import 'package:beyaz_fincan_app/Utility/AppColors.dart';
import 'package:beyaz_fincan_app/Utility/AppCostant.dart';
import 'package:beyaz_fincan_app/Utility/AppUtility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FTTarotDetailPage extends StatefulWidget {
  const FTTarotDetailPage({Key key}) : super(key: key);

  @override
  _FTTarotDetailPageState createState() => _FTTarotDetailPageState();
}

class _FTTarotDetailPageState extends State<FTTarotDetailPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  int dropDownValue = 0;
  // MediaQuery.of(context).padding.top * 2.5 + 79 + 55, // 79:appBar, 55: contentTitle

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: CustomDrawer(faeLoginUser),
        endDrawer: buildTarotCardsScreen(),
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
              CustomAppTitleBar('TAROT FALI'),
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
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: AspectRatio(
                                                    aspectRatio: 1,
                                                    child: InkWell(
                                                      onTap: () {},
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                border:
                                                                    Border.all(
                                                                  color:
                                                                      appColorPurple,
                                                                  width: 1,
                                                                )),
                                                        child: Center(
                                                          child: Icon(
                                                            FontAwesomeIcons
                                                                .image,
                                                            color:
                                                                appColorPurple,
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
                                                    child: InkWell(
                                                      onTap: () {},
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                border:
                                                                    Border.all(
                                                                  color:
                                                                      appColorPurple,
                                                                  width: 1,
                                                                )),
                                                        child: Center(
                                                          child: Icon(
                                                            FontAwesomeIcons
                                                                .image,
                                                            color:
                                                                appColorPurple,
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
                                                    child: InkWell(
                                                      onTap: () {},
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                border:
                                                                    Border.all(
                                                                  color:
                                                                      appColorPurple,
                                                                  width: 1,
                                                                )),
                                                        child: Center(
                                                          child: Icon(
                                                            FontAwesomeIcons
                                                                .image,
                                                            color:
                                                                appColorPurple,
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
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Expanded(
                                                    child: Text('GEÇMİŞ',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white)),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Expanded(
                                                    child: Text('ŞİMDİ',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white)),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Expanded(
                                                    child: Text('GELECEK',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white)),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  CustomGlowButton(
                                    title: 'KART SEÇ',
                                    onPressed: () {
                                      _scaffoldKey.currentState.openEndDrawer();
                                    },
                                    gradientColorStart:
                                        appColorButtonGreenGradientStart,
                                    gradientColorEnd:
                                        appColorButtonGreenGradientEnd,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: CustomGlowButton(
                                      title: 'RASTGELE SEÇ',
                                      onPressed: () {},
                                      gradientColorStart:
                                          appColorButtonBlueGradientStart,
                                      gradientColorEnd:
                                          appColorButtonBlueGradientEnd,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: CustomGlowButton(
                                      title: 'GÖNDER',
                                      onPressed: () {},
                                      gradientColorStart:
                                          appColorButtonOrangeGradientStart,
                                      gradientColorEnd:
                                          appColorButtonOrangeGradientEnd,
                                    ),
                                  ),
                                ],
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

  buildTarotCardsScreen() {
    return Container(
      width: getSize(context),
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: <Widget>[
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5,
              sigmaY: 5,
            ),
            child: Container(
              decoration:
                  BoxDecoration(color: appColorBgDarkPurple.withOpacity(.3)),
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top * 2,
                  bottom: MediaQuery.of(context).padding.top * 2,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'KARTLAR',
                                style: appTextStyleDrawerTitleStyle.copyWith(
                                    fontSize: 16, letterSpacing: 1),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 2.0),
                                child: RichText(
                                    text: TextSpan(
                                        text: 'Üç adet ',
                                        style: appTextStyleDrawerTitleStyle,
                                        children: [
                                      TextSpan(
                                        text: 'TAROT ',
                                        style: appTextStyleDrawerTitleStyle
                                            .copyWith(
                                                fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                        text: 'kartı seçiniz',
                                        style: appTextStyleDrawerTitleStyle,
                                      ),
                                    ])),
                              ),
                            ],
                          ),
                          IconButton(
                            padding: EdgeInsets.all(0),
                            icon: Container(
                              width: 37,
                              height: 37,
                              alignment: Alignment.center,
                              padding: EdgeInsets.zero,
                              decoration: BoxDecoration(
                                color: appColorYellow,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.clear_rounded,
                                color: Colors.black,
                                size: 25,
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      child: Divider(
                        color: appColorPink,
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          childAspectRatio: 79 / 117,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return TarotCardItem(index);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: CustomGlowButton(
                        title: 'KART SEÇ',
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        gradientColorStart: appColorButtonGreenGradientStart,
                        gradientColorEnd: appColorButtonGreenGradientEnd,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TarotCardItem extends StatefulWidget {
  int index;
  TarotCardItem(this.index, {Key key}) : super(key: key);

  @override
  _TarotCardItemState createState() => _TarotCardItemState();
}

class _TarotCardItemState extends State<TarotCardItem> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return FlipCard(
      front: Container(
          decoration: BoxDecoration(
            color: appColorTarotCardGradientFront,
          ),
          child: Image.asset(
            appAssetsPathCardPattern,
          )),
      back: Container(
        decoration: BoxDecoration(
          color: appColorTarotCardGradientBack,
        ),
        child: Image.asset(appAssetsPathCardPattern),
      ),
      direction: FlipDirection.HORIZONTAL,
      onFlipDone: (isFront) {
        selected = !isFront;
      },
      onFlip: () {},
      flipOnTouch: tarotCardFlipActive, // MAX 3 olunca false
    );
  }
}
