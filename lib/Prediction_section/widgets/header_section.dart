import 'package:ziya_lottery_app/common_widgets/gradient_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderSection extends StatelessWidget {
  final String name;
  final String prize;
  final String amount;

  const HeaderSection({
    super.key,
    required this.name,
    required this.prize,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return GradientHeader(
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.only(bottom: 24.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                width: 64.w,
                height: 64.w,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(14.r),
                  border: Border.all(color: Colors.white70, width: 1.5),
                ),
                child: const Icon(
                  Icons.emoji_events,
                  color: Colors.amber,
                  size: 36,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                prize,
                style: TextStyle(color: Colors.white70, fontSize: 12.sp),
              ),
              Text(
                amount,
                style: TextStyle(
                  color: const Color(0xFF5AE868),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
