import 'dart:ui';

import 'package:beyaz_fincan_app/Test/testData.dart';
import 'package:beyaz_fincan_app/Utility/AppDecorations.dart';
import 'package:beyaz_fincan_app/Widget/CreditIBuytem.dart';
import 'package:beyaz_fincan_app/Widget/CustomAppBar.dart';
import 'package:beyaz_fincan_app/Widget/CustomAppTitleBar.dart';
import 'package:beyaz_fincan_app/Widget/CustomDrawer.dart';
import 'package:flutter/material.dart';

class CreditTransactionsBuyPage extends StatefulWidget {
  const CreditTransactionsBuyPage({Key key}) : super(key: key);

  @override
  _CreditTransactionsBuyPageState createState() =>
      _CreditTransactionsBuyPageState();
}

class _CreditTransactionsBuyPageState extends State<CreditTransactionsBuyPage> {
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
              CustomAppTitleBar('KREDİ PAKETLERİ'),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 10 / 24,
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 16,
                  ),
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 50,
                    left: 20,
                    right: 20,
                  ),
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: creditPkgList.length,
                  itemBuilder: (context, index) {
                    final item = creditPkgList[index];
                    return CreditBuyItem(item);
                  },
                ),
              ),
            ],
          ),
        ));
  }

}
