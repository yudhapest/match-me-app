import 'dart:io';

import 'package:flutter/material.dart';
import 'package:match_me/src/common/style.dart';

class UploadPhotoWidget extends StatelessWidget {
  final File? image;
  const UploadPhotoWidget({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 180.0,
          height: 180.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: ColorManager.secondaryColor,
              width: 8.0,
              strokeAlign: BorderSide.strokeAlignOutside,
            ),
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: image != null
                  ? Image(
                      image: FileImage(image!),
                      fit: BoxFit.cover,
                    )
                  : const Image(
                      image: AssetImage(
                        '${AssetImageIconManager.assetPath}avatar.png',
                      ),
                      fit: BoxFit.cover,
                    )),
        ),
        const Positioned(
          bottom: -25.0,
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: Image(
              image: AssetImage(
                  '${AssetImageIconManager.assetPath}icon_plus_border.png'),
            ),
          ),
        ),
      ],
    );
  }
}
