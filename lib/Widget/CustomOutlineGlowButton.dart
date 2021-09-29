import 'package:beyaz_fincan_app/Utility/AppColors.dart';
import 'package:beyaz_fincan_app/Utility/AppUtility.dart';
import 'package:flutter/material.dart';

class CustomOutlineGlowButton extends StatefulWidget {
  String title;
  Function onPressed;
  Color gradientColorStart;
  Color gradientColorEnd;
  double width;
  double height;
  CustomOutlineGlowButton({
    @required this.title,
    @required this.onPressed,
    this.gradientColorStart = Colors.orange,
    this.gradientColorEnd = Colors.deepPurple,
    this.width,
    this.height = 50,
  });

  @override
  _CustomOutlineGlowButtonState createState() =>
      _CustomOutlineGlowButtonState();
}

class _CustomOutlineGlowButtonState extends State<CustomOutlineGlowButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(100)),
        // boxShadow: [
        //   BoxShadow(
        //       color: widget.gradientColorEnd,
        //       blurRadius: 1,
        //       offset: Offset(0, 3)),
        // ],
      ),
      child: OutlineButton(
        onPressed: widget.onPressed,
        splashColor: appColorBackgroundPurple,
        borderSide: BorderSide(
          color: widget.gradientColorStart,
          width: 2,
        ),
        highlightedBorderColor: widget.gradientColorEnd,
        padding: EdgeInsets.zero,
        child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100))),
            constraints: BoxConstraints(
                maxWidth: widget.width != null
                    ? widget.width
                    : getSize(context) * 0.8,
                minHeight: 10),
            child: Text(
              widget.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            )),
        shape: StadiumBorder(),
      ),
    );
  }
}
