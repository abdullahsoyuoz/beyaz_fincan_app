import 'package:beyaz_fincan_app/Model/RequestBottomMenuItemEntity.dart';
import 'package:beyaz_fincan_app/Utility/AppColors.dart';
import 'package:flutter/material.dart';

class RequestMenuItem extends StatefulWidget {
  RequestBottomMenuItemEntity item;
  RequestMenuItem(this.item, {Key key}) : super(key: key);

  @override
  _RequestMenuItemState createState() => _RequestMenuItemState();
}

class _RequestMenuItemState extends State<RequestMenuItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 48,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          // focal: Alignment.topCenter,
          // focalRadius: 0.1,
          center: Alignment.topCenter,
          radius: 1.7,
          colors: [
            appColorBgGradientStart,
            appColorBgDarkPurple,
          ]
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            widget.item.iconPath,
            height: 23,
            fit: BoxFit.fitHeight,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: Text('${widget.item.title}', style: TextStyle(
              color: Colors.white,
              fontSize: 11,
              letterSpacing: 0.5,
            ),),
          )
        ],
      ),
    );
  }
}
