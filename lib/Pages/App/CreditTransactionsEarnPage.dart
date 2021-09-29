import 'package:beyaz_fincan_app/Widget/CreditEarnItem.dart';
import 'package:beyaz_fincan_app/Widget/CreditIBuytem.dart';
import 'package:beyaz_fincan_app/Widget/CustomAppBar.dart';
import 'package:beyaz_fincan_app/Widget/CustomAppTitleBar.dart';
import 'package:beyaz_fincan_app/Widget/CustomDrawer.dart';
import 'package:flutter/material.dart';

import 'dart:ui';
import 'package:beyaz_fincan_app/Test/testData.dart';
import 'package:beyaz_fincan_app/Utility/AppDecorations.dart';

class CreditTransactionsEarnPage extends StatefulWidget {
  const CreditTransactionsEarnPage({Key key}) : super(key: key);

  @override
  _CreditTransactionsEarnPageState createState() =>
      _CreditTransactionsEarnPageState();
}

class _CreditTransactionsEarnPageState
    extends State<CreditTransactionsEarnPage> {
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
          child: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: [
              ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: CustomAppBar(faeLoginUser, _scaffoldKey),
                ),
              ),
              CustomAppTitleBar('KREDİ KAZAN'),
              Padding(
                padding: const EdgeInsets.only(
                  top: 25.0,
                  bottom: 15,
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: creditEarnOptionList.length,
                  itemBuilder: (context, index) {
                    final item = creditEarnOptionList[index];
                    return CreditEarnItem(item);
                  },
                ),
              ),
              CustomAppTitleBar('KREDİ PAKETLERİ'),
              GridView.builder(
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
                physics: NeverScrollableScrollPhysics(),
                itemCount: creditPkgList.length,
                itemBuilder: (context, index) {
                  final item = creditPkgList[index];
                  return CreditBuyItem(item);
                },
              ),
            ],
          ),
        ));
  }
}
