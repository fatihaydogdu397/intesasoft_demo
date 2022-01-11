import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  Color get primaryColor => theme.primaryColor;
  Color get accentColor => const Color(0xffffffff);
  Color get canvasColor => theme.canvasColor;
  Color get errorColor => theme.errorColor;
  Color get darkGreyColor => theme.dividerColor;
  Color get primaryLightColor => theme.primaryColorLight;
  Color get primaryDarkColor => theme.primaryColorDark;
  Color get secondaryPink => const Color(0xffEB7998);
  Color get secondaryDarkRed => const Color(0xffB83000);
  Color get gradientLight => const Color(0xffFF6359);
  Color get gradientDark => const Color(0xffE20D00);
  Color get secondaryGreen => const Color(0xFF01B436);
  Color get secondaryDarkBlue => const Color(0xFF13064B);
  Color get shadowColor => const Color(0xFFBCBCBC);

  Color get highlightColor => theme.highlightColor;

  TextStyle get headline1 => theme.textTheme.headline1!.copyWith(
      fontSize: 40, fontWeight: FontWeight.bold, color: primaryLightColor);
  TextStyle get headline2 => theme.textTheme.headline2!.copyWith(
      fontSize: 30, fontWeight: FontWeight.w600, color: primaryLightColor);
  TextStyle get headline3 => theme.textTheme.headline3!
      .copyWith(fontSize: 25, color: primaryLightColor);
  TextStyle get headline4 => theme.textTheme.headline4!
      .copyWith(fontSize: 20, color: primaryLightColor);
  TextStyle get headline5 => theme.textTheme.headline5!
      .copyWith(fontSize: 18, color: primaryLightColor);
  TextStyle get headline6 => theme.textTheme.headline6!
      .copyWith(fontSize: 16, color: primaryLightColor);
}
