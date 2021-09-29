import 'package:beyaz_fincan_app/Model/HoroscopeEntity.dart';
import 'package:beyaz_fincan_app/Widget/CustomAppBar.dart';
import 'package:beyaz_fincan_app/Widget/CustomAppTitleBar.dart';
import 'package:beyaz_fincan_app/Widget/CustomDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:ui';

import 'package:beyaz_fincan_app/Utility/AppDecorations.dart';
import 'package:beyaz_fincan_app/Test/testData.dart';
import 'package:beyaz_fincan_app/Utility/AppColors.dart';
import 'package:beyaz_fincan_app/Utility/AppCostant.dart';
import 'package:beyaz_fincan_app/Utility/AppUtility.dart';
import 'package:rubber/rubber.dart';

class FTBurclarDetailPage extends StatefulWidget {
  const FTBurclarDetailPage({Key key}) : super(key: key);

  @override
  _FTBurclarDetailPageState createState() => _FTBurclarDetailPageState();
}

class _FTBurclarDetailPageState extends State<FTBurclarDetailPage>
    with SingleTickerProviderStateMixin {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  // MediaQuery.of(context).padding.top * 2.5 + 79 + 55, // 79:appBar, 55: contentTitle

  RubberAnimationController _ruberController;
  ScrollController _scrollController;
  double ruberInitialHeightValue = 0;
  double ruberMaxHeightValue = 0.9;
  double ruberStandartHeightValue = 0.4;
  double ruberCurrentValue = 0;

  HoroscopeEntity currentEntity = horoscopeList[0];
  bool onTap = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _ruberController = RubberAnimationController(
        vsync: this,
        dismissable: true,
        duration: Duration(milliseconds: 200),
        upperBoundValue: AnimationControllerValue(percentage: 0.5),
        initialValue: ruberInitialHeightValue);
    _ruberController.addListener(() {
      ruberCurrentValue = _ruberController.value;
      if (_ruberController.value == 0 &&
          _ruberController.status == AnimationStatus.completed) {
        setState(() {
          horoscopeList[currentEntity.id].onTap = false;
          onTap = false;
        });
      }
      if (_ruberController.value > 0) {
        setState(() {
          onTap = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: CustomDrawer(faeLoginUser),
        body: RubberBottomSheet(
          animationController: _ruberController,
          scrollController: _scrollController,
          headerHeight: 0,
          upperLayer: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 3,
              sigmaY: 3,
            ),
            child: WillPopScope(
              child: buildBottomSheet(currentEntity),
              onWillPop: () async {
                if (onTap) {
                  _ruberController.fling(
                      ruberCurrentValue, ruberInitialHeightValue);
                  return false;
                } else
                  return true;
              },
            ),
          ),
          lowerLayer: AbsorbPointer(
            absorbing: onTap,
            child: Container(
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
                  CustomAppTitleBar('BURÇLAR'),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1,
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      padding: EdgeInsets.only(
                        top: 10,
                        bottom: 50,
                        left: 20,
                        right: 20,
                      ),
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: horoscopeList.length,
                      itemBuilder: (context, index) {
                        final item = horoscopeList[index];
                        return InkWell(
                          onTap: () {
                            setState(() {
                              currentEntity = item;
                              item.onTap = true;
                              _ruberController.fling(
                                  ruberCurrentValue, ruberStandartHeightValue);
                            });
                          },
                          child: HoroscopeItem(item),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  buildBottomSheet(HoroscopeEntity item) {
    return Stack(
      children: [
        SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Container(
              width: getSize(context),
              height: MediaQuery.of(context).size.height * 2,
              padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
              ),
              decoration: BoxDecoration(
                color: appColorBackgroundPurple,
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 90,
                          height: 90,
                          margin: EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(.2),
                                offset: Offset(0, 3),
                                blurRadius: 6,
                              )
                            ],
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
                          child: Center(
                              child: Image.asset(
                            item.iconPath,
                            width: 60,
                            height: 60,
                          )),
                        ),
                        Expanded(
                          child: Table(
                            defaultVerticalAlignment:
                                TableCellVerticalAlignment.top,
                            children: [
                              TableRow(children: [
                                TableCell(
                                    child: Text(item.title,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ))),
                                TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Text(item.day,
                                        style: TextStyle(
                                          color: appColorTextPurple,
                                          fontSize: 12,
                                        ))),
                              ]),
                              TableRow(children: [
                                TableCell(
                                    child: Text('',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ))),
                                TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Text('',
                                        style: TextStyle(
                                          color: appColorTextPurple,
                                          fontSize: 12,
                                        ))),
                              ]),
                              TableRow(children: [
                                TableCell(
                                    child: Text('Elementi: ',
                                        style: TextStyle(
                                          color: appColorTextPurple,
                                          fontSize: 12,
                                        ))),
                                TableCell(
                                    child: Text(item.element,
                                        style: TextStyle(
                                          color: appColorTextPurpleLite,
                                          fontSize: 12,
                                        ))),
                              ]),
                              TableRow(children: [
                                TableCell(
                                    child: Text('Yönetici Gezegen',
                                        style: TextStyle(
                                          color: appColorTextPurple,
                                          fontSize: 12,
                                        ))),
                                TableCell(
                                    child: Text(item.planet,
                                        style: TextStyle(
                                          color: appColorTextPurpleLite,
                                          fontSize: 12,
                                        ))),
                              ]),
                              TableRow(children: [
                                TableCell(
                                    child: Text('Mottosu',
                                        style: TextStyle(
                                          color: appColorTextPurple,
                                          fontSize: 12,
                                        ))),
                                TableCell(
                                    child: Text(item.motto,
                                        maxLines: 3,
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: appColorTextPurpleLite,
                                          fontSize: 12,
                                        ))),
                              ]),
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: Text(
                        '${item.description}',
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 3,
            width: 100,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                  appColorButtonOrangeGradientStart,
                  appColorButtonOrangeGradientEnd,
                ])),
          ),
        )
      ],
    );
  }
}

