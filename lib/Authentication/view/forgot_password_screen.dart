import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ziya_lottery_app/Authentication/widgets/custom_button.dart';
import 'package:ziya_lottery_app/Authentication/widgets/custom_textfield.dart';
import 'package:ziya_lottery_app/Authentication/widgets/gradient_background.dart';
import 'package:ziya_lottery_app/Constants/app_colors.dart';
import 'package:ziya_lottery_app/Constants/app_strings.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneController = TextEditingController();

    return Scaffold(
      body: Stack(
        children: [
          AuthGradientBackground(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 35.0.w,
                  vertical: 60.0.h,
                ),
                child: Text(
                  AppStrings.forgetPassword,
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
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
                        CustomTextField(
                          label: AppStrings.phoneNumber,
                          hint: '0987654321',
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                        ),
                        SizedBox(height: 30.h),
                        CustomButton(
                          borderRadius: 50.0.r,
                          text: AppStrings.sentCode,
                          onPressed: () {},
                        ),
                        SizedBox(height: 30.h),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 28.0.w),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                AppStrings.BackToLogin,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColors.green,
                                  color: AppColors.green,
                                ),
                              ),
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
