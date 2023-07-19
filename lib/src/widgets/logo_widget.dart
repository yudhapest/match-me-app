import 'package:flutter/material.dart';
import 'package:match_me/src/common/style.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 143.0,
      height: 34.0,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            '${AssetImageIconManager.assetPath}logo.png',
          ),
        ),
      ),
    );
  }
}
