// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import 'package:ziya_lottery_app/Home/view_models/home_vm.dart';

// class PlanCard extends StatelessWidget {
//   final String currentPlan;
//   final bool hasFreePlan;
//   final bool isPlanExpired;

//   const PlanCard({
//     super.key,
//     required this.currentPlan,
//     required this.hasFreePlan,
//     required this.isPlanExpired,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final homeViewModel = Provider.of<HomeViewModel>(context);
//     final purchasedPlan = homeViewModel.purchasedPlan;

//     final planTextColor = isPlanExpired
//         ? const Color(0xFFFCC21B)
//         : Colors.green;
//     final planStatusColor = isPlanExpired ? Colors.red : Colors.white70;
//     final planStatusText = isPlanExpired
//         ? "Limited access over"
//         : purchasedPlan != null
//         ? "10 chances"
//         : "Limited access";
//     return Padding(
//       padding: EdgeInsets.only(bottom: 10.0.sp),
//       child: Container(
//         height: 60,
//         decoration: BoxDecoration(
//           color: Colors.white.withOpacity(0.2),
//           borderRadius: BorderRadius.circular(15),
//           border: Border.all(color: Colors.white),
//         ),
//         padding: const EdgeInsets.only(left: 18, right: 8),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             // Left Info
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   purchasedPlan != null ? 'Active plan' : 'Current plan',
//                   style: TextStyle(
//                     color: purchasedPlan != null
//                         ? Color.fromARGB(255, 0, 255, 26)
//                         : Colors.white,
//                     fontSize: 14,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   planStatusText,
//                   style: TextStyle(color: planStatusColor, fontSize: 10),
//                 ),
//               ],
//             ),

//             // Right Section
//             if (isPlanExpired)
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset("assets/icons/crown_icon.png", scale: 1.8),
//                   const SizedBox(height: 2),
//                   Text(
//                     "Upgrade Plan",
//                     style: TextStyle(color: planTextColor, fontSize: 12),
//                   ),
//                 ],
//               )
//             else if (hasFreePlan)
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                 decoration: BoxDecoration(
//                   color: planTextColor,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Text(
//                   currentPlan,
//                   style: const TextStyle(color: Colors.white, fontSize: 10),
//                 ),
//               )
//             else if (purchasedPlan != null)
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(purchasedPlan["icon"]!, height: 20, width: 20),
//                   const SizedBox(width: 6),
//                   Text(
//                     purchasedPlan["name"]!,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 12,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               )
//             else
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                 decoration: BoxDecoration(
//                   color: planTextColor,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Text(
//                   currentPlan,
//                   style: const TextStyle(color: Colors.white, fontSize: 10),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ziya_lottery_app/Constants/app_colors.dart';
import 'package:ziya_lottery_app/Constants/app_strings.dart';
import 'package:ziya_lottery_app/Home/view_models/home_vm.dart';

class PlanCard extends StatelessWidget {
  final String currentPlan;
  final bool hasFreePlan;
  final bool isPlanExpired;

  const PlanCard({
    super.key,
    required this.currentPlan,
    required this.hasFreePlan,
    required this.isPlanExpired,
  });

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);
    final purchasedPlan = homeViewModel.purchasedPlan;

    final planTextColor = isPlanExpired ? AppColors.yellow : AppColors.green;
    final planStatusColor = isPlanExpired ? AppColors.red : AppColors.white70;

    final planStatusText = isPlanExpired
        ? AppStrings.limitedAccessOver
        : purchasedPlan != null
        ? AppStrings.tenChances
        : AppStrings.limitedAccess;

    return Padding(
      padding: EdgeInsets.only(bottom: 10.sp),
      child: Container(
        height: 60.h,
        decoration: BoxDecoration(
          color: AppColors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: AppColors.white),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// Left Info
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  purchasedPlan != null
                      ? AppStrings.activePlan
                      : AppStrings.currentPlan,
                  style: TextStyle(
                    color: purchasedPlan != null
                        ? AppColors.brightGreen
                        : AppColors.white,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  planStatusText,
                  style: TextStyle(color: planStatusColor, fontSize: 10.sp),
                ),
              ],
            ),

            /// Right Section
            if (isPlanExpired)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/icons/crown_icon.png", scale: 1.8),
                  SizedBox(height: 2.h),
                  Text(
                    AppStrings.upgradePlan,
                    style: TextStyle(color: planTextColor, fontSize: 12.sp),
                  ),
                ],
              )
            else if (hasFreePlan)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: planTextColor,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  currentPlan,
                  style: TextStyle(color: AppColors.white, fontSize: 10.sp),
                ),
              )
            else if (purchasedPlan != null)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    purchasedPlan["icon"]!,
                    height: 20.h,
                    width: 20.w,
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    purchasedPlan["name"]!,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )
            else
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: planTextColor,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  currentPlan,
                  style: TextStyle(color: AppColors.white, fontSize: 10.sp),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
