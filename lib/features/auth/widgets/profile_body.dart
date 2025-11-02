import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/features/auth/widgets/custom_user_txt_field.dart';
import 'package:hungry_app/shared/custom_text.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
    final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _address = TextEditingController();
   void initState() {
    _name.text = "Esraa";
    _email.text = "Esraa@gmail.com";
    _address.text = "El haram";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            Center(
              child: Container(
                height: 120.h,
                width: 120.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://thumbs.dreamstime.com/z/default-avatar-profile-vector-user-profile-default-avatar-profile-vector-user-profile-profile-179376714.jpg?ct=jpeg',
                    ),
                  ),
                  border: Border.all(width: 5.w, color: Colors.white),
                  borderRadius: BorderRadius.circular(15.r),
                  color: Colors.grey.shade100,
                ),
              ),
            ),
            Gap(30.h),
            CustomUserTxtField(controller: _name, label: 'Name'),
            Gap(25.h),
            CustomUserTxtField(controller: _email, label: 'Email'),
            Gap(25.h),
            CustomUserTxtField(controller: _address, label: 'Delivery address'),
            Gap(20.h),
            Divider(color: Colors.white, thickness: 0.3),
            Gap(20.h),
            ListTile(
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
                text: '**** **** 2342',
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
        ),
      );
  }
}