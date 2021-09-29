import 'package:beyaz_fincan_app/Utility/AppColors.dart';
import 'package:beyaz_fincan_app/Utility/AppUtility.dart';
import 'package:flutter/material.dart';

class CustomGlowButton extends StatefulWidget {
  String title;
  Function onPressed;
  Color gradientColorStart;
  Color gradientColorEnd;
  Color shadowColor;
  double width;
  CustomGlowButton({
    @required this.title,
    @required this.onPressed,
    this.gradientColorStart = Colors.orange,
    this.gradientColorEnd = Colors.deepPurple,
    this.shadowColor,
    this.width,
  });

  @override
  _CustomGlowButtonState createState() => _CustomGlowButtonState();
}

class _CustomGlowButtonState extends State<CustomGlowButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          boxShadow: [
            BoxShadow(
                color: widget.shadowColor == null ? widget.gradientColorEnd.withOpacity(.5) : widget.shadowColor,
                blurRadius: 5,
                offset: Offset(0, 3))
          ]),
      child: RaisedButton(
        onPressed: widget.onPressed,
        splashColor: appColorBackgroundPurple,
        padding: EdgeInsets.zero,
        child: Ink(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1000),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  widget.gradientColorStart,
                  widget.gradientColorEnd,
                ],
              )),
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
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              )),
        ),
        shape: StadiumBorder(),
      ),
    );
  }
}
