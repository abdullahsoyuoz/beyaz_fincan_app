import 'package:beyaz_fincan_app/Utility/AppColors.dart';
import 'package:flutter/material.dart';

var appTextStyleEnterWelcome =
    TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold);

var appTextStyleDetailContentContainerTitle = TextStyle(
  color: Colors.white,
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

var appGradientBackground = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      appColorBgGradientStart,
      appColorBgGradientEnd,
    ]);

var appCrossGradientBackground = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      appColorBgGradientStart,
      appColorBgGradientEnd,
    ]);

var appTextStyleDrawerTitleStyle = TextStyle(
  color: appColorTextGrey,
  fontSize: 12,
  fontWeight: FontWeight.normal,
);

var appTextStyleDrawerItemStyle = TextStyle(
  color: appColorGrey,
  fontSize: 14,
  fontWeight: FontWeight.normal,
);

var appDecorationDetailTitle = BoxDecoration(
    color: Colors.white,
    backgroundBlendMode: BlendMode.multiply,
    gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Color.fromARGB(255, 128, 128, 128).withOpacity(.7),
          Colors.transparent,
        ]));

var appDecorationDetailAppbar = BoxDecoration(
    color: Colors.white,
    backgroundBlendMode: BlendMode.multiply,
    gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Colors.transparent,
          Color.fromARGB(255, 128, 128, 128).withOpacity(.7),
        ]));

var appDecorationDetailTitleBasic = BoxDecoration(
    gradient: LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Colors.black.withAlpha(80),
    Colors.white.withAlpha(20),
  ],
));

var appDecorationDetailAppbarBasic = BoxDecoration(
    gradient: LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Colors.white.withAlpha(20),
    Colors.black.withAlpha(80),
  ],
));

var appTextStylePersonalInfoDropTitle =
    TextStyle(color: Colors.black.withOpacity(.5), fontSize: 12);

var appTextStylePersonalInfoDropContent =
    TextStyle(color: appColorPersonalInfoItemContent, fontSize: 15);

var appTextStyleLoginInput = TextStyle(
  color: appColorPersonalInfoItemContent,
  fontSize: 14,
);

var appTextStyleDropdownStyle = TextStyle(
  color: appColorGrey,
  fontSize: 12,
  fontWeight: FontWeight.bold,
  letterSpacing: 0.7,
);
