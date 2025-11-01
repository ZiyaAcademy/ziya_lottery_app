import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ziya_lottery_app/Authentication/view_model/auth_vm.dart';
import 'package:ziya_lottery_app/Authentication/widgets/auth_divider_section.dart';
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
    final authVM = Provider.of<AuthViewModel>(context);

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
                              CustomTextField(
                                label: AppStrings.phoneNumber,
                                hint: '0987654321',
                                controller: authVM.phoneController,
                                keyboardType: TextInputType.phone,
                              ),
                              SizedBox(height: 20.h),
                              CustomTextField(
                                label: AppStrings.password,
                                hint: '******',
                                controller: authVM.passwordController,
                                obscure: !authVM.isPasswordVisible,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: authVM.toggleRememberMe,
                              child: const RememberMeRow(),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pushNamed(
                                context,
                                '/forgot-password',
                              ),
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
                        CustomButton(
                          borderRadius: 50.0.r,
                          text: AppStrings.signIn,
                          onPressed: () => authVM.signIn(context),
                        ),
                        SizedBox(height: 20.h),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 28.0.w),
                            child: Column(
                              children: [
                                AuthDividerSection(
                                  labelText: AppStrings.dontHaveAccount,
                                  buttonText: AppStrings.noAccount,
                                  onButtonPressed: () {
                                    Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      '/signup',
                                      (route) => false,
                                    );
                                  },
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
