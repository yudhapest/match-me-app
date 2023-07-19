import 'package:flutter/material.dart';
import 'package:match_me/src/common/style.dart';
import 'package:match_me/src/features/authentication/presentation/sign_up_age_job_screen.dart';
import 'package:match_me/src/widgets/banner_widget.dart';
import 'package:match_me/src/widgets/custom_button_widget.dart';
import 'package:match_me/src/widgets/custom_text_button_widget.dart';
import 'package:match_me/src/widgets/custom_text_field_widget.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/sign-up';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String? validationInput() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      return 'Name or email or password is empty';
    }

    if (nameController.text.length < 4 ||
        emailController.text.length < 4 ||
        passwordController.text.length < 4) {
      return 'Too short, minimum 4 characters';
    }

    if (!emailController.text.contains('@')) {
      return 'Email is not valid with @';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: AppPadding.p50, horizontal: AppPadding.p24),
          child: Column(
            children: [
              const BannerWidget(),
              CustomTextFieldWidget(
                  labelName: 'Complete Name',
                  hintext: 'Write your name',
                  controller: nameController),
              CustomTextFieldWidget(
                  labelName: 'Email Address',
                  hintext: 'Write your mail address',
                  controller: emailController),
              CustomTextFieldWidget(
                  labelName: 'Password',
                  hintext: 'Write your password',
                  isObsecure: true,
                  controller: passwordController),
              const SizedBox(
                height: AppSize.s50,
              ),
              CustomButtonWidget(
                title: 'Get Started',
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpAgeJobScreen(
                        fullName: nameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: AppSize.s20,
              ),
              CustomTextButtonWidget(
                  title: 'Sign In to My Account', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
