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
        width: double.infinity,
        padding: EdgeInsets.all(4.w),
        decoration: BoxDecoration(
          color: const Color(0xFFEDEDED), // light gray background like image
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: tabs.map((tab) {
                final bool isSelected = tab == selectedTab;
                return GestureDetector(
                  onTap: () => onTabSelected(tab),
                  child: AnimatedContainer(
                    width: 100.w,
                    duration: const Duration(milliseconds: 180),
                    curve: Curves.easeInOut,
                    margin: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 2.h,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.white : Color(0xFFEDEDED),
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 3.r,
                                offset: Offset(0, 1.5.h),
                              ),
                            ]
                          : [],
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      tab,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: isSelected
                            ? FontWeight.w700
                            : FontWeight.w600,
                        color: AppColors.textColorDark,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:ziya_lottery_app/Constants/app_colors.dart';

// class TabSelector extends StatelessWidget {
//   final String selectedTab;
//   final Function(String) onTabSelected;

//   final List<String> tabs = ['ALL', 'Completed', 'Pending'];

//   TabSelector({
//     super.key,
//     required this.selectedTab,
//     required this.onTabSelected,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
//       child: Container(
//         height: 38.h,
//         padding: EdgeInsets.all(4.w),
//         decoration: BoxDecoration(
//           color: const Color(0xFFEDEDED), // light gray background like image
//           borderRadius: BorderRadius.circular(20.r),
//         ),
//         child: Row(
//           children: tabs.map((tab) {
//             final bool isSelected = tab == selectedTab;
//             return Expanded(
//               child: GestureDetector(
//                 onTap: () => onTabSelected(tab),
//                 child: AnimatedContainer(
//                   duration: const Duration(milliseconds: 180),
//                   curve: Curves.easeInOut,
//                   margin: EdgeInsets.symmetric(horizontal: 3.w),
//                   decoration: BoxDecoration(
//                     color: isSelected ? Colors.white : Colors.transparent,
//                     borderRadius: BorderRadius.circular(20.r),
//                     boxShadow: isSelected
//                         ? [
//                             BoxShadow(
//                               color: Colors.black12,
//                               blurRadius: 3.r,
//                               offset: Offset(0, 1.5.h),
//                             ),
//                           ]
//                         : [],
//                   ),
//                   alignment: Alignment.center,
//                   child: Text(
//                     tab,
//                     style: TextStyle(
//                       fontSize: 13.sp,
//                       fontWeight: isSelected
//                           ? FontWeight.w700
//                           : FontWeight.w600,
//                       color: AppColors.textColorDark,
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }
