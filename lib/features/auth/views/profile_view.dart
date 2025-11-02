import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/features/auth/widgets/profile_body.dart';
import 'package:hungry_app/features/auth/widgets/profile_buttom_sheet.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
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
            ),
          ),
        ],
      ),
      body: 
      ProfileBody(),
      bottomSheet: ProfileButtomSheet()
    );
  }
}
