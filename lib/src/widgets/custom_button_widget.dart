import 'package:flutter/material.dart';
import 'package:match_me/src/common/style.dart';

class CustomButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const CustomButtonWidget(
      {super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 55.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s50),
          gradient: LinearGradient(colors: [
            ColorManager.pinkColor,
            ColorManager.purpleColor,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Text(
          title,
          style: getWhiteTextStyle(fontWeight: FontWeightManager.bold),
        ),
      ),
    );
  }
}
