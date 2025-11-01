import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ziya_lottery_app/Constants/app_colors.dart';
import 'package:ziya_lottery_app/Constants/app_strings.dart';
import '../ViewModel/lottery_view_model.dart';
import '../models/lottery_result_model.dart';

class ResultsViewContent extends StatelessWidget {
  const ResultsViewContent({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<LotteryViewModel>(context, listen: true);

    // ensure results are loaded (if needed)
    if (vm.results.isEmpty) {
      // fetch once (non-blocking)
      vm.fetchResults();
      // show a simple loader while results populate
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h),
        child: Center(
          child: SizedBox(
            width: 24.w,
            height: 24.w,
            child: CircularProgressIndicator(strokeWidth: 2.w),
          ),
        ),
      );
    }

    return Column(
      children: vm.results.map((r) => _buildPrizeCard(context, r)).toList()
        ..add(
          _buildConsolationCard(
            context,
            '5,000.00',
            List.generate(8, (_) => 'DY86758'),
          ),
        ),
    );
  }

  Widget _buildPrizeCard(BuildContext context, LotteryResult r) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4.r,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 8.h),
            decoration: BoxDecoration(
              color: AppColors.resultBlue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
            ),
            child: Text(
              r.prizeTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.textColorLight,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            child: Column(
              children: [
                Text(
                  '\$${r.amount}/-',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textColorDark,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  r.number,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w900,
                    color: const Color.fromARGB(221, 17, 15, 15),
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  r.location,
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConsolationCard(
    BuildContext context,
    String amount,
    List<String> numbers,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4.r,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 8.h),
            decoration: BoxDecoration(
              color: AppColors.resultBlue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r),
                topRight: Radius.circular(8.r),
              ),
            ),
            child: Text(
              AppStrings.consolationPrize,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.textColorLight,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Text(
              '\$${amount}/-',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textColorDark,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Table(
              columnWidths: const {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(1),
              },
              children: List.generate((numbers.length / 2).ceil(), (index) {
                int i1 = index * 2;
                int i2 = i1 + 1;
                return TableRow(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade200, width: 1),
                    ),
                  ),
                  children: [
                    _buildNumberCell(numbers[i1]),
                    i2 < numbers.length
                        ? _buildNumberCell(numbers[i2])
                        : Container(),
                  ],
                );
              }),
            ),
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }

  Widget _buildNumberCell(String number) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Text(
        number,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }
}
