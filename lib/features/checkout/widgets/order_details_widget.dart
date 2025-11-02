import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/shared/custom_text.dart';

class OrderDetailsWidget extends StatelessWidget {
  final String order, taxes, fees, total;
  const OrderDetailsWidget({
    super.key,
    required this.order,
    required this.taxes,
    required this.fees,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        checkoutWidget('Order', order, false, false),
        Gap(10.h),
        checkoutWidget('Taxes', taxes, false, false),
        Gap(10.h),
        checkoutWidget('Delivery fees', fees, false, false),
        Gap(10.h),
        Divider(),
        Gap(10.h),
        checkoutWidget('Total', total, true, false),
        Gap(10.h),
      ],
    );
  }
}

Widget checkoutWidget(title, price, isBold, isSmall) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CustomText(
        text: title,
        size: isSmall ? 12.sp : 15.sp,
        weight: isBold ? FontWeight.bold : FontWeight.w400,
        color: isBold ? Color(0xff3C2F2F) : Color(0xff7D7D7D),
      ),
      CustomText(
        text: '$price \$',
        size: isSmall ? 12.sp : 15.sp,
        weight: isBold ? FontWeight.bold : FontWeight.w400,
        color: isBold ?Color(0xff3C2F2F): Color(0xff7D7D7D),
      ),
    ],
  );
}
