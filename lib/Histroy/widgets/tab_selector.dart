// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:ziya_lottery_app/Constants/app_colors.dart';
// // Mocking AppColors for standalone compilation

// class TabSelector extends StatelessWidget {
//   final String selectedTab;
//   final Function(String) onTabSelected;
  
//   // Tabs to display, matching the ViewModel and UI
//   final List<String> tabs = ['ALL', 'Completed', 'Pending'];

//    TabSelector({
//     super.key,
//     required this.selectedTab,
//     required this.onTabSelected,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: AppColors.white, // White background for the TabBar container
//       padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: tabs.map((tab) {
//           final isSelected = tab == selectedTab;
//           return GestureDetector(
//             onTap: () => onTabSelected(tab),
//             child: Container(
//               padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
//               decoration: BoxDecoration(
//                 border: Border(
//                   bottom: BorderSide(
//                     color: isSelected ? AppColors.primaryBlueDark : AppColors.transparent,
//                     width: 3.0,
//                   ),
//                 ),
//               ),
//               child: Text(
//                 tab,
//                 style: TextStyle(
//                   fontSize: 14.sp,
//                   fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
//                   color: isSelected ? AppColors.primaryBlueDark : AppColors.grey,
//                 ),
//               ),
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ziya_lottery_app/Constants/app_colors.dart';

class TabSelector extends StatelessWidget {
  final String selectedTab;
  final Function(String) onTabSelected;

  final List<String> tabs = ['ALL', 'Completed', 'Pending'];

   TabSelector({
    super.key,
    required this.selectedTab,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Container(
        height: 38.h,
        padding: EdgeInsets.all(4.w),
        decoration: BoxDecoration(
          color: const Color(0xFFEDEDED), // light gray background like image
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          children: tabs.map((tab) {
            final bool isSelected = tab == selectedTab;
            return Expanded(
              child: GestureDetector(
                onTap: () => onTabSelected(tab),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  curve: Curves.easeInOut,
                  margin: EdgeInsets.symmetric(horizontal: 3.w),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.white : Colors.transparent,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 3.r,
                              offset: Offset(0, 1.5.h),
                            )
                          ]
                        : [],
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    tab,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight:
                          isSelected ? FontWeight.w700 : FontWeight.w600,
                      color: AppColors.textColorDark,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
