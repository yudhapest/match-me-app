import 'package:flutter/material.dart';
import 'package:match_me/src/common/style.dart';
import 'package:match_me/src/features/likes_you/domain/user.dart';
import 'package:match_me/src/widgets/glass_card_widget.dart';

class MatchCardWidget extends StatelessWidget {
  const MatchCardWidget({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  user.imagePath,
                ),
                fit: BoxFit.cover),
            border: Border.all(
                width: 10.0,
                color: ColorManager.secondaryColor,
                strokeAlign: BorderSide.strokeAlignInside),
            borderRadius: BorderRadius.circular(70.0),
          ),
        ),
        GlassCardWidget(
          user: user,
        ),
      ],
    );
  }
}
