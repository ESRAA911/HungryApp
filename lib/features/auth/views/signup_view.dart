import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/features/auth/views/login_view.dart';
import 'package:hungry_app/features/auth/widgets/custom_auth_button.dart';
import 'package:hungry_app/shared/custom_text.dart';
import 'package:hungry_app/shared/custom_textfield.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController passController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Gap(100.h),
              Image.asset('assets/home/logo_in_green.png', width: 250.w),
              CustomText(text: 'Welcome to our food app'),
              Gap(120.h),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(35.r),
                      topLeft: Radius.circular(35.r),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Gap(30.h),
                        CustomTextfield(
                          hint: 'Name',
                          isPass: false,
                          controller: nameController,
                        ),
                        Gap(15.h),
                        CustomTextfield(
                          hint: 'Email Address',
                          isPass: false,
                          controller: emailController,
                        ),
                        Gap(15.h),
                        CustomTextfield(
                          hint: 'Password',
                          isPass: true,
                          controller: passController,
                        ),
                        Gap(30.h),
                        CustomAuthButton(
                          text: 'Sign Up',
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              print('Success Register');
                            }
                          },
                        ),
                        Gap(20.h),
                        CustomAuthButton(
                          text: 'Go to login?',
                          color: Colors.transparent,
                          textColor: Colors.white,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return LoginView();
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
