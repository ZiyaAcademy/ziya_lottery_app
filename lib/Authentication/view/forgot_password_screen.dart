import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ziya_lottery_app/Authentication/view_model/auth_vm.dart';
import 'package:ziya_lottery_app/Authentication/widgets/auth_divider_section.dart';
import 'package:ziya_lottery_app/Authentication/widgets/custom_button.dart';
import 'package:ziya_lottery_app/Authentication/widgets/custom_textfield.dart';
import 'package:ziya_lottery_app/Authentication/widgets/gradient_background.dart';
import 'package:ziya_lottery_app/Constants/app_colors.dart';
import 'package:ziya_lottery_app/Constants/app_strings.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final authVM = Provider.of<AuthViewModel>(context, listen: false);

    return Scaffold(
      body: Stack(
        children: [
          const AuthGradientBackground(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Header Section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 60.h),
                child: Text(
                  AppStrings.forgetPassword,
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
              ),

              // 🔹 Body Section
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
                  child: Consumer<AuthViewModel>(
                    builder: (context, authVM, _) {
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 30.h),

                            // 🔹 Phone Number Field
                            CustomTextField(
                              label: AppStrings.phoneNumber,
                              hint: '0987654321',
                              controller: authVM.phoneController,
                              keyboardType: TextInputType.phone,
                            ),

                            SizedBox(height: 30.h),

                            // 🔹 Send Code Button
                            CustomButton(
                              borderRadius: 50.r,
                              text: authVM.isLoading
                                  ? "Please wait..."
                                  : AppStrings.sentCode,
                              onPressed: authVM.isLoading
                                  ? () {}
                                  : () {
                                      authVM.sendForgotPasswordCode(context);
                                    },
                            ),

                            SizedBox(height: 30.h),

                            // 🔹 Back to Login
                            AuthDividerSection(
                              labelText: AppStrings.backTo,
                              buttonText: AppStrings.login,
                              onButtonPressed: () {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  '/signin',
                                  (route) => false,
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
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
