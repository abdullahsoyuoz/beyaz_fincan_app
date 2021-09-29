import 'package:beyaz_fincan_app/Model/CreditPackageEntity.dart';
import 'package:beyaz_fincan_app/Utility/AppAssetPaths.dart';
import 'package:beyaz_fincan_app/Utility/AppColors.dart';
import 'package:beyaz_fincan_app/Utility/AppUtility.dart';
import 'package:beyaz_fincan_app/Widget/ProgressDialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreditBuyItem extends StatefulWidget {
  CreditPkgEntity item;
  CreditBuyItem(this.item, {Key key}) : super(key: key);

  @override
  _CreditBuyItemState createState() => _CreditBuyItemState();
}

class _CreditBuyItemState extends State<CreditBuyItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                appColorCreditBackgroundGradientStart,
                appColorCreditBackgroundGradientEnd,
              ]),
          borderRadius: BorderRadius.circular(15)),
      padding: EdgeInsets.only(
        top: 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Image.asset(
                widget.item.iconPath,
                width: 55,
                height: 55,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: Column(
                  children: [
                    Text(
                      '${widget.item.title.toUpperCase()}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'PAKET',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Column(
              children: [
                Image.asset(
                  appAssetsPathCurrency,
                  width: 20,
                  height: 20,
                ),
                Text(
                  'KREDİ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w300),
                ),
                Text(
                  '${widget.item.credit}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          InkWell(
            highlightColor: Colors.red,
            onTap: () async {
              showDialog(
                context: context,
                child: ProgressDialog()
              );
            },
            child: Container(
              width: getSize(context),
              height: 37,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        appColorCreditApplyButtonGradientStart,
                        appColorCreditApplyButtonGradientEnd,
                      ])),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(FontAwesomeIcons.liraSign, size: 14,),
                    Text(
                      '${widget.item.fee}',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
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
