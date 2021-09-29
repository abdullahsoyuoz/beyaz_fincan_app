import 'package:flutter/material.dart';

double getSize(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

String getDateToString(DateTime time) {
  return '${time.day} ${getMonthName(time.month)} ${time.year}';
}

String getMonthName(int index) {
  switch (index) {
    case 0:
      return 'Ocak';
      break;
    case 1:
      return 'Şubat';
      break;
    case 2:
      return 'Mart';
      break;
    case 3:
      return 'Nisan';
      break;
    case 4:
      return 'Mayıs';
      break;
    case 5:
      return 'Haziran';
      break;
    case 6:
      return 'Temmuz';
      break;
    case 7:
      return 'Ağustos';
      break;
    case 8:
      return 'Eylül';
      break;
    case 9:
      return 'Ekim';
      break;
    case 10:
      return 'Kasım';
      break;
    case 11:
      return 'Aralık';
      break;
    default:
      return 'null';
      break;
  }
}
