import 'package:beyaz_fincan_app/Widget/CustomAppBar.dart';
import 'package:beyaz_fincan_app/Widget/CustomAppTitleBar.dart';
import 'package:beyaz_fincan_app/Widget/CustomDrawer.dart';
import 'package:beyaz_fincan_app/Widget/CustomGlowButton.dart';
import 'package:flutter/material.dart';

import 'dart:ui';

import 'package:beyaz_fincan_app/Utility/AppDecorations.dart';
import 'package:beyaz_fincan_app/Test/testData.dart';
import 'package:beyaz_fincan_app/Utility/AppColors.dart';
import 'package:beyaz_fincan_app/Utility/AppUtility.dart';


class FTRuyaYorumDetailPage extends StatefulWidget {
  const FTRuyaYorumDetailPage({Key key}) : super(key: key);

  @override
  _FTRuyaYorumDetailPageState createState() => _FTRuyaYorumDetailPageState();
}

class _FTRuyaYorumDetailPageState extends State<FTRuyaYorumDetailPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  TextEditingController _dreamContentController = TextEditingController();
  FocusNode _dreamFocusNode = FocusNode();

  // MediaQuery.of(context).padding.top * 2.5 + 79 + 55, // 79:appBar, 55: contentTitle

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
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
              CustomAppTitleBar('RÜYA TABİRİ'),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 12,
                  ),
                  child: Container(
                    width: getSize(context),
                    decoration: BoxDecoration(
                        color: appColorBgDarkPurple,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(40))),
                    padding: EdgeInsets.only(
                      top: 25,
                      bottom: 40,
                      left: 20,
                      right: 20,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 25.0),
                          child: Text(
                            'Gördüğünüz Rüya',
                            style: appTextStyleDetailContentContainerTitle,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: getSize(context),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextFormField(
                                maxLines: 20,
                                controller: _dreamContentController,
                                focusNode: _dreamFocusNode,
                                onTap: () => _dreamFocusNode.canRequestFocus,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 162, 162, 162),
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
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
                  ),
                ),
              )
            ],
          ),
        ));
  }

}
