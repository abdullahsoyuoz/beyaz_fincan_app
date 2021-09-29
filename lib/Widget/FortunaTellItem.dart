import 'package:beyaz_fincan_app/Model/FortuneTellerEntity.dart';
import 'package:beyaz_fincan_app/Utility/AppColors.dart';
import 'package:beyaz_fincan_app/Utility/AppRouteProviders.dart';
import 'package:beyaz_fincan_app/Utility/AppUtility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FortuneTellItem extends StatefulWidget {
  FortuneTellEntity item;
  FortuneTellItem(this.item, {Key key}) : super(key: key);

  @override
  _FortuneTellItemState createState() => _FortuneTellItemState();
}

class _FortuneTellItemState extends State<FortuneTellItem> {
  bool onTap = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          onTap = !onTap;
          Future.delayed(Duration(milliseconds: 50), () {}).whenComplete(() {
            // TODO: itemWidget route fix
            homePageRouteProvider(context, widget.item.id).whenComplete(() {
              setState(() {
                onTap = !onTap;
              });
            });
          });
        });
      },
      child: Column(
        children: [
          Container(
            width: getSize(context) * .41,
            height: getSize(context) * .41,
            decoration: BoxDecoration(
              backgroundBlendMode: BlendMode.multiply,
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    appColorHomeItemGradientStart,
                    appColorHomeItemGradientEnd,
                  ]),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 50),
                width: getSize(context) * .39,
                height: getSize(context) * .39,
                decoration: onTap
                    ? BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: onTap
                                ? [
                                    appColorFTitemOnTapGradientStart,
                                    appColorFTitemOnTapGradientEnd,
                                  ]
                                : [
                                    appColorHomeItemGradientStart,
                                    appColorHomeItemGradientEnd,
                                  ]),
                        shape: BoxShape.circle,
                      )
                    : BoxDecoration(
                        backgroundBlendMode: BlendMode.multiply,
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: onTap
                                ? [
                                    appColorFTitemOnTapGradientStart,
                                    appColorFTitemOnTapGradientEnd,
                                  ]
                                : [
                                    appColorHomeItemGradientStart,
                                    appColorHomeItemGradientEnd,
                                  ]),
                        shape: BoxShape.circle,
                      ),
                child: widget.item.iconPath != null
                    ? Center(
                        child: Image.asset(
                          widget.item.iconPath,
                          width: getSize(context) * .30,
                          height: getSize(context) * .30,
                        ),
                      )
                    : SizedBox(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              '${widget.item.title}',
              style: TextStyle(
                color: Colors.white.withOpacity(.75),
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          )
        ],
      ),
    );
  }
}