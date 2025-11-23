import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/features/auth/data/user_model.dart';
import 'package:hungry_app/features/auth/widgets/custom_user_txt_field.dart';
import 'package:hungry_app/shared/custom_text.dart';

class CustomProfileFields extends StatelessWidget {
  final TextEditingController name;
  final TextEditingController email;
  final TextEditingController address;
  final TextEditingController visa;
  final UserModel ? userModel;
  const CustomProfileFields({super.key, required this.name, required this.email, required this.address, this.userModel, required this.visa});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomUserTxtField(controller: name, label: 'Name'),
        Gap(25.h),
        CustomUserTxtField(controller: email, label: 'Email'),
        Gap(25.h),
        CustomUserTxtField(controller: address, label: 'Delivery address'),
        Gap(20.h),
        Divider(color: AppColors.primary, thickness: 0.3),
        Gap(20.h),
        (userModel?.visa == null || userModel!.visa!.isEmpty)
            ? CustomUserTxtField(
                controller: visa,
                label: 'ADD VISA CARD',
                textInputType: TextInputType.number,
              )
            : ListTile(
                onTap: () => {},
                contentPadding: EdgeInsets.symmetric(
                  vertical: 2.h,
                  horizontal: 16.w,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                tileColor: Color(0xffF3F4F6),
                title: CustomText(
                  text: 'Debit card',
                  color: Colors.black,
                  weight: FontWeight.w400,
                  size: 15.sp,
                ),
                subtitle: CustomText(
                  color: Color(0xff808080),
                  text: userModel?.visa ?? 'No card',
                  weight: FontWeight.w500,
                  size: 14.sp,
                ),
                trailing: CustomText(text: 'Default'),
                leading: Image.asset(
                  'assets/icon/visa.png',
                  width: 83.w,
                  height: 33.2.h,
                ),
              ),
      ],
    );
  }
}
