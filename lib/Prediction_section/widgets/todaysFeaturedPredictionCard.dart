import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ziya_lottery_app/common_widgets/gradient_container.dart';
import 'package:ziya_lottery_app/constants/app_colors.dart';
import 'package:ziya_lottery_app/constants/app_strings.dart';
import '../view_models/prediction.vm.dart';

class TodaysFeaturedPredictionCard extends StatelessWidget {
  const TodaysFeaturedPredictionCard({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<PredictionViewModel>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🟦 Featured Prediction Card
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColor.withOpacity(0.1),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          padding: EdgeInsets.all(14.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Header Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 4.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                          color: AppColors.primaryBlue,
                          borderRadius: BorderRadius.circular(2.r),
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        AppStrings.todaysFeaturedPrediction,
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryBlue,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 2.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.newGreen,
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Text(
                      AppStrings.newLabel,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10.h),

              Text(
                vm.featuredTitle,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(height: 10.h),

              // 🔢 Numbers Row
              Wrap(
                spacing: 8.w,
                children: vm.predictionNumbers
                    .map(
                      (num) => GradientContainer(
                        height: ScreenUtil().screenWidth > 600 ? 35.h : 25.h,
                        width: 45.w,
                        child: Center(
                          child: Text(
                            num,
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),

              SizedBox(height: 12.h),

              // 📅 Date Row
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    color: AppColors.primaryBlue,
                    size: 16.sp,
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    "${AppStrings.predictedFor} ${vm.predictedForDay}",
                    style: TextStyle(color: AppColors.black54, fontSize: 12.sp),
                  ),
                ],
              ),
            ],
          ),
        ),

        SizedBox(height: 12.h),

        // 🟩 Active Plan Card
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 10.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(14.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColor.withOpacity(0.08),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Text(
            "${AppStrings.yourActivePlan}${vm.activePlan}",
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.black87,
            ),
          ),
        ),
      ],
    );
  }
}
