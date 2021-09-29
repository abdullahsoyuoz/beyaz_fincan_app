import 'dart:ui';

import 'package:beyaz_fincan_app/Test/testData.dart';
import 'package:beyaz_fincan_app/Utility/AppCostant.dart';
import 'package:beyaz_fincan_app/Utility/AppDecorations.dart';
import 'package:beyaz_fincan_app/Utility/AppUtility.dart';
import 'package:beyaz_fincan_app/Widget/CustomAppBar.dart';
import 'package:beyaz_fincan_app/Widget/CustomDrawer.dart';
import 'package:beyaz_fincan_app/Widget/FortunaTellItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(faeLoginUser),
      body: Container(
        width: getSize(context),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: appCrossGradientBackground,
        ),
        child: Stack(
          fit: StackFit.loose,
          children: [
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 17 / 20,
                crossAxisCount: 2,
                crossAxisSpacing: 0,
              ),
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top * 1.5 + 79,
                bottom: 200,
                left: 20,
                right: 20,
              ),
              physics: BouncingScrollPhysics(),
              itemCount: fortuneTellItemList.length,
              itemBuilder: (context, index) {
                final item = fortuneTellItemList[index];
                return FortuneTellItem(item);
              },
            ),
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: CustomAppBar(faeLoginUser, _scaffoldKey),
              ),
            )
          ],
        ),
      ),
    );
  }
}


