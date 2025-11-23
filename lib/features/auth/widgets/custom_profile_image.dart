import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/features/auth/data/user_model.dart';

class CustomProfileImage extends StatelessWidget {
  final UserModel ? userModel;
  final String ? selectedImage;
  final VoidCallback onPickImage;
  const CustomProfileImage({super.key, this.userModel, this.selectedImage, required this.onPickImage});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => Dialog(
                  backgroundColor: Colors.transparent,
                  child: InteractiveViewer(
                    child: selectedImage != null
                        ? Image.file(File(selectedImage!), fit: BoxFit.cover)
                        : (userModel?.image != null &&
                              userModel!.image!.isNotEmpty)
                        ? Image.network(
                            userModel!.image!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, err, builder) =>
                                Icon(Icons.person),
                          )
                        : Icon(Icons.person),
                  ),
                ),
              );
            },
            child: Container(
              height: 120.h,
              width: 120.w,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: FileImage(File(selectedImage ?? "")),
                ),
                border: Border.all(width: 5.w, color: Colors.white),
                color: Colors.grey.shade100,
              ),
              child: selectedImage != null
                  ? Image.file(File(selectedImage!), fit: BoxFit.cover)
                  : (userModel?.image != null && userModel!.image!.isNotEmpty)
                  ? Image.network(
                      userModel!.image!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, err, builder) =>
                          Icon(Icons.person),
                    )
                  : Icon(Icons.person),
            ),
          ),
        ),
        Positioned(
          top: 85.h,
          left: 180.w,
          child: IconButton(
            onPressed: onPickImage,
            icon: Icon(CupertinoIcons.camera_fill, color: AppColors.primary),
          ),
        ),

      ],
    );
  }
}
