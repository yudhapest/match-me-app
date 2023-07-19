import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:match_me/src/widgets/match_button_widget.dart';

class ExplorePeopleButtonWidget extends StatelessWidget {
  const ExplorePeopleButtonWidget({super.key, required this.controller});

  final AppinioSwiperController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MatchButtonWidget(
          iconPath: 'close.png',
          isGradient: false,
          onTap: () {
            controller.swipeLeft();
          },
        ),
        MatchButtonWidget(
          iconPath: 'lovely.png',
          isGradient: true,
          dimension: 80.0,
          isPadding: 22.0,
          onTap: () {
            controller.swipe();
          },
        ),
        MatchButtonWidget(
            iconPath: 'magicstar.png',
            isGradient: false,
            isPadding: 12.0,
            onTap: () {
              controller.swipeRight();
            }),
      ],
    );
  }
}
