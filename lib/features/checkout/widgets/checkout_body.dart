import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/features/checkout/widgets/order_details_widget.dart';
import 'package:hungry_app/shared/custom_text.dart';

class CheckoutBody extends StatefulWidget {
  const CheckoutBody({super.key});

  @override
  State<CheckoutBody> createState() => _CheckoutBodyState();
}

class _CheckoutBodyState extends State<CheckoutBody> {
  String selectedItem = 'Cash';
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'Order Summary',
                size: 20.sp,
                weight: FontWeight.w600,
                color: Color(0xff3C2F2F),
              ),
              Gap(10.h),
              OrderDetailsWidget(
                order: '18.5',
                taxes: '3.25',
                fees: '40.1',
                total: '100.00',
              ),

              checkoutWidget(
                'Estimated delivery time: ',
                '15 - 30 mins \$',
                true,
                true,
              ),
              Gap(50.h),
              CustomText(
                text: 'Payment Methods',
                size: 20.sp,
                weight: FontWeight.w500,
              ),
              Gap(20.h),
              ListTile(
                onTap: () => setState(() => selectedItem = 'Cash'),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 5.h,
                  horizontal: 16.w,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                tileColor: Color(0xff3C2F2F),
                title: CustomText(
                  text: 'Cash on Delivery',
                  color: Colors.white,
                  weight: FontWeight.w500,
                  size: 20.sp,
                ),
                trailing: Radio(
                  value: 'Cash',
                  groupValue: selectedItem,
                  activeColor: Colors.white,
                  onChanged: (value) {
                    setState(() {
                      selectedItem = value!;
                    });
                  },
                ),
                leading: Image.asset('assets/icon/dolar_sign.png', width: 50.w),
              ),
              Gap(13.h),
              ListTile(
                onTap: () => setState(() => selectedItem = 'Visa'),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 2.h,
                  horizontal: 16.w,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                tileColor: const Color.fromARGB(255, 4, 27, 61),
                title: CustomText(
                  text: 'Debit card',
                  color: Colors.white,
                  weight: FontWeight.w400,
                  size: 15.sp,
                ),
                subtitle: CustomText(
                  color: Colors.white,
                  text: '**** **** 2342',
                  weight: FontWeight.w500,
                  size: 14.sp,
                ),

                trailing: Radio(
                  value: 'Visa',
                  groupValue: selectedItem,
                  activeColor: Colors.white,
                  onChanged: (value) {
                    setState(() {
                      selectedItem = value!;
                    });
                  },
                ),
                leading: Image.asset(
                  'assets/icon/visa.png',
                  width: 83.w,
                  height: 33.2.h,
                ),
              ),
              Gap(8.h),
              Row(
                children: [
                  Checkbox(
                    activeColor: AppColors.primary,
                    value: check,
                    onChanged: (value) {
                      setState(() {
                        check = value!;
                      });
                    },
                  ),
                  CustomText(
                    text: 'Save card details for future payments',
                    color: Color(0xff808080),
                    weight: FontWeight.w400,
                    size: 16.sp,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  }
}