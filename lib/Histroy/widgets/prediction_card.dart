// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:ziya_lottery_app/Constants/app_colors.dart';
// // // Mocking imports for standalone compilation
// // import 'package:ziya_lottery_app/Histroy/model/prediction_model.dart';
// // class PredictionCard extends StatelessWidget {
// //   final PredictionModel prediction;

// //   const PredictionCard({super.key, required this.prediction});

// //   // Small status tag (Completed/Pending)
// //   Widget _buildStatusTag(String status) {
// //     final isPending = status == 'Pending';
// //     final color = isPending ? AppColors.primaryBlue : AppColors.green;
// //     final text = isPending ? 'Pending' : 'Drawn';

// //     return Container(
// //       padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
// //       decoration: BoxDecoration(
// //         color: color.withOpacity(0.1),
// //         borderRadius: BorderRadius.circular(4.r),
// //         border: Border.all(color: color, width: 0.5),
// //       ),
// //       child: Text(
// //         text.toUpperCase(),
// //         style: TextStyle(
// //           color: color,
// //           fontSize: 10.sp,
// //           fontWeight: FontWeight.bold,
// //         ),
// //       ),
// //     );
// //   }

// //   // Blue 'Plan X' button
// //   Widget _buildPlanButton(String plan, bool isPending) {
// //     final color = isPending ? AppColors.primaryBlue : AppColors.primaryBlue;
    
// //     return Container(
// //       decoration: BoxDecoration(
// //         border: Border.all(color: color.withOpacity(0.5)),
// //         borderRadius: BorderRadius.circular(8.r),
// //         color: color.withOpacity(0.1),
// //       ),
// //       padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
// //       child: Text(
// //         plan,
// //         style: TextStyle(
// //           color: color,
// //           fontSize: 12.sp,
// //           fontWeight: FontWeight.w600,
// //         ),
// //       ),
// //     );
// //   }


// //   @override
// //   Widget build(BuildContext context) {
// //     final isPending = prediction.status == 'Pending';
// //     final resultColor = prediction.result == 'Close Match' ? AppColors.green : AppColors.grey;
    
// //     // Split ticket number for UI style: Prefix (WN/AK/KR/IN) and Number
// //     final ticketPrefix = prediction.ticketNumber.substring(0, 2);
// //     final ticketNumber = prediction.ticketNumber.substring(2);


