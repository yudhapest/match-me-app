import 'package:flutter/material.dart';
import 'package:match_me/src/common/style.dart';
import 'package:match_me/src/features/likes_you/domain/user.dart';

class GlassCardWidget extends StatelessWidget {
  const GlassCardWidget({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: AppPadding.p16,
        horizontal: AppPadding.p22,
      ),
      margin: const EdgeInsets.symmetric(
          vertical: AppMargin.m26, horizontal: AppMargin.m30),
      width: double.infinity,
      height: 80.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(33.0),
        image: const DecorationImage(
            image: AssetImage(
              '${AssetImageIconManager.assetPath}glass_card_image.png',
            ),
            fit: BoxFit.cover),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.fullName,
                style: getWhiteTextStyle(
                  fontSize: FontSizeManager.f20,
                  fontWeight: FontWeightManager.semiBold,
                ),
              ),
              Text(
                '${user.age}, ${user.occupation}',
                style: getWhiteTextStyle(
                  fontSize: FontSizeManager.f14,
                ),
              ),
            ],
          ),
          Container(
            width: 50.0,
            height: 50.0,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
              '${AssetImageIconManager.assetPath}profile.png',
            ))),
          ),
        ],
      ),
    );
  }
}
