// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:match_me/src/common/style.dart';
import 'package:match_me/src/features/authentication/domain/user_account.dart';
import 'package:match_me/src/features/authentication/presentation/sign_up_upload_photo_screen.dart';
import 'package:match_me/src/widgets/banner_widget.dart';
import 'package:match_me/src/widgets/custom_button_widget.dart';
import 'package:match_me/src/widgets/custom_text_field_widget.dart';

class SignUpAgeJobScreen extends StatefulWidget {
  static const routeName = '/sign-up-age-job';

  final String fullName;
  final String email;
  final String password;
  const SignUpAgeJobScreen({
    Key? key,
    required this.fullName,
    required this.email,
    required this.password,
  }) : super(key: key);

  @override
  State<SignUpAgeJobScreen> createState() => _SignUpAgeJobScreenState();
}

class _SignUpAgeJobScreenState extends State<SignUpAgeJobScreen> {
  final jobController = TextEditingController();
  final ageController = TextEditingController();

  @override
  void dispose() {
    jobController.dispose();
    ageController.dispose();
    super.dispose();
  }

  String? validationInput() {
    if (jobController.text.isEmpty || ageController.text.isEmpty) {
      return 'Job or age is empty';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p24,
          vertical: AppPadding.p50,
        ),
        child: Column(
          children: [
            const BannerWidget(),
            CustomTextFieldWidget(
              labelName: 'Occupation',
              hintext: 'Write your occupation',
              controller: jobController,
            ),
            CustomTextFieldWidget(
                labelName: 'Age',
                hintext: 'Write your age',
                controller: ageController),
            const Spacer(),
            CustomButtonWidget(
              title: 'Continue Sign Up',
              onTap: () {
                final message = validationInput();
                if (message != null) {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                    ),
                  );
                  return;
                }
                UserAccount userAccount = UserAccount(
                    fullName: widget.fullName,
                    email: widget.email,
                    passwornd: widget.password,
                    occupation: jobController.text,
                    age: ageController.text);
                Navigator.pushNamed(context, SignUpUploadPhotoScreen.routeName,
                    arguments: userAccount);
              },
            )
          ],
        ),
      ),
    );
  }
}
