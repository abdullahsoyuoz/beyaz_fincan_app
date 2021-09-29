import 'package:beyaz_fincan_app/Pages/Detail/MyFTDetailPage.dart';
import 'package:beyaz_fincan_app/Utility/AppColors.dart';
import 'package:beyaz_fincan_app/Utility/AppDecorations.dart';
import 'package:beyaz_fincan_app/Utility/AppUtility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyFortuneTell extends StatefulWidget {
  const MyFortuneTell({Key key}) : super(key: key);

  @override
  _MyFortuneTellState createState() => _MyFortuneTellState();
}

class _MyFortuneTellState extends State<MyFortuneTell> {
  bool onTap = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          onTap = !onTap;
          Future.delayed(Duration(milliseconds: 50), () {}).whenComplete(() {
            setState(() {
              onTap = !onTap;
            });
            Navigator.push(context, CupertinoPageRoute(builder: (context) => MyFTDetailPage(),));
          });
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
            borderRadius: BorderRadius.horizontal(left: Radius.circular(8))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedDefaultTextStyle(
                child: Text('Fallarım'),
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