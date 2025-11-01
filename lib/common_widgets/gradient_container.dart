import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradientContainer extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;

  const GradientContainer({
    super.key,
    required this.child,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.0.w),
      height: height,
      width: width,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF065087), Color(0xFF66BDFF)],
          begin: Alignment.bottomCenter,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(8.0.r),
      ),
      child: child,
    );
  }
}
