import 'package:flutter/material.dart';
import 'package:match_me/src/common/style.dart';
import 'package:match_me/src/features/authentication/data/data_user_account_local.dart';
import 'package:match_me/src/features/authentication/presentation/sign_up_age_job_screen.dart';
import 'package:match_me/src/features/authentication/presentation/sign_up_screen.dart';
import 'package:match_me/src/features/authentication/presentation/sign_up_upload_photo_screen.dart';
import 'package:match_me/src/features/likes_you/presentation/explore_people_screen.dart';
import 'package:match_me/src/features/likes_you/presentation/people_loved_screen.dart';
import 'package:match_me/src/features/likes_you/presentation/people_profile_screen.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({
    super.key,
  });

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  bool isRegister = false;

  isUserRegister() async {
    isRegister = await UserAccountRegister.getUserAccountRegisterFromStorage();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    isUserRegister();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: getThemeData(),
        home: isRegister ? const ExplorePeopleScreen() : const SignUpScreen(),
        routes: {
          SignUpScreen.routeName: (context) => const SignUpScreen(),
          SignUpAgeJobScreen.routeName: (context) =>
              const SignUpAgeJobScreen(fullName: '', email: '', password: ''),
          SignUpUploadPhotoScreen.routeName: (context) =>
              const SignUpUploadPhotoScreen(),
          ExplorePeopleScreen.routeName: (context) =>
              const ExplorePeopleScreen(),
          PeopleLovedScreen.routeName: (context) => const PeopleLovedScreen(),
          PeopleProfileScreen.routeName: (context) =>
              const PeopleProfileScreen(),
        });
  }
}
