import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ziya_lottery_app/Constants/app_colors.dart';
import 'package:ziya_lottery_app/Home/models/lottery.dart';
import 'package:ziya_lottery_app/common_widgets/gradient_container.dart';

class LotteryGridItem extends StatelessWidget {
  final LotteryModel lottery;

  const LotteryGridItem({super.key, required this.lottery});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      elevation: 2,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GradientContainer(
              height: 50.w,
              width: 50.w,
              child: Image.asset(lottery.iconPath),
            ),
            const SizedBox(height: 8),
            Text(
              lottery.name,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            Text(
              '${lottery.prizes} Prizes',
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
