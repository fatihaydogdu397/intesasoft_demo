import 'package:flutter/material.dart';
import 'package:intesasoft_demo/app/extensions/context/context_extensions_shelf.dart';
import 'package:intesasoft_demo/shared/app_colors.dart';

class TextFormDeco {
  static final TextFormDeco _instance = TextFormDeco();
  static TextFormDeco get instance => _instance;

  InputDecoration searchDeco(
    BuildContext context,
    String hintTextKey,
  ) {
    return InputDecoration(
      filled: true,
      fillColor: context.accentColor,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 4,
      ),

      labelText: hintTextKey,
      labelStyle: context.headline4.copyWith(
        color: customGrey,
        // fontSize: 4.3,
      ),
      //hintText: hintTextKey.translate,
      hintStyle: context.headline4.copyWith(
        color: customGrey,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: context.medHighCircular,
        borderSide: BorderSide(width: 1, color: context.primaryColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: context.medHighCircular,
        borderSide: BorderSide(width: 1, color: context.primaryColor),
      ),
    );
  }
}
