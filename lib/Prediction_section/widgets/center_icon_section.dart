import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CenterIconSection extends StatelessWidget {
  const CenterIconSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(18.w),
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
                blurRadius: 6.r,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: const Icon(Icons.star, color: Colors.yellow, size: 36),
        ),
        SizedBox(height: 12.h),
        Text(
          "Ready to Predict",
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 4.h),
        Text(
          "Generate AI-powered predictions for Bhagyathara",
          style: TextStyle(fontSize: 11.sp, color: Colors.grey[600]),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
