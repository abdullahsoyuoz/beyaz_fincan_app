import 'dart:ui';

import 'package:beyaz_fincan_app/Test/testData.dart';
import 'package:beyaz_fincan_app/Utility/AppCostant.dart';
import 'package:beyaz_fincan_app/Utility/AppDecorations.dart';
import 'package:beyaz_fincan_app/Utility/AppUtility.dart';
import 'package:beyaz_fincan_app/Widget/CustomAppBar.dart';
import 'package:beyaz_fincan_app/Widget/CustomAppTitleBar.dart';
import 'package:beyaz_fincan_app/Widget/CustomDrawer.dart';
import 'package:beyaz_fincan_app/Widget/FTellerRequestItem.dart';
import 'package:beyaz_fincan_app/Widget/RequestMenuItem.dart';
import 'package:flutter/material.dart';

class MyFTDetailPage extends StatefulWidget {
  const MyFTDetailPage({Key key}) : super(key: key);

  @override
  _MyFTDetailPageState createState() => _MyFTDetailPageState();
}

class _MyFTDetailPageState extends State<MyFTDetailPage> {
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
              CustomAppTitleBar('İSTEKLERİM'),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 50,
                    // left: 20,
                    // right: 20,
                  ),
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: fTellerRequestList.length,
                  itemBuilder: (context, index) {
                    final item = fTellerRequestList[index];
                    return FTellerRequestItem(item);
                  },
                ),
              ),
              Container(
                width: getSize(context),
                height: 48,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: requestMenuItemList.length,
                  itemBuilder: (context, index) {
                    var item = requestMenuItemList[index];
                    return RequestMenuItem(item);
                  },
                ),
              )
            ],
          ),
        ));
  }
}
