import 'package:flutter/material.dart';
import 'package:match_me/src/common/style.dart';

class CustomTextButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const CustomTextButtonWidget(
      {super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: getDarkGreyTextStyle().copyWith(
            decoration: TextDecoration.underline,
          ),
        ));
  }
}
