import 'package:beyaz_fincan_app/Model/FTellerRequestEntity.dart';
import 'package:beyaz_fincan_app/Pages/Detail/FTRequestDetailPage.dart';
import 'package:beyaz_fincan_app/Utility/AppAssetPaths.dart';
import 'package:beyaz_fincan_app/Utility/AppColors.dart';
import 'package:beyaz_fincan_app/Utility/AppUtility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FTellerRequestItem extends StatefulWidget {
  FTellerRequestEntity item;
  FTellerRequestItem(this.item, {Key key}) : super(key: key);

  @override
  _FTellerRequestItemState createState() => _FTellerRequestItemState();
}

class _FTellerRequestItemState extends State<FTellerRequestItem> {
  SlidableController _slidableController = SlidableController();
  double height = 85;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, CupertinoPageRoute(builder: (context) => FTRequestDetailPage(),));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Slidable(
          actionPane: SlidableDrawerActionPane(),
          actions: [
            InkWell(
              onTap: () {},
              child: Container(
                width: height,
                height: height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        appColorButtonOrangeGradientStart,
                        appColorButtonOrangeGradientEnd,
                      ]),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      appAssetsPathTrash,
                      height: height * 0.5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        'GEREKSİZ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          direction: Axis.horizontal,
          movementDuration: Duration(milliseconds: 500),
          controller: _slidableController,
          child: Container(
            height: height,
            width: getSize(context),
            decoration: BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromARGB(255, 65, 2, 121),
                      Color.fromARGB(255, 161, 70, 244).withOpacity(0.2),
                    ])),
            padding: EdgeInsets.only(
              left: 25,
              top: 2,
              bottom: 2,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          NetworkImage(widget.item.fortunaTeller.photoUrl),
                      radius: height / 2 - 4, // -4 ; from padding
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${widget.item.fortunaTeller.name}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              letterSpacing: 0.5,
                            ),
                          ),
                          Text(
                            '${getDateToString(widget.item.requestDate)}',
                            style: TextStyle(
                              color: Color.fromARGB(255, 178, 255, 5),
                              fontSize: 11,
                              letterSpacing: 0.5,
                            ),
                          ),
                          Text(
                            '${widget.item.status}',
                            style: TextStyle(
                              color: Colors.white.withOpacity(.5),
                              fontSize: 11,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 80,
                    height: 30,
                    margin: EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 252, 58, 123),
                        borderRadius:
                            BorderRadius.horizontal(left: Radius.circular(20))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 21,
                          child: Center(
                            child: Image.asset(
                              appAssetsPathCurrency,
                              height: 18,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            height: 21,
                            child: Center(
                              child: Text(
                                '${widget.item.fee}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
