import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ziya_lottery_app/Constants/app_colors.dart';
import 'package:ziya_lottery_app/Constants/app_strings.dart';

class VerifySuccsessfullScreen extends StatefulWidget {
  const VerifySuccsessfullScreen({super.key});

  @override
  State<VerifySuccsessfullScreen> createState() =>
      _VerifySuccsessfullScreenState();
}

class _VerifySuccsessfullScreenState extends State<VerifySuccsessfullScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToSignIn();
  }

  void _navigateToSignIn() {
    Future.delayed(const Duration(milliseconds: 1159), () {
      if (mounted) {
        Navigator.pushNamedAndRemoveUntil(context, '/signin', (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 225.h),
          child: Column(
            children: [
              Image.asset(
                'assets/gifs/success.gif',
                width: 255.w,
                height: 255.h,
                scale: 0.3,
              ),
              SizedBox(height: 39.h),
              Text(
                AppStrings.verifySuccess,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 28,
                  color: Color(0XFF448AFF),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                AppStrings.emailSuccessText,
                maxLines: 2,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
