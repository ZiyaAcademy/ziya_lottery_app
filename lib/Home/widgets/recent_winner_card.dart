import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ziya_lottery_app/Constants/app_colors.dart';
import 'package:ziya_lottery_app/Constants/app_strings.dart';
import 'package:ziya_lottery_app/Home/models/lottery.dart';
import 'package:ziya_lottery_app/common_widgets/gradient_container.dart';

class RecentWinnerCard extends StatelessWidget {
  final WinnerModel winner;
  final bool fullWidth;

  const RecentWinnerCard({
    super.key,
    required this.winner,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    final double cardWidth = fullWidth ? double.infinity : 330.w;

    return Container(
      width: cardWidth,
      margin: EdgeInsets.symmetric(horizontal: 0.w, vertical: 6.h),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.lightBlue1, AppColors.lightBlue2],
        ),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.borderBlue, width: 2),
      ),
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          /// 🏆 Header Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GradientContainer(
                height: 35.w,
                width: 35.w,
                child: Image.asset('assets/icons/trophy.png'),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      winner.name,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackText,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      winner.lotteryName,
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: AppColors.pinkRed,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Spacer(),

          /// 🎫 Ticket and Location Info Box
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
            padding: EdgeInsets.all(15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Left Info Section
                Expanded(
                  child: Column(
                    children: [
                      /// Ticket number
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 16.w,
                            height: 16.w,
                            decoration: BoxDecoration(
                              color: AppColors.ticketIconBg,
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.confirmation_number_outlined,
                                color: Colors.green,
                                size: 12,
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppStrings.ticketNumber,
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: AppColors.greyText,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                Text(
                                  winner.ticketNumber,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.blackText,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 6.h),

                      /// Location
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 16.w,
                            height: 16.w,
                            decoration: BoxDecoration(
                              color: AppColors.locationIconBg,
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.location_on_outlined,
                                color: Colors.blue,
                                size: 12,
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppStrings.location,
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: AppColors.greyText,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                Text(
                                  winner.location,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.blackText,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                /// Right Prediction Status
                Row(
                  children: [
                    Text(
                      winner.prediction,
                      style: TextStyle(
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(width: 3.w),
                    const Icon(
                      Icons.verified,
                      color: AppColors.verifiedGreen,
                      size: 14,
                    ),
                  ],
                ),
              ],
            ),
          ),

          // SizedBox(height: 4.h),
          Spacer(),
          const Divider(color: AppColors.borderBlue, thickness: 1.0),

          /// 📅 Footer with Date + Verified status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                winner.dateWon.toUpperCase(),
                style: TextStyle(
                  fontSize: 9.sp,
                  color: AppColors.greyText,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 8.w,
                    height: 8.w,
                    decoration: const BoxDecoration(
                      color: AppColors.verifiedGreen,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    AppStrings.verified,
                    style: TextStyle(
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
