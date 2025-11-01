import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ziya_lottery_app/Constants/app_colors.dart';
import 'package:ziya_lottery_app/Constants/app_strings.dart';

class AuthDividerSection extends StatelessWidget {
  final String labelText;
  final String buttonText;
  final VoidCallback onButtonPressed;

  const AuthDividerSection({
    super.key,
    required this.labelText,
    required this.buttonText,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // --- Divider + "OR" section ---
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: 0.5,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.transparent, AppColors.grey],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
              ),
            ),
            SizedBox(width: 50.w),
            Text(
              AppStrings.or,
              style: TextStyle(color: Colors.grey, fontSize: 14.sp),
            ),
            SizedBox(width: 50.w),
            Expanded(
              child: Container(
                height: 0.5,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.grey, AppColors.transparent],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 30.h),

        // --- "Don't have account?" + Button ---
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              labelText,
              style: TextStyle(color: Colors.grey, fontSize: 14.sp),
            ),
            SizedBox(width: 8.w),
            TextButton(
              onPressed: onButtonPressed,
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                buttonText,
                style: TextStyle(
                  color: Color(0xFF81A6EE),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
