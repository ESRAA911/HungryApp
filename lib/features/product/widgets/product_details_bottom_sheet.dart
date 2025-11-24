import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/shared/custom_button.dart';
import 'package:hungry_app/shared/custom_text.dart';

class ProductDetailsBottomSheet extends StatelessWidget {
  const ProductDetailsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 17.h),
      height: 125.h,

      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 10.r,
            offset: Offset(0.w, -3.h),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'Total',
                size: 18.sp,
                weight: FontWeight.w600,
                color: Colors.white,
              ),
              CustomText(
                text: "\$18.19",
                size: 25.sp,
                weight: FontWeight.w400,
                color: Colors.white,
              ),
            ],
          ),
          Gap(50.w),
          Padding(
            padding: EdgeInsets.only(bottom: 25.h),
            child: CustomButton(
              text: 'Add To Chart',
              textColor: AppColors.primary,
              width: 140.w,
              height: 50.h,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
