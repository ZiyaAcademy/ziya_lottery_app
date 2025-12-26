import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ziya_lottery_app/Authentication/view_model/auth_vm.dart';
import 'package:ziya_lottery_app/Authentication/widgets/auth_divider_section.dart';
import 'package:ziya_lottery_app/Authentication/widgets/custom_button.dart';
import 'package:ziya_lottery_app/Authentication/widgets/custom_textfield.dart';
import 'package:ziya_lottery_app/Authentication/widgets/gradient_background.dart';
import 'package:ziya_lottery_app/Constants/app_strings.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final authVM = Provider.of<AuthViewModel>(context);

    return Scaffold(
      body: Stack(
        children: [
          AuthGradientBackground(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.h),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  AppStrings.createAccount,
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 50.h),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.r),
                      topRight: Radius.circular(40.r),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.h),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10.h),
                          CustomTextField(
                            hint: 'Nainul Abid',
                            controller: authVM.nameController,
                            label: 'Full Name',
                          ),
                          SizedBox(height: 10.h),
                          CustomTextField(
                            hint: 'Kerala',
                            controller: authVM.locationController,
                            label: 'Location',
                          ),
                          SizedBox(height: 10.h),
                          CustomTextField(
                            hint: '9207846064',
                            controller: authVM.phoneController,
                            keyboardType: TextInputType.phone,
                            label: 'Phone Number',
                          ),
                          SizedBox(height: 10.h),
                          CustomTextField(
                            label: 'Password',
                            hint: 'Enter your password',
                            controller: authVM.passwordController,
                            obscure: !authVM.isPasswordVisible,
                          ),
                          SizedBox(height: 10.h),
                          CustomTextField(
                            obscure: !authVM.isConfirmPasswordVisible,
                            hint: '*****',
                            controller: authVM.confirmPasswordController,
                            label: 'Confirm Password',
                          ),
                          SizedBox(height: 20.h),
                          CustomButton(
                            borderRadius: 50.r,
                            text: "SIGN UP",
                            onPressed: () => authVM.signUp(context),
                          ),
                          SizedBox(height: 20.h),
                          AuthDividerSection(
                            labelText: 'Have an account?',
                            buttonText: 'Login',
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
