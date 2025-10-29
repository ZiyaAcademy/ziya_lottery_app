import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ziya_lottery_app/Constants/app_colors.dart';
import 'package:ziya_lottery_app/Home/models/lottery.dart';
import 'package:ziya_lottery_app/Prediction_section/view_models/prediction.vm.dart';
import 'package:ziya_lottery_app/common_widgets/gradient_container.dart';
import 'package:ziya_lottery_app/common_widgets/gradient_header.dart';

class PredictionCategoryScreen extends StatelessWidget {
  final LotteryModel lottery;

  const PredictionCategoryScreen({super.key, required this.lottery});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<PredictionViewModel>(context);
    final prizes = vm.getPrizesForLottery(lottery.name);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🟦 Gradient Header
          GradientHeader(
            child: Padding(
              padding: EdgeInsets.only(bottom: 30.0.h, top: 0.0.h),
              child: SafeArea(
                bottom: false,
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 28,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      padding: EdgeInsets.all(20.w),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(lottery.iconPath, height: 45.h),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      lottery.name,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Select a prize to get predictions",
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(height: 20.h),

          // 🏆 Prize Categories Section
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 25.w,
                        width: 2.w,
                        decoration: const BoxDecoration(
                          color: Color(0XFF1976D2),
                        ),
                      ),
                      SizedBox(width: 5.w),
                      const Text(
                        "AVAILABLE PRIZES CATEGORIES",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),

                  // 🏅 List of prize cards
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: prizes.length,
                      itemBuilder: (context, index) {
                        final prize = prizes[index];
                        return Container(
                          //padding: EdgeInsets.symmetric(vertical: 5.h),
                          margin: EdgeInsets.only(bottom: 12.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // 🟦 Left stripe + icon + text
                              Row(
                                children: [
                                  // Blue vertical stripe
                                  Container(
                                    width: 5.w,
                                    height: 80.h,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF1976D2),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.r),
                                        bottomLeft: Radius.circular(10.r),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10.w),

                                  // 🏆 Icon + Text
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 10.h,
                                    ),
                                    child: Row(
                                      children: [
                                        GradientContainer(
                                          height: 40.w,
                                          width: 40.w,
                                          child: Image.asset(
                                            lottery.iconPath,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        SizedBox(width: 10.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              prize["title"] ?? "",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14.sp,
                                                color: Colors.black87,
                                              ),
                                            ),
                                            SizedBox(height: 3.h),
                                            Text(
                                              prize["amount"] ?? "",
                                              style: TextStyle(
                                                fontSize: 11.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.green,
                                              ),
                                            ),
                                            SizedBox(height: 3.h),
                                            Text(
                                              prize["drawDate"] ?? "",
                                              style: TextStyle(
                                                fontSize: 10.sp,
                                                color: Colors.black54,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              // 🔵 Predict Button
                              Padding(
                                padding: EdgeInsets.only(right: 12.w),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 18.w,
                                      vertical: 5.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF1976D2),
                                      borderRadius: BorderRadius.circular(4.r),
                                    ),
                                    child: const Text(
                                      "PREDICT",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
