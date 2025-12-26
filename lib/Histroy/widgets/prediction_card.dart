import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ziya_lottery_app/Constants/app_colors.dart';
import '../model/prediction_model.dart';

class PredictionCard extends StatelessWidget {
  final PredictionModel prediction;

  const PredictionCard({super.key, required this.prediction});

  Widget _buildStatusTag(String status) {
    final isPending = status == 'Pending';
    final color = isPending ? AppColors.primaryBlue : Colors.green;
    final text = isPending ? 'Pending' : 'Drawn';

    return Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w600,
        fontSize: 11.sp,
        letterSpacing: 0.2,
      ),
    );
  }

  Widget _buildPlanBadge(String plan) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.5.h),
      decoration: BoxDecoration(
        color: AppColors.primaryBlue.withOpacity(0.08),
        border: Border.all(color: AppColors.primaryBlue.withOpacity(0.4)),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        plan,
        style: TextStyle(
          color: AppColors.primaryBlueDark,
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Safeguard for data integrity (prevents runtime crashes)
    final safeTitle = prediction.title.isNotEmpty
        ? prediction.title
        : 'Untitled';
    final safeDate = prediction.date.isNotEmpty ? prediction.date : '-';
    final safePrize = prediction.prize.isNotEmpty ? prediction.prize : '-';
    final safeStatus = prediction.status.isNotEmpty
        ? prediction.status
        : 'Pending';
    final safeResult = prediction.result.isNotEmpty ? prediction.result : '-';
    final safePlan = prediction.plan.isNotEmpty ? prediction.plan : 'Plan';

    final isPending = safeStatus == 'Pending';
    final resultColor = safeResult == 'Close Match'
        ? AppColors.green
        : AppColors.grey;

    // Safe ticket parsing (prevents substring/trim exceptions)
    final ticket = prediction.ticketNumber.trim();
    String prefix = '';
    String number = ticket;
    if (ticket.contains(' ')) {
      final parts = ticket.split(' ');
      prefix = parts.first;
      number = parts.sublist(1).join(' ');
    } else if (ticket.length > 2) {
      prefix = ticket.substring(0, 2);
      number = ticket.substring(2).trim();
    }

    return Card(
      color: Colors.white,
      elevation: 1,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
        side: BorderSide(
          color: AppColors.borderGrey.withOpacity(0.4),
          width: 1.w,
        ),
      ),
      margin: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row: Title + Status + Plan
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        safeTitle,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textColorDark,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 13.w,
                            color: AppColors.grey,
                          ),
                          SizedBox(width: 6.w),
                          Flexible(
                            child: Text(
                              safeDate,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: AppColors.grey,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Flexible(
                            child: Text(
                              safePrize,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: AppColors.grey,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildStatusTag(safeStatus),
                    SizedBox(height: 6.h),
                    _buildPlanBadge(safePlan),
                  ],
                ),
              ],
            ),

            SizedBox(height: 12.h),

            // Ticket Number Box
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 9.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                border: Border.all(
                  color: AppColors.primaryBlue.withOpacity(0.4),
                  width: 1.w,
                ),
                color: Colors.white,
              ),
              alignment: Alignment.center,
              child: Text(
                '$prefix $number',
                style: TextStyle(
                  fontSize: 14.5.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryBlueDark,
                  letterSpacing: 0.4,
                ),
              ),
            ),

            // Result Row (Only when not Pending)
            if (!isPending) ...[
              SizedBox(height: 10.h),
              Row(
                children: [
                  Icon(
                    Icons.trending_up,
                    size: 16.w,
                    color: resultColor.withOpacity(0.9),
                  ),
                  SizedBox(width: 6.w),
                  Flexible(
                    child: Text(
                      'Result: $safeResult',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: resultColor,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
