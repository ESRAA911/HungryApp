import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/shared/custom_text.dart';

class CustomAuthButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final Color? color;
  final Color? textColor;
  final double? radius;
  const CustomAuthButton({
    super.key,
    this.onTap,
    required this.text,
    this.color,
    this.textColor,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        height: 55.h,
        width: double.infinity,

        decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius: BorderRadius.circular(radius ?? 16.0.r),
          border: Border.all(color: Colors.white),
        ),
        child: Center(
          child: CustomText(
            text: text,
            weight: FontWeight.bold,
            color: textColor ?? AppColors.primary,
            size: 15.sp,
          ),
        ),
      ),
    );
  }
}
