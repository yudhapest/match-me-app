import 'package:flutter/material.dart';
import 'package:match_me/src/common/style.dart';
import 'package:match_me/src/features/likes_you/domain/user.dart';

class PeopleIdentitasWidget extends StatelessWidget {
  const PeopleIdentitasWidget({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.fullName,
            style: getWhiteTextStyle(
              fontSize: FontSizeManager.f24,
              fontWeight: FontWeightManager.semiBold,
            ),
          ),
          Text(
            '${user.age}, ${user.occupation}',
            style: getBrightGreyTextStyle(),
          ),
          const SizedBox(
            height: AppSize.s16,
          ),
          Text(
            user.description,
            style: getWhiteTextStyle(),
          ),
          const SizedBox(
            height: AppSize.s16,
          ),
        ],
      ),
    );
  }
}
