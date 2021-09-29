import 'package:beyaz_fincan_app/Model/UserEntity.dart';
import 'package:beyaz_fincan_app/Test/testData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:ui';

import 'package:beyaz_fincan_app/Utility/AppAssetPaths.dart';
import 'package:beyaz_fincan_app/Utility/AppColors.dart';
import 'package:beyaz_fincan_app/Utility/AppCostant.dart';
import 'package:beyaz_fincan_app/Utility/AppDecorations.dart';
import 'package:beyaz_fincan_app/Utility/AppUtility.dart';
import 'package:beyaz_fincan_app/Utility/AppRouteProviders.dart';

import 'package:beyaz_fincan_app/Model/FortuneTellerEntity.dart';
import 'package:beyaz_fincan_app/Model/TransactionEntityies.dart';

import 'package:beyaz_fincan_app/Pages/App/ChooseFortuneTellerPage.dart';
import 'package:beyaz_fincan_app/Widget/MyFortuneTellWidget.dart';

class CustomDrawer extends StatefulWidget {
  UserEntity user;
  CustomDrawer(this.user, {Key key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
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
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top * 2,
                  bottom: MediaQuery.of(context).padding.top * 2,
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    NetworkImage('${widget.user.photoUrl}'),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${widget.user.name}',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          right: 3.0,
                                        ),
                                        child: Image.asset(appAssetsPathRate),
                                      ),
                                      Text(
                                        '${widget.user.point}',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                )
                              ],
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
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                    ),
                    child: Text(
                      'FALLAR',
                      style: appTextStyleDrawerTitleStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: getSize(context) * 0.8,
                        margin: EdgeInsets.only(
                          top: getSize(context) * 0.005,
                          bottom: getSize(context) * 0.005,
                          left: getSize(context) * 0.005,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(8),
                          ),
                        ),
                        child: ListView.separated(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          separatorBuilder: (context, index) => Divider(
                            height: 0,
                            thickness: 1,
                          ),
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: fortuneTellItemList.length,
                          itemBuilder: (context, index) {
                            final item = fortuneTellItemList[index];
                            return DrawerItem(item, index);
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                          width: getSize(context) * 0.8,
                          margin: EdgeInsets.only(
                            top: getSize(context) * 0.005,
                            bottom: getSize(context) * 0.005,
                            left: getSize(context) * 0.005,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(8),
                            ),
                          ),
                          child: MyFortuneTell()),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15,
                      left: 20,
                    ),
                    child: Text(
                      'KREDİ İŞLEMLERİ',
                      style: appTextStyleDrawerTitleStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: getSize(context) * 0.8,
                        margin: EdgeInsets.only(
                          top: getSize(context) * 0.005,
                          bottom: getSize(context) * 0.005,
                          left: getSize(context) * 0.005,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(8),
                          ),
                        ),
                        child: ListView.separated(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          separatorBuilder: (context, index) => Divider(
                            height: 0,
                            thickness: 1,
                          ),
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: creditTList.length,
                          itemBuilder: (context, index) {
                            final item = creditTList[index];
                            return DrawerItem(item, index);
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15,
                      left: 20,
                    ),
                    child: Text(
                      'DİĞER İŞLEMLER',
                      style: appTextStyleDrawerTitleStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: getSize(context) * 0.8,
                        margin: EdgeInsets.only(
                          top: getSize(context) * 0.005,
                          bottom: getSize(context) * 0.005,
                          left: getSize(context) * 0.005,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(8),
                          ),
                        ),
                        child: ListView.separated(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          separatorBuilder: (context, index) => Divider(
                            height: 0,
                            thickness: 1,
                          ),
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: otherTList.length,
                          itemBuilder: (context, index) {
                            final item = otherTList[index];
                            return DrawerItem(item, index);
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15,
                      left: 20,
                    ),
                    child: Text(
                      'BEYAZ FİNCAN',
                      style: appTextStyleDrawerTitleStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: getSize(context) * 0.8,
                        margin: EdgeInsets.only(
                          top: getSize(context) * 0.005,
                          bottom: getSize(context) * 0.005,
                          left: getSize(context) * 0.005,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(8),
                          ),
                        ),
                        child: ListView.separated(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          separatorBuilder: (context, index) => Divider(
                            height: 0,
                            thickness: 1,
                          ),
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: appTList.length,
                          itemBuilder: (context, index) {
                            final item = appTList[index];
                            return DrawerItem(item, index);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DrawerItem extends StatefulWidget {
  var item;
  int index;
  DrawerItem(this.item, this.index, {Key key}) : super(key: key);

  @override
  _DrawerItemState createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {
  bool onTap = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          onTap = !onTap;
        });
        Future.delayed(Duration(milliseconds: 50), () {}).whenComplete(() {
          if (widget.item is FortuneTellEntity) {
            homePageRouteProvider(context, widget.index).whenComplete(() {
              // Navigator.pop(context);
              setState(() {
                onTap = !onTap;
              });
            });
          }
          if (widget.item is CreditTransactionsEntity) {
            return creditTItemRouteProvider(context, widget.item.id)
                .whenComplete(() {
              // Navigator.pop(context);
              setState(() {
                onTap = !onTap;
              });
            });
          }
          if (widget.item is OtherTransactionsEntity) {
            return otherTItemRouteProvider(context, widget.item.id, faeLoginUser)
                .whenComplete(() {
              // Navigator.pop(context);
              setState(() {
                onTap = !onTap;
              });
            });
          }
          if (widget.item is AppTransactionsEntity) {
            return appTItemRouteProvider(context, widget.item.id)
                .whenComplete(() {
              // Navigator.pop(context);
              setState(() {
                onTap = !onTap;
              });
            });
          }
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        height: 45,
        width: getSize(context),
        decoration: BoxDecoration(
            color: onTap ? Colors.white : Colors.white,
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: onTap
                    ? [
                        appColorDrawerItemGradientStart,
                        appColorDrawerItemGradientEnd,
                      ]
                    : [
                        Colors.transparent,
                        Colors.transparent,
                      ]),
            borderRadius: widget.index == 0
                ? BorderRadius.only(topLeft: Radius.circular(8))
                : widget.index == fortuneTellItemList.length
                    ? BorderRadius.only(bottomLeft: Radius.circular(8))
                    : BorderRadius.all(Radius.circular(0))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedDefaultTextStyle(
                child: Text('${widget.item.title}'),
                duration: Duration(milliseconds: 100),
                style: onTap
                    ? appTextStyleDrawerItemStyle.copyWith(color: Colors.white)
                    : appTextStyleDrawerItemStyle,
              ),
              CircleAvatar(
                radius: 11,
                backgroundColor: appColorGrey.withOpacity(.3),
                child: Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: onTap ? Colors.white : appColorGrey,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
