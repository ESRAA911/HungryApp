import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/network/api_error.dart';
import 'package:hungry_app/features/auth/data/auth_repo.dart';
import 'package:hungry_app/features/auth/widgets/custom_auth_button.dart';
import 'package:hungry_app/root.dart';
import 'package:hungry_app/shared/custom_snack.dart';
import 'package:hungry_app/shared/custom_text.dart';
import 'package:hungry_app/shared/custom_textfield.dart';
import 'package:hungry_app/features/auth/views/signup_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool isLoading = false;
  AuthRepo authRepo = AuthRepo();
  Future<void> login() async {
    setState(() => isLoading = true);
    if (formKey.currentState!.validate()) {
      try {
        final user = await authRepo.login(
          emailController.text.trim(),
          passController.text.trim(),
        );
        if (user != null) {
          Navigator.push(context, MaterialPageRoute(builder: (c) => Root()));
        }
        setState(() => isLoading = false);
      } catch (e) {
        setState(() => isLoading = false);
        String errorMsg = 'unhandeled error in login';
        if (e is ApiError) {
          errorMsg = e.message;
        }
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(customSnack(errorMsg, Colors.red));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Gap(100.h),
                  Image.asset('assets/home/logo_in_green.png', width: 250.w),
                  Gap(10.h),
                  Center(
                    child: CustomText(
                      text: 'Welcome Back, Discover The Fast Food',
                      letterSpace: 0.5,
                      height: 1.4,
                      weight: FontWeight.w600,
                      size: 16.sp,
                    ),
                  ),
                  Gap(100.h),
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
                              hint: 'Email Address',
                              isPass: false,
                              controller: emailController,
                              isEmail: true,
                            ),
                            Gap(20.h),
                            CustomTextfield(
                              hint: 'Password',
                              isPass: true,
                              controller: passController,
                              isEmail: false,
                            ),
                            Gap(30.h),
                            isLoading
                                ? CupertinoActivityIndicator(
                                    color: Colors.white,
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      if (formKey.currentState!.validate()) {
                                        login();
                                      }
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 15.w,
                                        vertical: 15.h,
                                      ),
                                      height: 55.h,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(
                                          16.r,
                                        ),
                                      ),
                                      child: Center(
                                        child: CustomText(
                                          text: 'Login',
                                          weight: FontWeight.bold,
                                          color: AppColors.primary,
                                          size: 16.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                            Gap(20.h),
                            CustomAuthButton(
                              text: 'Create An Account?',
                              color: Colors.transparent,
                              textColor: Colors.white,
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return SignupView();
                                    },
                                  ),
                                );
                              },
                            ),
                            Gap(15.h),
                            GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(builder: (c) => Root()),
                              ),
                              child: CustomText(
                                text: 'Continue as a guest ?',
                                color: Colors.white,
                                size: 16.sp,
                                weight: FontWeight.bold,
                              ),
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
        ),
      ),
    );
  }
}
