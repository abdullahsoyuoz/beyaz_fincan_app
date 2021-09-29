import 'dart:ui';

import 'package:beyaz_fincan_app/Widget/CustomAppBar.dart';
import 'package:beyaz_fincan_app/Widget/CustomAppTitleBar.dart';
import 'package:beyaz_fincan_app/Widget/CustomDrawer.dart';
import 'package:beyaz_fincan_app/Widget/FortuneTellerItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:beyaz_fincan_app/Utility/AppDecorations.dart';
import 'package:beyaz_fincan_app/Test/testData.dart';

class ChooseFortuneTellerPage extends StatefulWidget {
  int indexToPage;
  ChooseFortuneTellerPage(this.indexToPage, {Key key}) : super(key: key);

  @override
  _ChooseFortuneTellerPageState createState() =>
      _ChooseFortuneTellerPageState();
}

class _ChooseFortuneTellerPageState extends State<ChooseFortuneTellerPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

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
              CustomAppTitleBar('FALCI SEÇİMİ'),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 10),
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: fakeFTellerList.length,
                  itemBuilder: (context, index) {
                    var item = fakeFTellerList[index];
                    return FTellerItem(item, widget.indexToPage);
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
