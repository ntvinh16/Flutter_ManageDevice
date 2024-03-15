import 'package:flutter/material.dart';
import 'package:front_end_mobile_20240117/flavor/flavor_config.dart';
import 'package:front_end_mobile_20240117/resource/res_color.dart';

import 'res_font.dart';

final ThemeData appTheme = ThemeData(
  primarySwatch: AppConfig.shared.primaryColor,
  fontFamily: ResFonts.quicksandMedium,
  textButtonTheme: TextButtonThemeData(style: textButtonStyle),
  elevatedButtonTheme: ElevatedButtonThemeData(style: elevatedButtonStyle),
  outlinedButtonTheme: OutlinedButtonThemeData(style: outlineButtonStyle),
  scaffoldBackgroundColor: Colors.white,
  platform: TargetPlatform.iOS,
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(
          10,
        ),
      ),
    ),
  ),
  appBarTheme: AppBarTheme(
    color: ResColors.primaryColor,
    centerTitle: true,
    elevation: 0,
    titleTextStyle: const TextStyle(
      color: Colors.red,
    ),
  ),
  //platform: TargetPlatform.iOS,
);

final ButtonStyle textButtonStyle = TextButton.styleFrom(
  textStyle: const TextStyle(
    fontSize: 20,
    fontFamily: ResFonts.quicksandBold,
  ),
  foregroundColor: ResColors.primaryColor,
  minimumSize: const Size(double.infinity, 36),
  padding: const EdgeInsets.symmetric(horizontal: 16.0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2.0)),
  ),
);

final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
  textStyle: const TextStyle(
    fontSize: 20,
    fontFamily: ResFonts.quicksandBold,
  ),
  minimumSize: const Size(double.infinity, 36),
  foregroundColor: ResColors.primaryColor,
  shadowColor: ResColors.primaryColor,
  padding: const EdgeInsets.symmetric(
    horizontal: 2,
    vertical: 8,
  ),
  side: BorderSide(
    color: ResColors.primaryColor,
  ),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
);

final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
  textStyle: AppTextStyle.styleS12W700,
  elevation: 2,
  foregroundColor: ResColors.primaryColor,
  shadowColor: ResColors.primaryColor,
  minimumSize: const Size(double.infinity, 36),
  padding: const EdgeInsets.symmetric(
    horizontal: 25,
    vertical: 14,
  ),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(6),
    ),
  ),
);

class AppTextStyle {
  static const TextStyle styleS12W700 = TextStyle(
    fontSize: 12,
    fontFamily: ResFonts.quicksandMedium,
  );
}
