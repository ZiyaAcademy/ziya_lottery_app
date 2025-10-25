import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ziya_lottery_app/Authentication/widgets/custom_button.dart';
import 'package:ziya_lottery_app/Authentication/widgets/custom_outline_button.dart';
import 'package:ziya_lottery_app/Constants/app_colors.dart';
import 'package:ziya_lottery_app/Constants/app_strings.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.gradientLight, AppColors.primaryBlue],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 42.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.welcomeTitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 100.h),

                    // 🔹 Outline Button (Sign In)
                    CustomOutlineButton(
                      text: AppStrings.signIn,
                      onPressed: () {
                        Navigator.pushNamed(context, '/signin');
                      },
                    ),
                    SizedBox(height: 20.h),

                    // 🔹 Filled Button (Sign Up)
                    CustomButton(
                      colors: [AppColors.white],
                      height: 57.h,
                      borderRadius: 50.0.r,
                      text: AppStrings.signUp,
                      textColor: AppColors.black,
                      onPressed: () {
                        Navigator.pushNamed(context, '/forgot-password');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
