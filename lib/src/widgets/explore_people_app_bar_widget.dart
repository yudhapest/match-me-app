import 'dart:io';

import 'package:flutter/material.dart';
import 'package:match_me/src/common/style.dart';
import 'package:match_me/src/features/authentication/data/data_user_account_local.dart';
import 'package:match_me/src/features/authentication/presentation/sign_up_screen.dart';
import 'package:match_me/src/features/likes_you/presentation/people_loved_screen.dart';
import 'package:match_me/src/widgets/logo_widget.dart';

class ExplorePeopleAppBarWidget extends StatelessWidget {
  const ExplorePeopleAppBarWidget({super.key, this.imagePath});

  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            UserAccountRegister.clearUserAccountRegister();
            Navigator.pushNamedAndRemoveUntil(
              context,
              SignUpScreen.routeName,
              (route) => false,
            );
          },
          child: Container(
            width: 55.0,
            height: 55.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: imagePath != null
                      ? FileImage(File(imagePath!))
                      : const AssetImage(
                          '${AssetImageIconManager.assetPath}avatar.png',
                        ) as ImageProvider,
                  fit: BoxFit.cover),
            ),
          ),
        ),
        const LogoWidget(),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, PeopleLovedScreen.routeName);
          },
          child: Container(
            width: 24.0,
            height: 24.0,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
              '${AssetImageIconManager.assetPath}notification.png',
            ))),
          ),
        ),
      ],
    );
  }
}
