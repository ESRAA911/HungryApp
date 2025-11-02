import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/features/checkout/widgets/success_dialog.dart';
import 'package:hungry_app/shared/custom_button.dart';
import 'package:hungry_app/shared/custom_text.dart';

class CheckoutBottomSheet extends StatelessWidget {
  const CheckoutBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 160.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 15.r,
              offset: Offset(1.w, -3.h),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Total Price',
                    size: 18.sp,
                    weight: FontWeight.w600,
                  ),
                  CustomText(
                    text: "\$18.19",
                    size: 32.sp,
                    weight: FontWeight.w400,
                  ),
                ],
              ),
              Gap(50.w),
              Padding(
                padding: EdgeInsets.only(bottom: 40.h),
                child: CustomButton(
                  text: 'Pay Now',
                  height: 60.h,
                  width: 160.w,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return SuccessDialog();
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
  }
}