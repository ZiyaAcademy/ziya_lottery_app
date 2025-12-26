import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ziya_lottery_app/Constants/app_colors.dart';
import 'package:ziya_lottery_app/Constants/app_strings.dart';

class RememberMeRow extends StatelessWidget {
  const RememberMeRow({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isTablet = ScreenUtil().screenWidth > 600;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Transform.scale(
          scale: isTablet ? 1.8 : 0.9,
          child: Checkbox(
            value: true,
            activeColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.r),
            ),
            onChanged: (value) {},
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
        Text(
          AppStrings.rememberMe,
          style: TextStyle(
            fontSize: 15.sp,
            color: AppColors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
