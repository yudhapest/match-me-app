import 'package:flutter/material.dart';
import 'package:match_me/src/common/style.dart';
import 'package:match_me/src/features/likes_you/domain/user.dart';
import 'package:match_me/src/features/likes_you/presentation/explore_people_screen.dart';
import 'package:match_me/src/widgets/match_button_widget.dart';

class ProfileDetailImageWidget extends StatelessWidget {
  const ProfileDetailImageWidget({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 420.0,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  user.imagePath,
                ),
                fit: BoxFit.cover),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: AppPadding.p40, horizontal: AppPadding.p26),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MatchButtonWidget(
                iconPath: 'arrowleft.png',
                isGradient: true,
                dimension: 40.0,
                isPadding: 9.0,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Text(
                'People You\nLoved',
                style: getWhiteTextStyle(
                  fontWeight: FontWeightManager.semiBold,
                  fontSize: FontSizeManager.f20,
                ),
                textAlign: TextAlign.center,
              ),
              MatchButtonWidget(
                iconPath: 'close.png',
                isGradient: true,
                dimension: 40.0,
                isPadding: 5.0,
                onTap: () {
                  Navigator.pushNamed(context, ExplorePeopleScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
