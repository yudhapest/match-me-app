import 'package:flutter/material.dart';
import 'package:match_me/src/common/style.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String labelName;
  final String hintext;
  final bool isObsecure;
  final TextEditingController controller;

  const CustomTextFieldWidget({
    super.key,
    required this.labelName,
    required this.hintext,
    this.isObsecure = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelName,
          style: getWhiteTextStyle(),
        ),
        const SizedBox(
          height: AppSize.s8,
        ),
        TextField(
          controller: controller,
          obscureText: isObsecure,
          style: getWhiteTextStyle(),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: AppPadding.p16,
              horizontal: AppPadding.p30,
            ),
            filled: true,
            fillColor: ColorManager.secondaryColor,
            hintText: hintext,
            hintStyle: getDarkGreyTextStyle(),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSize.s50),
            ),
          ),
        ),
        const SizedBox(
          height: AppSize.s14,
        )
      ],
    );
  }
}
