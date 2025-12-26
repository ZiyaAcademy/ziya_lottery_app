
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AiPredictionTitle extends StatelessWidget {
  const AiPredictionTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, top: 16.h),
      child: Row(
        children: [
          Container(
            height: 35.w,
            width: 35.w,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF66BDFF), Color(0xFF065087)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: const Icon(Icons.auto_awesome, color: Colors.yellow, size: 18),
          ),
          SizedBox(width: 10.w),
          Text(
            "AI POWERED PREDICTIONS",
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
