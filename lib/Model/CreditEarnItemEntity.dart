import 'package:flutter/material.dart';

class CreditEarnItemEntity {
  int id;
  String title;
  String subTitle;
  String iconPath;
  Color gradientColorStart;
  Color gradientColorEnd;
  Function function;
  CreditEarnItemEntity({
    this.id,
    this.title,
    this.subTitle,
    this.iconPath,
    this.gradientColorStart,
    this.gradientColorEnd,
    this.function,
  });
}
