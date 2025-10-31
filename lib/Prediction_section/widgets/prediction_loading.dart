
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PredictionLoading extends StatelessWidget {
  const PredictionLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360.h,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Replace with your own animation asset if available
            SizedBox(
              width: 140.w,
              height: 140.w,
              child: Image.asset('assets/prediction_loading.gif', fit: BoxFit.contain),
            ),
            SizedBox(height: 16.h),
            const CircularProgressIndicator(
              strokeWidth: 3,
              color: Color(0xFF1976D2),
            ),
            SizedBox(height: 12.h),
            Text(
              "Generating AI-powered Predictions...",
              style: TextStyle(fontSize: 12.sp, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
