import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/constants/app_colors.dart';

class ProfileAppbar extends StatelessWidget implements PreferredSizeWidget{
  const ProfileAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xffF3F4F6),
      automaticallyImplyLeading: false,
      actions: [
        Padding(
          padding: EdgeInsetsGeometry.symmetric(
            vertical: 8.h,
            horizontal: 20.w,
          ),
          child: Image.asset(
            'assets/icon/setting.png',
            width: 21.w,
            height: 22.h,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
   @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
