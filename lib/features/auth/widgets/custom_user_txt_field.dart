import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/constants/app_colors.dart';

class CustomUserTxtField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType ? textInputType;
  const CustomUserTxtField({
    super.key,
    required this.controller,
    required this.label,
    this.textInputType
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: AppColors.primary,
      cursorHeight: 20.h,
      keyboardType:textInputType ,
      style: TextStyle(color: AppColors.primary),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: AppColors.primary),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color:  AppColors.primary),
          borderRadius: BorderRadius.circular(15.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color:  AppColors.primary),
          borderRadius: BorderRadius.circular(15.r),
        ),
      ),
    );
  }
}
