import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ziya_lottery_app/Authentication/widgets/custom_button.dart';
import 'package:ziya_lottery_app/Authentication/widgets/custom_textfield.dart';
import 'package:ziya_lottery_app/Authentication/widgets/gradient_background.dart';
import 'package:ziya_lottery_app/Authentication/widgets/remember_me_widget.dart';
import 'package:ziya_lottery_app/Constants/app_colors.dart';
import 'package:ziya_lottery_app/Constants/app_strings.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneController = TextEditingController();
    final passController = TextEditingController();

    return Scaffold(
      body: Stack(
        children: [
          const AuthGradientBackground(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 60.h),
                child: Text(
                  AppStrings.helloSignIn,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.w,
                    vertical: 40.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.r),
                      topRight: Radius.circular(40.r),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                          child: Column(
                            children: [
                              // 🔹 Phone Number
                              CustomTextField(
                                label: AppStrings.phoneNumber,
                                hint: '0987654321',
                                controller: phoneController,
                                keyboardType: TextInputType.phone,
                              ),
                              SizedBox(height: 20.h),
                              // 🔹 Password
                              CustomTextField(
                                label: AppStrings.password,
                                hint: '******',
                                controller: passController,
                                obscure: true,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const RememberMeRow(),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  '/forgot-password',
                                );
                              },
                              child: Text(
                                AppStrings.forgetPass,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        // 🔹 Sign In Button
                        CustomButton(text: AppStrings.signIn, onPressed: () {}),
                        SizedBox(height: 20.h),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 28.0.w),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 1,
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              AppColors.transparent,
                                              AppColors.grey,
                                            ],
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 50.w),
                                    Text(
                                      AppStrings.or,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    SizedBox(width: 50.w),
                                    Expanded(
                                      child: Container(
                                        height: 1,
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              AppColors.grey,
                                              AppColors.transparent,
                                            ],
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      AppStrings.dontHaveAccount,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    SizedBox(width: 8.w),
                                    TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                        minimumSize: Size.zero,
                                        tapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                      ),
                                      child: Text(
                                        AppStrings.noAccount,
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
