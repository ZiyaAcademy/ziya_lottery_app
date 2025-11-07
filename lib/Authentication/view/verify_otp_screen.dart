import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:ziya_lottery_app/Authentication/view_model/auth_vm.dart';
import 'package:ziya_lottery_app/Authentication/widgets/custom_button.dart';
import 'package:ziya_lottery_app/Authentication/widgets/gradient_background.dart';
import 'package:ziya_lottery_app/Constants/app_colors.dart';
import 'package:ziya_lottery_app/Constants/app_strings.dart';

class VerifyOtpView extends StatelessWidget {
  const VerifyOtpView({super.key});

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
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 50.0.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 28,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.h,
                        vertical: 15.h,
                      ),
                      child: Text(
                        AppStrings.verifyyouraccount,
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // 🔹 Body Section
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 40.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.r),
                      topRight: Radius.circular(40.r),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 30.h),

                          // 🔹 OTP Input Field
                          PinCodeTextField(
                            appContext: context,
                            length: 4,
                            keyboardType: TextInputType.number,
                            autoFocus: true,
                            controller: authVM.otpController,
                            animationType: AnimationType.fade,
                            onChanged: (value) {
                              authVM.otpCode = value;
                            },
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(2.r),
                              fieldHeight: 60.h,
                              fieldWidth: 60.w,
                              activeFillColor: AppColors.white,
                              inactiveFillColor: AppColors.white,
                              selectedFillColor: AppColors.white,
                              inactiveColor: AppColors.grey,
                              selectedColor: AppColors.grey,
                              activeColor: AppColors.grey,
                            ),
                            enableActiveFill: true,
                          ),

                          SizedBox(height: 10.h),

                          // 🔹 Resend & Timer Row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  'Resend OTP',
                                  style: TextStyle(
                                    color: const Color.fromARGB(255, 246, 1, 1),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Text(
                                '1:25',
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 5, 32, 90),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 30.h),

                          // 🔹 Verify Button
                          CustomButton(
                            borderRadius: 50.r,
                            text: AppStrings.verify,
                            onPressed: () {
                              authVM.verifyOtp(context, authVM.otpCode);
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
