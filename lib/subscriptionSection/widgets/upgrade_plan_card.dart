
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class UpgradePlanCard extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final String price;
//   final String duration;
//   final Color accentColor;
//   final List<String> features;
//   final bool isCurrentPlan;
//   final VoidCallback? onUpgrade;

//   const UpgradePlanCard({
//     super.key,
//     required this.title,
//     required this.subtitle,
//     required this.price,
//     required this.duration,
//     required this.accentColor,
//     required this.features,
//     this.isCurrentPlan = false,
//     this.onUpgrade, required String activePlan,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 250.w,
//       padding: EdgeInsets.all(16.w),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(14.r),
//         border: Border.all(
//           color: isCurrentPlan ? accentColor : Colors.black12,
//           width: isCurrentPlan ? 2 : 1,
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12.withOpacity(0.08),
//             blurRadius: 8,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           if (isCurrentPlan)
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
//               decoration: BoxDecoration(
//                 color: accentColor,
//                 borderRadius: BorderRadius.circular(6.r),
//               ),
//               child: Text(
//                 "current plan",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 10.sp,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//           SizedBox(height: 8.h),
//           Text(
//             title,
//             style: TextStyle(
//               fontWeight: FontWeight.w700,
//               fontSize: 18.sp,
//               color: Colors.black87,
//             ),
//           ),
//           SizedBox(height: 4.h),
//           Text(
//             subtitle,
//             style: TextStyle(fontSize: 13.sp, color: Colors.black54),
//           ),
//           SizedBox(height: 10.h),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Text(
//                 price,
//                 style: TextStyle(
//                   fontSize: 22.sp,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black87,
//                 ),
//               ),
//               SizedBox(width: 4.w),
//               Text(
//                 '/$duration',
//                 style: TextStyle(fontSize: 13.sp, color: Colors.black54),
//               ),
//             ],
//           ),
//           SizedBox(height: 14.h),
//           Expanded(
//             child: ListView.builder(
//               itemCount: features.length,
//               padding: EdgeInsets.zero,
//               physics: const NeverScrollableScrollPhysics(),
//               itemBuilder: (context, i) => Padding(
//                 padding: EdgeInsets.only(bottom: 6.h),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Icon(Icons.check_circle,
//                         color: accentColor, size: 14.sp),
//                     SizedBox(width: 6.w),
//                     Expanded(
//                       child: Text(
//                         features[i],
//                         style: TextStyle(
//                           fontSize: 12.5.sp,
//                           color: Colors.black87,
//                           height: 1.3,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 10.h),
//           SizedBox(
//             width: double.infinity,
//             height: 40.h,
//             child: ElevatedButton(
//               onPressed: onUpgrade,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: accentColor,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8.r),
//                 ),
//               ),
//               child: Text(
//                 "Upgrade Now",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.w600,
//                   fontSize: 13.sp,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpgradePlanCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final String duration;
  final Color accentColor;
  final List<String> features;
  final bool isCurrentPlan;
  final VoidCallback? onUpgrade;
  final String activePlan;

  const UpgradePlanCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.duration,
    required this.accentColor,
    required this.features,
    required this.activePlan,
    this.isCurrentPlan = false,
    this.onUpgrade,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.w,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: isCurrentPlan ? accentColor : Colors.black12,
          width: isCurrentPlan ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isCurrentPlan)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: accentColor,
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Text(
                "current plan",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          SizedBox(height: 8.h),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18.sp,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            subtitle,
            style: TextStyle(fontSize: 13.sp, color: Colors.black54),
          ),
          SizedBox(height: 10.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                price,
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(width: 4.w),
              Text(
                '/$duration',
                style: TextStyle(fontSize: 13.sp, color: Colors.black54),
              ),
            ],
          ),
          SizedBox(height: 14.h),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              children: features.map((feature) => Padding(
                    padding: EdgeInsets.only(bottom: 6.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.check_circle, color: accentColor, size: 14.sp),
                        SizedBox(width: 6.w),
                        Expanded(
                          child: Text(
                            feature,
                            style: TextStyle(
                              fontSize: 12.5.sp,
                              color: Colors.black87,
                              height: 1.3,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )).toList(),
            ),
          ),
          SizedBox(height: 10.h),
          SizedBox(
            width: double.infinity,
            height: 40.h,
            child: ElevatedButton(
              onPressed: onUpgrade,
              style: ElevatedButton.styleFrom(
                backgroundColor: accentColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Text(
                isCurrentPlan ? "Active" : "Upgrade Now",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 13.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