class HoroscopeItem extends StatefulWidget {
  HoroscopeEntity item;
  HoroscopeItem(this.item, {Key key}) : super(key: key);

  @override
  HoroscopeItemState createState() => HoroscopeItemState();
}

class HoroscopeItemState extends State<HoroscopeItem> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      width: getSize(context) * .39,
      height: getSize(context) * .39,
      decoration: widget.item.onTap
          ? BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.2),
                  offset: Offset(0, 3),
                  blurRadius: 6,
                )
              ],
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: widget.item.onTap
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
                  colors: widget.item.onTap
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
                color: widget.item.onTap ? Colors.black : Colors.white,
                width: getSize(context) * .20,
                height: getSize(context) * .20,
              ),
            )
          : SizedBox(),
    );
  }

  // buildBottomSheet() {
  //   return Container(
  //       width: getSize(context),
  //       height: 270,
  //       decoration: BoxDecoration(
  //         color: appColorBackgroundPurple,
  //         borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
  //       ),
  //       child: ClipRRect(
  //         borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
  //         child: SingleChildScrollView(
  //           padding: EdgeInsets.only(
  //             top: 15,
  //             bottom: 20,
  //             left: 15,
  //             right: 15,
  //           ),
  //           child: Column(
  //             children: [
  //               Row(
  //                 children: [
  //                   Container(
  //                     width: 90,
  //                     height: 90,
  //                     decoration: BoxDecoration(
  //                       boxShadow: [
  //                         BoxShadow(
  //                           color: Colors.black.withOpacity(.2),
  //                           offset: Offset(0, 3),
  //                           blurRadius: 6,
  //                         )
  //                       ],
  //                       gradient: LinearGradient(
  //                           begin: Alignment.topLeft,
  //                           end: Alignment.bottomRight,
  //                           colors: onTap
  //                               ? [
  //                                   appColorFTitemOnTapGradientStart,
  //                                   appColorFTitemOnTapGradientEnd,
  //                                 ]
  //                               : [
  //                                   appColorHomeItemGradientStart,
  //                                   appColorHomeItemGradientEnd,
  //                                 ]),
  //                       shape: BoxShape.circle,
  //                     ),
  //                     child: Center(
  //                         child: Image.asset(
  //                       widget.item.iconPath,
  //                       width: 60,
  //                       height: 60,
  //                     )),
  //                   ),
  //                   Expanded(
  //                     child: Center(
  //                       child: Text('FIXME',
  //                           style: TextStyle(color: Colors.white)),
  //                     ),
  //                   )
  //                 ],
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.only(top: 25.0),
  //                 child: Text(
  //                   '${widget.item.description} ${widget.item.description} ${widget.item.description}',
  //                   overflow: TextOverflow.visible,
  //                   style: TextStyle(
  //                     color: Colors.white,
  //                     fontSize: 12,
  //                   ),
  //                 ),
  //               )
  //             ],
  //           ),
  //         ),
  //       ));
  // }
}
