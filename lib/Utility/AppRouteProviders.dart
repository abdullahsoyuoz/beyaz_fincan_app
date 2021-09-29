import 'package:beyaz_fincan_app/Model/UserEntity.dart';
import 'package:beyaz_fincan_app/Pages/App/ChooseFortuneTellerPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:beyaz_fincan_app/Pages/App/AboutUsPage.dart';
import 'package:beyaz_fincan_app/Pages/App/ContactUsPage.dart';
import 'package:beyaz_fincan_app/Pages/App/CreditTransactionsBuyPage.dart';
import 'package:beyaz_fincan_app/Pages/App/CreditTransactionsEarnPage.dart';
import 'package:beyaz_fincan_app/Pages/App/ExitPage.dart';
import 'package:beyaz_fincan_app/Pages/App/MyProfilePage.dart';
import 'package:beyaz_fincan_app/Pages/App/RemoveAdsDetailPage.dart';
import 'package:beyaz_fincan_app/Pages/App/SettingsPage.dart';

import 'package:beyaz_fincan_app/Pages/Detail/FTBurclarDetailPage.dart';
import 'package:beyaz_fincan_app/Pages/Detail/FTElDetailPage.dart';
import 'package:beyaz_fincan_app/Pages/Detail/FTKahveDetailPage.dart';
import 'package:beyaz_fincan_app/Pages/Detail/FTRuyaYorumDetailPage.dart';
import 'package:beyaz_fincan_app/Pages/Detail/FTTarotDetailPage.dart';
import 'package:beyaz_fincan_app/Pages/Detail/FTYuzDetailPage.dart';

Future<void> fortunaTellItemRouteProvider(BuildContext context, int id) async {
  switch (id) {
    case 0:
      Navigator.push(context,
          CupertinoPageRoute(builder: (context) => FTKahveDetailPage()));
      break;
    case 1:
      Navigator.push(context,
          CupertinoPageRoute(builder: (context) => FTTarotDetailPage()));
      break;
    case 2:
      Navigator.push(
          context, CupertinoPageRoute(builder: (context) => FTElDetailPage()));
      break;
    case 3:
      Navigator.push(
          context, CupertinoPageRoute(builder: (context) => FTYuzDetailPage()));
      break;
    case 4:
      Navigator.push(context,
          CupertinoPageRoute(builder: (context) => FTRuyaYorumDetailPage()));
      break;
    case 5:
      Navigator.push(context,
          CupertinoPageRoute(builder: (context) => FTBurclarDetailPage()));
      break;
    default:
  }
}
// TODO: new route rules
Future<void> homePageRouteProvider(BuildContext context, int id) async {
  switch (id) {
    case 0:
      Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => ChooseFortuneTellerPage(id),
          ));
      break;
    case 1:
      Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => ChooseFortuneTellerPage(id),
          ));
      break;
    case 2:
      Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => ChooseFortuneTellerPage(id),
          ));
      break;
    case 3:
      Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => ChooseFortuneTellerPage(id),
          ));
      break;
    case 4:
      Navigator.push(context,
          CupertinoPageRoute(builder: (context) => FTRuyaYorumDetailPage()));
      break;
    case 5:
      Navigator.push(context,
          CupertinoPageRoute(builder: (context) => FTBurclarDetailPage()));
      break;
    default:
  }
}

Future<void> creditTItemRouteProvider(BuildContext context, int id) async {
  switch (id) {
    case 0:
      return Navigator.push(
          context,
          CupertinoPageRoute(
              builder: (context) => CreditTransactionsBuyPage()));
      break;
    case 1:
      return Navigator.push(
          context,
          CupertinoPageRoute(
              builder: (context) => CreditTransactionsEarnPage()));
      break;
    case 2:
      return Navigator.push(
          context, CupertinoPageRoute(builder: (context) => RemoveAdsPage()));
      break;
    default:
  }
}

Future<void> otherTItemRouteProvider(
    BuildContext context, int id, UserEntity user) async {
  switch (id) {
    case 0:
      return Navigator.push(
          context, CupertinoPageRoute(builder: (context) => ContactUsPage()));
      break;
    case 1:
      return Navigator.push(context,
          CupertinoPageRoute(builder: (context) => MyProfilePage(user)));
      break;
    case 2:
      return Navigator.push(
          context, CupertinoPageRoute(builder: (context) => SettingsPage()));
      break;
    default:
  }
}

Future<void> appTItemRouteProvider(BuildContext context, int id) async {
  switch (id) {
    case 0:
      return Navigator.push(
          context, CupertinoPageRoute(builder: (context) => AboutUsPage()));
      break;
    case 1:
      return Navigator.push(
          context, CupertinoPageRoute(builder: (context) => ExitPage()));
      break;
    default:
  }
}
