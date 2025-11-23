import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/network/api_error.dart';
import 'package:hungry_app/features/auth/data/auth_repo.dart';
import 'package:hungry_app/features/auth/views/login_view.dart';
import 'package:hungry_app/features/auth/widgets/custom_auth_button.dart';
import 'package:hungry_app/root.dart';
import 'package:hungry_app/shared/custom_snack.dart';
import 'package:hungry_app/shared/custom_text.dart';
import 'package:hungry_app/shared/custom_textfield.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;
  AuthRepo authRepo = AuthRepo();
  @override
  Widget build(BuildContext context) {
    Future<void> signup() async {
      if (formKey.currentState!.validate()) {
        try {
          setState(() => isLoading = true);
          final user = await authRepo.signup(
            name: nameController.text.trim(),
            email: emailController.text.trim(),
            pass: passController.text.trim(),
          );
          if (user != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Root()),
            );
          }
          setState(() => isLoading = false);
        } catch (e) {
          setState(() => isLoading = false);
          String errMsg = 'Error in Register';
          if (e is ApiError) {
            errMsg = e.message;
          }
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(customSnack(errMsg, Colors.red));
        }
      }
    }

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Gap(100.h),
                Image.asset('assets/home/logo_in_green.png', width: 250.w),
                CustomText(
                  text: 'Welcome to our food app',
                  letterSpace: 0.5,
                  height: 1.4,
                  weight: FontWeight.w600,
                  size: 16.sp,
                ),
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
                            isEmail: false,
                          ),
                          Gap(15.h),
                          CustomTextfield(
                            hint: 'Email Address',
                            isPass: false,
                            controller: emailController,
                            isEmail: true,
                          ),
                          Gap(15.h),
                          CustomTextfield(
                            hint: 'Password',
                            isPass: true,
                            controller: passController,
                            isEmail: false,
                          ),
                          Gap(30.h),
                          isLoading
                              ? CupertinoActivityIndicator()
                              : CustomAuthButton(
                                  text: 'Sign Up',
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      signup();
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
      ),
    );
  }
}