// //     return Container(
// //       margin: EdgeInsets.only(bottom: 15.h),
// //       padding: EdgeInsets.all(12.w),
// //       decoration: BoxDecoration(
// //         color: AppColors.cardBackground,
// //         borderRadius: BorderRadius.circular(8.r),
// //         border: Border.all(color: AppColors.borderGrey.withOpacity(0.5), width: 1.w),
// //         boxShadow: [
// //           BoxShadow(
// //             color: AppColors.black.withOpacity(0.05),
// //             blurRadius: 5.r,
// //             offset: const Offset(0, 2),
// //           ),
// //         ],
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           // Row 1: Lottery Name, Date, Prize
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Expanded(
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Text(
// //                       prediction.title,
// //                       style: TextStyle(
// //                         fontWeight: FontWeight.bold,
// //                         fontSize: 15.sp,
// //                         color: AppColors.textColorDark,
// //                       ),
// //                     ),
// //                     SizedBox(height: 2.h),
// //                     Text(
// //                       prediction.date,
// //                       style: TextStyle(fontSize: 12.sp, color: AppColors.grey),
// //                     ),
// //                     SizedBox(height: 2.h),
// //                     Text(
// //                       prediction.prize,
// //                       style: TextStyle(fontSize: 13.sp, color: AppColors.grey),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //               Column(
// //                 crossAxisAlignment: CrossAxisAlignment.end,
// //                 children: [
// //                   _buildPlanButton(prediction.plan, isPending),
// //                   SizedBox(height: 8.h),
// //                   _buildStatusTag(prediction.status),
// //                 ],
// //               ),
// //             ],
// //           ),
// //           SizedBox(height: 10.h),

// //           // Row 2: Ticket Number (Inside Blue-Bordered Box)
// //           Container(
// //             width: double.infinity,
// //             padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
// //             decoration: BoxDecoration(
// //               borderRadius: BorderRadius.circular(4.r),
// //               border: Border.all(
// //                 color: AppColors.resultBlue.withOpacity(0.4),
// //                 width: 1.w,
// //               ),
// //             ),
// //             child: Row(
// //               children: [
// //                 Text(
// //                   ticketPrefix,
// //                   style: TextStyle(
// //                     fontSize: 14.sp,
// //                     color: AppColors.grey,
// //                   ),
// //                 ),
// //                 SizedBox(width: 8.w),
// //                 // Ticket Number
// //                 Text(
// //                   ticketNumber,
// //                   style: TextStyle(
// //                     fontSize: 16.sp,
// //                     fontWeight: FontWeight.bold,
// //                     color: AppColors.textColorDark,
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
          
// //           // Row 3: Result Status (only shown if not Pending)
// //           if (!isPending) ...[
// //             SizedBox(height: 10.h),
// //             Text(
// //               'Result: ${prediction.result}',
// //               style: TextStyle(
// //                 fontSize: 14.sp,
// //                 fontWeight: FontWeight.w500,
// //                 color: resultColor,
// //               ),
// //             ),
// //           ],
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:ziya_lottery_app/Constants/app_colors.dart';
// import '../model/prediction_model.dart';

// class PredictionCard extends StatelessWidget {
//   final PredictionModel prediction;

//   const PredictionCard({super.key, required this.prediction});

//   Widget _buildStatusTag(String status) {
//     final isPending = status == 'Pending';
//     final color = isPending ? AppColors.primaryBlue : Colors.green;
//     final text = isPending ? 'Pending' : 'Drawn';

//     return Text(
//       text,
//       style: TextStyle(
//         color: color,
//         fontWeight: FontWeight.w600,
//         fontSize: 11.sp,
//       ),
//     );
//   }

//   Widget _buildPlanBadge(String plan) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
//       decoration: BoxDecoration(
//         border: Border.all(color: AppColors.primaryBlue.withOpacity(0.4)),
//         borderRadius: BorderRadius.circular(20.r),
//       ),
//       child: Text(
//         plan,
//         style: TextStyle(
//           color: AppColors.primaryBlueDark,
//           fontSize: 12.sp,
//           fontWeight: FontWeight.w600,
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isPending = prediction.status == 'Pending';
//     final resultColor =
//         prediction.result == 'Close Match' ? AppColors.green : AppColors.grey;

//     // Split prefix and number safely
//     final ticket = prediction.ticketNumber.trim();
//     String prefix = '';
//     String number = ticket;
//     if (ticket.contains(' ')) {
//       final parts = ticket.split(' ');
//       prefix = parts.first;
//       number = parts.sublist(1).join(' ');
//     } else if (ticket.length > 2) {
//       prefix = ticket.substring(0, 2);
//       number = ticket.substring(2).trim();
//     }

//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
//       padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
//       decoration: BoxDecoration(
//         color: AppColors.cardBackground,
//         borderRadius: BorderRadius.circular(10.r),
//         border: Border.all(
//           color: AppColors.borderGrey.withOpacity(0.4),
//           width: 1,
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Header row (title + plan + status)
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       prediction.title,
//                       style: TextStyle(
//                         fontSize: 15.sp,
//                         fontWeight: FontWeight.w700,
//                         color: AppColors.textColorDark,
//                       ),
//                     ),
//                     SizedBox(height: 6.h),
//                     Row(
//                       children: [
//                         Icon(Icons.calendar_today,
//                             size: 13.w, color: AppColors.grey),
//                         SizedBox(width: 6.w),
//                         Text(
//                           prediction.date,
//                           style:
//                               TextStyle(fontSize: 12.sp, color: AppColors.grey),
//                         ),
//                         SizedBox(width: 10.w),
//                         Flexible(
//                           child: Text(
//                             prediction.prize,
//                             style: TextStyle(
//                               fontSize: 12.sp,
//                               color: AppColors.grey,
//                             ),
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   _buildStatusTag(prediction.status),
//                   SizedBox(height: 4.h),
//                   _buildPlanBadge(prediction.plan),
//                 ],
//               ),
//             ],
//           ),

//           SizedBox(height: 12.h),

//           // Ticket box
//           Container(
//             width: double.infinity,
//             padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(6.r),
//               border: Border.all(
//                   color: AppColors.primaryBlue.withOpacity(0.5), width: 1),
//               color: Colors.white,
//             ),
//             alignment: Alignment.center,
//             child: Text(
//               '$prefix $number',
//               style: TextStyle(
//                 fontSize: 14.5.sp,
//                 fontWeight: FontWeight.w600,
//                 color: AppColors.primaryBlueDark,
//                 letterSpacing: 0.4,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ),

//           if (!isPending) ...[
//             SizedBox(height: 10.h),
//             Row(
//               children: [
//                 Icon(Icons.bar_chart_rounded,
//                     size: 14.w, color: resultColor.withOpacity(0.9)),
//                 SizedBox(width: 6.w),
//                 Text(
//                   'Result: ${prediction.result}',
//                   style: TextStyle(
//                     fontSize: 13.sp,
//                     color: resultColor,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ],
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:ziya_lottery_app/Constants/app_colors.dart';
// import '../model/prediction_model.dart';

// class PredictionCard extends StatelessWidget {
//   final PredictionModel prediction;

//   const PredictionCard({super.key, required this.prediction});

//  Widget _buildStatusTag(String status) {
//   final isPending = status == 'Pending';
//   final color = isPending ? AppColors.primaryBlue : Colors.green;
//   final text = isPending ? 'Pending' : 'Drawn';

//   return Text(
//     text,
//     style: TextStyle(
//       color: color,
//       fontWeight: FontWeight.w600,
//       fontSize: 11.sp,
//       letterSpacing: 0.2,
//     ),
//   );
// }


//   Widget _buildPlanBadge(String plan) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.5.h),
//       decoration: BoxDecoration(
//         color: AppColors.primaryBlue.withOpacity(0.08),
//         border: Border.all(color: AppColors.primaryBlue.withOpacity(0.4)),
//         borderRadius: BorderRadius.circular(20.r),
//       ),
//       child: Text(
//         plan,
//         style: TextStyle(
//           color: AppColors.primaryBlueDark,
//           fontSize: 12.sp,
//           fontWeight: FontWeight.w600,
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isPending = prediction.status == 'Pending';
//     final resultColor =
//         prediction.result == 'Close Match' ? AppColors.green : AppColors.grey;

//     // Split prefix and number safely
//     final ticket = prediction.ticketNumber.trim();
//     String prefix = '';
//     String number = ticket;
//     if (ticket.contains(' ')) {
//       final parts = ticket.split(' ');
//       prefix = parts.first;
//       number = parts.sublist(1).join(' ');
//     } else if (ticket.length > 2) {
//       prefix = ticket.substring(0, 2);
//       number = ticket.substring(2).trim();
//     }

//     return Card(
//   color: Colors.white, // Ensures the card background stays white
//   elevation: 1, // No shadow to match your design
//   shape: RoundedRectangleBorder(
//     borderRadius: BorderRadius.circular(10.r),
//     side: BorderSide(
//       color: AppColors.borderGrey.withOpacity(0.4),
//       width: 1.w,
//     ),
//   ),
//   margin: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
//   child: Padding(
//     padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Header Row: Title + Status/Plan
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     prediction.title,
//                     style: TextStyle(
//                       fontSize: 15.sp,
//                       fontWeight: FontWeight.w700,
//                       color: AppColors.textColorDark,
//                     ),
//                   ),
//                   SizedBox(height: 4.h),
//                   Row(
//                     children: [
//                       Icon(Icons.calendar_today,
//                           size: 13.w, color: AppColors.grey),
//                       SizedBox(width: 6.w),
//                       Flexible(
//                         child: Text(
//                           prediction.date,
//                           style: TextStyle(
//                             fontSize: 12.sp,
//                             color: AppColors.grey,
//                           ),
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                       SizedBox(width: 10.w),
//                       Flexible(
//                         child: Text(
//                           prediction.prize,
//                           style: TextStyle(
//                             fontSize: 12.sp,
//                             color: AppColors.grey,
//                           ),
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 _buildStatusTag(prediction.status),
//                 SizedBox(height: 6.h),
//                 _buildPlanBadge(prediction.plan),
//               ],
//             ),
//           ],
//         ),

//         SizedBox(height: 12.h),

//         // Ticket number box
//         Container(
//           width: double.infinity,
//           padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 9.h),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(6.r),
//             border: Border.all(
//               color: AppColors.primaryBlue.withOpacity(0.4),
//               width: 1.w,
//             ),
//             color: Colors.white,
//           ),
//           alignment: Alignment.center,
//           child: Text(
//             '$prefix $number',
//             style: TextStyle(
//               fontSize: 14.5.sp,
//               fontWeight: FontWeight.w600,
//               color: AppColors.primaryBlueDark,
//               letterSpacing: 0.4,
//             ),
//           ),
//         ),

//         if (!isPending) ...[
//           SizedBox(height: 10.h),
//           Row(
//             children: [
//               Icon(Icons.trending_up,
//                   size: 14.w, color: resultColor.withOpacity(0.9)),
//               SizedBox(width: 6.w),
//               Flexible(
//                 child: Text(
//                   'Result: ${prediction.result}',
//                   style: TextStyle(
//                     fontSize: 13.sp,
//                     color: resultColor,
//                     fontWeight: FontWeight.w600,
//                   ),
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ],
//     ),
//   ),
// );

//   }
// }
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
    final safeTitle = prediction.title.isNotEmpty ? prediction.title : 'Untitled';
    final safeDate = prediction.date.isNotEmpty ? prediction.date : '-';
    final safePrize = prediction.prize.isNotEmpty ? prediction.prize : '-';
    final safeStatus = prediction.status.isNotEmpty ? prediction.status : 'Pending';
    final safeResult = prediction.result.isNotEmpty ? prediction.result : '-';
    final safePlan = prediction.plan.isNotEmpty ? prediction.plan : 'Plan';

    final isPending = safeStatus == 'Pending';
    final resultColor =
        safeResult == 'Close Match' ? AppColors.green : AppColors.grey;

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
                          Icon(Icons.calendar_today,
                              size: 13.w, color: AppColors.grey),
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
                  Icon(Icons.trending_up,
                      size: 16.w, color: resultColor.withOpacity(0.9)),
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
