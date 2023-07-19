import 'package:flutter/material.dart';
import 'package:match_me/src/widgets/hero_widget.dart';
import 'package:match_me/src/widgets/logo_and_tagline.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        LogoAndTaglineWidget(),
        HeroWidget(),
      ],
    );
  }
}
