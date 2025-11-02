import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/features/product/widgets/spicy_slider.dart';
import 'package:hungry_app/features/product/widgets/topping_card.dart';
import 'package:hungry_app/shared/custom_text.dart';

class ProductDetailsBody extends StatefulWidget {
  const ProductDetailsBody({super.key});

  @override
  State<ProductDetailsBody> createState() => _ProductDetailsBodyState();
}

class _ProductDetailsBodyState extends State<ProductDetailsBody> {
    double _value = 0.5;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SpicySlider(
              value: _value,
              onChanged: (v) {
                setState(() {
                  _value = v;
                });
              },
            ),
            Gap(30.h),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: CustomText(
                text: 'Toppings',
                size: 20.sp,
                color: Color(0xff3C2F2F),
                weight: FontWeight.w600,
              ),
            ),
            Gap(10.h),

            SingleChildScrollView(
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(6, (index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                    child: ToppingCard(
                      image: 'assets/test/tomato.png',
                      title: 'Tomato',
                      onTap: () {},
                    ),
                  );
                }),
              ),
            ),
            Gap(30.h),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: CustomText(
                text: 'Side options',
                size: 20.sp,
                color: Color(0xff3C2F2F),
                weight: FontWeight.w600,
              ),
            ),
            Gap(10.h),
            SingleChildScrollView(
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(6, (index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                    child: ToppingCard(
                      image: 'assets/test/tomato.png',
                      title: 'Tomato',
                      onTap: () {},
                    ),
                  );
                }),
              ),
            ),
            Gap(160.h),
          ],
        ),
      );
  }
}