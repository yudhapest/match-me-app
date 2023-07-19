import 'package:flutter/material.dart';
import 'package:match_me/src/common/style.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 215.0,
      margin: const EdgeInsets.symmetric(vertical: AppMargin.m30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s18),
        image: const DecorationImage(
            image: AssetImage(
              '${AssetImageIconManager.assetPath}hero.png',
            ),
            fit: BoxFit.cover),
      ),
    );
  }
}
