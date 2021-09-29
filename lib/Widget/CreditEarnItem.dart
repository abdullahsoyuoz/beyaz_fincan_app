import 'package:beyaz_fincan_app/Model/CreditEarnItemEntity.dart';
import 'package:beyaz_fincan_app/Utility/AppColors.dart';
import 'package:beyaz_fincan_app/Utility/AppUtility.dart';
import 'package:flutter/material.dart';

class CreditEarnItem extends StatefulWidget {
  CreditEarnItemEntity item;
  CreditEarnItem(this.item, {Key key}) : super(key: key);

  @override
  _CreditEarnItemState createState() => _CreditEarnItemState();
}

class _CreditEarnItemState extends State<CreditEarnItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: RaisedButton(
        onPressed: () {},
        splashColor: appColorBackgroundPurple,
        padding: EdgeInsets.zero,
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              widget.item.gradientColorStart,
              widget.item.gradientColorEnd,
            ],
          )),
          child: Container(
              width: getSize(context),
              height: 80,
              padding: EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 20,
              ),
              alignment: Alignment.center,
              child: Row(
                children: [
                  Image.asset(
                    widget.item.iconPath,
                    fit: BoxFit.fitHeight,
                    height: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${widget.item.title}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            letterSpacing: 0.7,
                          ),
                        ),
                        widget.item.subTitle == null
                            ? SizedBox()
                            : Text(
                                '${widget.item.subTitle}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  letterSpacing: 0.7,
                                ),
                              ),
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
