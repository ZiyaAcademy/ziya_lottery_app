import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ziya_lottery_app/Constants/app_colors.dart';
import 'package:ziya_lottery_app/Constants/app_strings.dart';

class RememberMeRow extends StatelessWidget {
  const RememberMeRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          value: true,
          activeColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r), // responsive radius
          ),
          onChanged: (value) {},
          materialTapTargetSize:
              MaterialTapTargetSize.shrinkWrap, // tighter fit
        ),
        Text(
          AppStrings.rememberMe,
          style: TextStyle(
            fontSize: 15.sp, // responsive font size
            color: AppColors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
