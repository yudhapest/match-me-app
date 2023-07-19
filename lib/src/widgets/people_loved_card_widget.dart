import 'package:flutter/material.dart';
import 'package:match_me/src/common/style.dart';
import 'package:match_me/src/features/likes_you/domain/user.dart';
import 'package:match_me/src/features/likes_you/presentation/people_profile_screen.dart';

class PeopleLovedCardWidget extends StatelessWidget {
  final User user;
  const PeopleLovedCardWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, PeopleProfileScreen.routeName,
              arguments: user);
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: AppMargin.m16),
          decoration: BoxDecoration(
            color: ColorManager.secondaryColor,
            borderRadius: BorderRadius.circular(AppSize.s20),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(AppPadding.p10),
            leading: Container(
              width: 70.0,
              height: 70.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(
                      user.imagePath,
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            title: Text(
              user.fullName,
              style: getWhiteTextStyle(
                  fontSize: FontSizeManager.f20,
                  fontWeight: FontWeightManager.semiBold),
            ),
            subtitle: Text(
              '${user.age}, ${user.occupation}',
              style: getBrightGreyTextStyle(),
            ),
          ),
        ),
      ),
    );
  }
}
