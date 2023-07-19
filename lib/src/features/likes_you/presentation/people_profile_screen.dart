import 'package:flutter/material.dart';
import 'package:match_me/src/common/style.dart';
import 'package:match_me/src/features/likes_you/domain/user.dart';
import 'package:match_me/src/widgets/custom_button_widget.dart';
import 'package:match_me/src/widgets/people_identitas_widget.dart';
import 'package:match_me/src/widgets/profile_detail_image_widget.dart';

class PeopleProfileScreen extends StatelessWidget {
  static const String routeName = '/people_profile';
  const PeopleProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as User;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ProfileDetailImageWidget(
              user: user,
            ),
            const SizedBox(
              height: AppSize.s30,
            ),
            PeopleIdentitasWidget(
              user: user,
            ),
            Container(
              height: 80.0,
              margin: const EdgeInsets.symmetric(horizontal: AppMargin.m24),
              child: ListView.builder(
                itemCount: user.hobbyImages.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: 120.0,
                    height: 80.0,
                    margin: EdgeInsets.only(right: index == 2 ? 0 : 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.s18),
                      image: DecorationImage(
                          image: AssetImage(
                            user.hobbyImages[index],
                          ),
                          fit: BoxFit.cover),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: AppSize.s40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
              child: CustomButtonWidget(title: 'Chat Now', onTap: () {}),
            ),
            const SizedBox(
              height: AppSize.s40,
            ),
          ],
        ),
      ),
    );
  }
}
