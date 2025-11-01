
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ziya_lottery_app/Prediction_section/view_models/prediction.vm.dart';
import 'package:ziya_lottery_app/Prediction_section/widgets/prediction_loading.dart';

class PredictionResultSection extends StatelessWidget {
  final String lotteryName;
  const PredictionResultSection({super.key, required this.lotteryName});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<PredictionViewModel>();

    // Only show the loading animation if a prediction is being generated
    // for the currently active plan tab.
    if (vm.isGeneratingForPlan(vm.activePlan)) return const PredictionLoading();

    final hasResults = vm.hasGeneratedPrediction;

    // This is the main content area showing the status and results.
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // center circle icon
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Color(0xFF66BDFF), Color(0xFF065087)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: const Icon(Icons.star, color: Colors.yellow, size: 36),
          ),
          SizedBox(height: 14.h),
          Text(
            hasResults ? "Prediction Generated" : "Ready to Predict",
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            hasResults
                ? "Here are your AI-powered predictions for $lotteryName"
                : "Generate AI-powered predictions for $lotteryName",
            style: TextStyle(
              color: Colors.black54,
              fontSize: 11.sp,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 22.h),

          if (hasResults) ...[
            Wrap(
              spacing: 12.w,
              runSpacing: 12.h,
              alignment: WrapAlignment.center,
              children: vm.predictionNumbers.map((number) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF1976D2), Color(0xFF2E7D32)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    number,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 20.h),
            Text(
              "AI analyzed recent draw patterns and generated these predictions.",
              style: TextStyle(
                color: Colors.black45,
                fontSize: 10.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ] else
            // Initial placeholder text when no predictions have been generated yet.
            SizedBox(height: 8.h),
        Text(
          "Tap 'Generate Predictions' to start.",
          style: TextStyle(fontSize: 12.sp, color: Colors.black45),
        ),
        ],
      ),
    );
  }
}
