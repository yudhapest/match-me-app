import 'package:flutter/material.dart';
import 'package:match_me/src/common/style.dart';

class MatchButtonWidget extends StatelessWidget {
  final double dimension;
  final String iconPath;
  final VoidCallback onTap;
  final bool isGradient;
  final double isPadding;

  const MatchButtonWidget({
    Key? key,
    this.dimension = 50.0,
    required this.iconPath,
    required this.onTap,
    required this.isGradient,
    this.isPadding = 8.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(isPadding),
        width: dimension,
        height: dimension,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s50),
          gradient: isGradient
              ? LinearGradient(
                  colors: [
                    ColorManager.pinkColor,
                    ColorManager.purpleColor,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : LinearGradient(
                  colors: [
                    ColorManager.darkGreyColor,
                    ColorManager.darkGreyColor,
                  ],
                ),
        ),
        child: Image(
          image: AssetImage(
            '${AssetImageIconManager.assetPath}$iconPath',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
