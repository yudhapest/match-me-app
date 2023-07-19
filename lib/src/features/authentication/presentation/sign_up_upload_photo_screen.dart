import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:match_me/src/common/style.dart';
import 'package:match_me/src/features/authentication/domain/user_account.dart';
import 'package:match_me/src/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:match_me/src/features/likes_you/presentation/explore_people_screen.dart';
import 'package:match_me/src/utils/image_picker_utils.dart';
import 'package:match_me/src/widgets/custom_button_widget.dart';
import 'package:match_me/src/widgets/custom_text_button_widget.dart';
import 'package:match_me/src/widgets/logo_and_tagline.dart';
import 'package:match_me/src/widgets/upload_photo_widget.dart';

class SignUpUploadPhotoScreen extends StatefulWidget {
  static const String routeName = '/sign-up-upload-photo';
  const SignUpUploadPhotoScreen({super.key});

  @override
  State<SignUpUploadPhotoScreen> createState() =>
      _SignUpUploadPhotoScreenState();
}

class _SignUpUploadPhotoScreenState extends State<SignUpUploadPhotoScreen> {
  File? image;

  void getImageProfile(GetImageFrom source) async {
    final result = await ImagePickerUtils.getImage(source);
    if (result != null) {
      setState(() {
        image = File(result.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    UserAccount userAccount =
        ModalRoute.of(context)!.settings.arguments as UserAccount;
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              ExplorePeopleScreen.routeName,
              (route) => false,
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppPadding.p50,
            horizontal: AppPadding.p24,
          ),
          child: Column(
            children: [
              const LogoAndTaglineWidget(),
              const SizedBox(
                height: AppSize.s50,
              ),
              GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: 150,
                          child: Column(
                            children: [
                              ListTile(
                                leading: const Icon(Icons.camera),
                                title: const Text('Camera'),
                                onTap: () {
                                  Navigator.pop(context);
                                  getImageProfile(GetImageFrom.camera);
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.photo_library),
                                title: const Text('Gallery'),
                                onTap: () {
                                  Navigator.pop(context);
                                  getImageProfile(GetImageFrom.gallery);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: UploadPhotoWidget(
                    image: image,
                  )),
              const SizedBox(
                height: 53.0,
              ),
              Text(
                userAccount.fullName,
                style: getWhiteTextStyle(
                  fontWeight: FontWeightManager.semiBold,
                  fontSize: FontSizeManager.f22,
                ),
              ),
              const SizedBox(
                height: AppSize.s4,
              ),
              Text(
                '${userAccount.age}, ${userAccount.occupation}',
                style: getDarkGreyTextStyle(),
              ),
              const Spacer(),
              BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
                if (state is AuthLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return CustomButtonWidget(
                    title: 'Update My Profile',
                    onTap: () {
                      if (image == null) {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('No Image Update'),
                          ),
                        );
                        return;
                      }
                      userAccount.imagePath = image?.path;
                      context.read<AuthBloc>().add(RegisterAuthEvent(
                            userAccount: userAccount,
                            isRegister: true,
                          ));
                    });
              }),
              const SizedBox(
                height: AppSize.s20,
              ),
              CustomTextButtonWidget(
                  title: 'Skip for now',
                  onPressed: () {
                    context.read<AuthBloc>().add(RegisterAuthEvent(
                        userAccount: userAccount, isRegister: true));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
