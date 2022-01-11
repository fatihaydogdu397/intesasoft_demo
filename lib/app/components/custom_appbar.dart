import 'package:flutter/material.dart';
import 'package:intesasoft_demo/shared/app_colors.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: customBlack, size: 30),
      elevation: 0,
      backgroundColor: backgroundWhiteColor,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipOval(
            child: Container(
              width: 40,
              height: 40,
              color: customRed,
              child: const Icon(Icons.person, color: backgroundWhiteColor),
            ),
          ),
        ),
      ],
    );
  }
}
