import 'package:flutter/material.dart';
import 'package:intesasoft_demo/app/extensions/context/context_extensions_shelf.dart';

class ButtonStyles {
  static final ButtonStyles _instance = ButtonStyles();
  static ButtonStyles get instance => _instance;

  ButtonStyle roundedStyle(
    BuildContext context, {
    Color? backgroundColor,
    Color? borderColor,
    BorderRadius? borderRadius,
    double? borderWidth,
    double? height,
  }) {
    return ButtonStyle(
      fixedSize: MaterialStateProperty.all(
          Size.fromHeight(height ?? context.height * 6)),
      backgroundColor:
          MaterialStateProperty.all(backgroundColor ?? context.canvasColor),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: borderRadius ?? context.highCircular,
          side: BorderSide(
            color: borderColor ?? context.primaryColor,
            width: borderWidth ?? 2.0,
          ),
        ),
      ),
    );
  }

  ButtonStyle lowRoundedStyle(
    BuildContext context, {
    Color? backgroundColor,
    Color? borderColor,
    double? width,
  }) {
    return ButtonStyle(
      backgroundColor:
          MaterialStateProperty.all(backgroundColor ?? context.accentColor),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: context.lowCircular,
          // side: BorderSide(
          //     color: borderColor ?? context.highlightColor,
          //     width: width ?? 1.0),
        ),
      ),
    );
  }
}
