import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/network/api_error.dart';
import 'package:hungry_app/features/auth/data/auth_repo.dart';
import 'package:hungry_app/features/auth/data/user_model.dart';
import 'package:hungry_app/features/auth/views/login_view.dart';
import 'package:hungry_app/features/auth/widgets/custom_profile_bottom_sheet.dart';
import 'package:hungry_app/features/auth/widgets/custom_profile_fields.dart';
import 'package:hungry_app/features/auth/widgets/custom_profile_image.dart';
import 'package:hungry_app/features/auth/widgets/profile_appbar.dart';
import 'package:hungry_app/shared/custom_snack.dart';
import 'package:hungry_app/shared/custom_text.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _visa = TextEditingController();
  UserModel? userModel;
  AuthRepo authRepo = AuthRepo();
  String? selectedImage;
  bool isLoading = false;
  bool isGuest = false;
  bool notlogout = false;
  Future<void> autoLogin() async {
    final user = await authRepo.autoLogin();
    setState(() {
      isGuest = authRepo.isGuest;
    });
    if (user != null) {
      setState(() {
        userModel = user;
      });
    }
  }

  //getProfile
  Future<void> getProfileData() async {
    try {
      final user = await authRepo.getProfileData();
      setState(() {
        userModel = user;
      });
    } catch (e) {
      String errorMsg = 'Error in profile';
      if (e is ApiError) {
        errorMsg = e.message;
      }
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(customSnack(errorMsg, Colors.red));
    }
  }

  //update profile
  Future<void> updateProfileData() async {
    try {
      setState(() {
        isLoading = true;
      });
      final user = await authRepo.updateProfile(
        name: _name.text.trim(),
        email: _email.text.trim(),
        address: _address.text.trim(),
        visa: _visa.text.trim(),
        imagePath: selectedImage,
      );
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        customSnack('profile updated succeessfully', Colors.green),
      );
      setState(() {
        userModel = user;
      });
      await getProfileData();
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      String errorMsg = 'Failed to update profile';
      if (e is ApiError) errorMsg = e.message;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(customSnack(errorMsg, Colors.red));
    }
  }

  //logout
  Future<void> logout() async {
    setState(() {
      notlogout = true;
    });
    await authRepo.logout();
    setState(() {
      notlogout = false;
    });
    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginView()),
    );
  }

  // //PickImage
  Future<void> pickImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      setState(() {
        selectedImage = pickedImage.path;
      });
    }
  }

  void initState() {
    autoLogin();
    getProfileData().then((v) {
      _name.text = userModel?.name ?? "Esraa";
      _email.text = userModel?.email ?? "Esraa@gmail.com";
      _address.text = userModel?.address ?? "El-Haram";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isGuest) {
      return Center(child: Text('Guest Mode'));
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: RefreshIndicator(
        color: Colors.white,
        backgroundColor: AppColors.primary,
        onRefresh: getProfileData,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Color(0xffF3F4F6),
          appBar: ProfileAppbar(),
          body: ListView(
            physics: AlwaysScrollableScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Skeletonizer(
                  enabled: userModel == null,
                  child: Column(
                    children: [
                      userModel == null
                          ? CupertinoActivityIndicator()
                          : CustomProfileImage(
                              onPickImage: pickImage,
                              userModel: userModel,
                              selectedImage: selectedImage,
                            ),
                      Gap(10.h),
                      Center(
                        child: CustomText(
                          text: _name.text,
                          color: AppColors.primary,
                          size: 16.sp,
                          weight: FontWeight.bold,
                        ),
                      ),
                      Gap(30.h),
                      CustomProfileFields(
                        name: _name,
                        email: _email,
                        address: _address,
                        visa: _visa,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomSheet: CustomProfileBottomSheet(
            updateProfileData: updateProfileData,
            logout: logout,
            isLoading: isLoading,
            isLogout: notlogout,
          ),
        ),
      ),
    );
  }
}
