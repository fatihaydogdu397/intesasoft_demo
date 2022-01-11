import 'package:flutter/material.dart';
import 'package:intesasoft_demo/app/decoration/decoration_shelf.dart';
import 'package:intesasoft_demo/app/extensions/context/context_extensions_shelf.dart';
import 'package:intesasoft_demo/shared/app_colors.dart';

class SearchBar extends StatelessWidget {
  final Function(String) onChanged;
  final String hintTextKey;
  final bool visibility;
  final TextEditingController? textEditingController;
  final Function()? changeVisibility;
  const SearchBar({
    required this.onChanged,
    this.hintTextKey = '',
    this.visibility = false,
    this.changeVisibility,
    Key? key,
    this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      scrollPadding: context.lowEdgeInsets,
      decoration: TextFormDeco.instance
          .searchDeco(
            context,
            hintTextKey,
          )
          .copyWith(
            fillColor: backgroundColor,
            prefixIcon: const Icon(
              Icons.search_sharp,
              color: customRed,
            ),
            contentPadding: EdgeInsets.symmetric(
                vertical: context.height, horizontal: context.width * 2),
            enabledBorder: OutlineInputBorder(
              borderRadius: context.lowCircular,
              borderSide: const BorderSide(width: 1, color: customGrey),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            hintText: hintTextKey,
            hintStyle: context.headline5.copyWith(
                color: context.darkGreyColor,
                fontSize: (context.width + context.height) / .8),
            focusedBorder: OutlineInputBorder(
              borderRadius: context.lowCircular,
              borderSide: const BorderSide(width: 1, color: customRed),
            ),
          ),
      onChanged: onChanged,
    );
  }
}
