import 'package:beyaz_fincan_app/Utility/AppColors.dart';
import 'package:beyaz_fincan_app/Utility/AppUtility.dart';
import 'package:flutter/material.dart';

class CustomAppTitleBar extends StatelessWidget {
  String title;
  CustomAppTitleBar(this.title,{Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Container(
        width: getSize(context),
        height: 55,
        decoration: BoxDecoration(
            // color: Colors.white,
            backgroundBlendMode: BlendMode.multiply,
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromARGB(255, 128, 128, 128).withOpacity(.5),
                  Colors.transparent,
                ])),
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Row(
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.keyboard_arrow_left_rounded,
                  color: appColorOrangeRed,
                  size: 34,
                ),
              ),
              Text(
                '$title',
                style: TextStyle(
                    color: Colors.white, fontSize: 15, letterSpacing: 0.5),
              )
            ],
          ),
        ),
      ),
    );
  }
}
