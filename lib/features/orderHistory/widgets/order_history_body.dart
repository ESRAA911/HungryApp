import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/shared/custom_button.dart';
import 'package:hungry_app/shared/custom_text.dart';

class OrderHistoryBody extends StatelessWidget {
  const OrderHistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: ListView.builder(
          padding: EdgeInsets.only(bottom: 120.h, top: 10.h),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/test/image.png',
                          width: 105.w,
                          height: 100.18.h,
                        ),
                        Column(
                          children: [
                            CustomText(
                              text: 'Hamburger',
                              size: 16.sp,
                              weight: FontWeight.w600,
                              color: Color(0xff3C2F2F),
                            ),
                            CustomText(
                              text: 'Qty : X3',
                              size: 16.sp,
                              color: Color(0xff3C2F2F),
                            ),
                            CustomText(
                              text: 'Price : 20\$',
                              size: 16.sp,
                              color: Color(0xff3C2F2F),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Gap(15.h),
                    Center(
                      child: CustomButton(
                        text: 'Order Again',
                        width: double.infinity,
                        height: 50.h,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
  }
}