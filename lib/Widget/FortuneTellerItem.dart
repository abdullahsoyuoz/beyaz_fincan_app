import 'package:beyaz_fincan_app/Model/UserEntity.dart';
import 'package:beyaz_fincan_app/Pages/App/ForWhomPage.dart';
import 'package:beyaz_fincan_app/Utility/AppAssetPaths.dart';
import 'package:beyaz_fincan_app/Utility/AppUtility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FTellerItem extends StatefulWidget {
  UserEntity item;
  int indexToPage;
  FTellerItem(this.item, this.indexToPage, {Key key}) : super(key: key);

  @override
  _FTellerItemState createState() => _FTellerItemState();
}

class _FTellerItemState extends State<FTellerItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getSize(context),
      height: 85,
      margin: EdgeInsets.only(bottom: 5),
      padding: EdgeInsets.only(
        left: 25,
        top: 5,
        bottom: 5,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromARGB(255, 65, 2, 121),
                Color.fromARGB(255, 161, 70, 244).withOpacity(0.2),
              ])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  widget.item.photoUrl,
                ),
                radius: 38,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${widget.item.name}',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Text(
                        widget.item.isOnline ? 'Çevrim İçi' : 'Çevrim Dışı',
                        style: TextStyle(
                            color: Color.fromARGB(255, 178, 255, 5),
                            fontSize: 11),
                      ),
                    ),
                    Text(
                      '${widget.item.description}',
                      style: TextStyle(
                          color: Colors.white.withOpacity(.5), fontSize: 11),
                    ),
                  ],
                ),
              )
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => ForWhomPage(widget.indexToPage),
                  ));
            },
            child: Align(
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
            ),
          )
        ],
      ),
    );
  }
}
