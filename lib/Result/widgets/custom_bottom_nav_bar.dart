// import 'package:flutter/material.dart';
// import 'package:ziya_lottery_app/Constants/app_colors.dart';
// import 'package:ziya_lottery_app/Histroy/View/HistoryScreen.dart';
// import 'package:ziya_lottery_app/HomeScreen/view/HomeScreen.dart';
// import 'package:ziya_lottery_app/ProfileScreen/View/ProfileScreen.dart';
// import 'package:ziya_lottery_app/Result/view/result_screen.dart';

// class BottomNavigation extends StatefulWidget {
//   const BottomNavigation({super.key});

//   @override
//   State<BottomNavigation> createState() => _BottomNavigationState();
// }

// class _BottomNavigationState extends State<BottomNavigation> {
//   int _currentIndex = 1; // Assuming 'Result' (HistoryScreen in the list) is the initial screen based on your screenshot

//   final List<Widget> _pages = const [
//     HomeScreen(),
//     ResultScreen(), // This corresponds to the 'Result' tab in your lottery UI context
//     PredictionHistoryScreen(),
//     ProfileScreen(),
//   ];
  
//   // Custom list of icons and labels to match the Figma/Screenshot UI
//   final List<Map<String, dynamic>> _navItems = [
//     {'icon': Icons.home_filled, 'label': 'Home'},
//     {'icon': Icons.description_rounded, 'label': 'Result'}, // Changed icon and label to match the screenshot
//     {'icon': Icons.history, 'label': 'Histroy'},         // Changed icon to match the history clock icon
//     {'icon': Icons.person, 'label': 'Profile'},
//   ];


//   // Custom method to build each navigation item with the Figma style
//   Widget _buildNavItem(int index, bool isSelected) {
//     final item = _navItems[index];
//     final color = isSelected ? AppColors.buttonColor : Colors.grey.shade700;
    
//     // The structure to create the desired look: 
//     // Column with an optional blue indicator bar (top) and the icon/text.
//     return InkWell(
//       onTap: () {
//         setState(() {
//           _currentIndex = index;
//         });
//       },
//       // Use Expanded to ensure even spacing, wrapped in Padding for vertical space
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // 1. Blue Indicator Bar (only visible when selected, and placed right at the top edge)
//           AnimatedContainer(
//             duration: const Duration(milliseconds: 200),
//             height: 3,
//             width: isSelected ? 40.0 : 0.0, // Increased width slightly for prominence
//             decoration: BoxDecoration(
//               color: AppColors.buttonColor,
//               borderRadius: BorderRadius.circular(1.5),
//             ),
//           ),
          
//           // Add padding for the content below the indicator
//           Padding(
//             padding: const EdgeInsets.only(top: 8.0, bottom: 4.0), // Padding below the blue bar
//             child: Icon(
//               item['icon'] as IconData,
//               color: color,
//               size: 26,
//             ),
//           ),
          
//           // 3. Label
//           Text(
//             item['label'] as String,
//             style: TextStyle(
//               color: color,
//               fontSize: 12,
//               fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
//             ),
//           ),
//           const SizedBox(height: 4.0), // Bottom padding
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_currentIndex],
//       bottomNavigationBar: Container(
//         // 💡 FIX: Added BoxShadow for subtle elevation (top shadow)
//         decoration: BoxDecoration(
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.1),
//               spreadRadius: 0,
//               blurRadius: 10,
//               offset: const Offset(0, -1), // Only show shadow at the top
//             ),
//           ],
//         ),
//         // Use Row to place the custom navigation items
//         child: SafeArea(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: _navItems.asMap().entries.map((entry) {
//               int index = entry.key;
//               return Expanded(
//                 child: _buildNavItem(index, index == _currentIndex),
//               );
//             }).toList(),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ziya_lottery_app/Constants/app_colors.dart';
import 'package:ziya_lottery_app/Histroy/View/HistoryScreen.dart';
import 'package:ziya_lottery_app/HomeScreen/view/HomeScreen.dart';
import 'package:ziya_lottery_app/ProfileScreen/View/ProfileScreen.dart';
import 'package:ziya_lottery_app/Result/view/result_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 1;

  final List<Widget> _pages = const [
    HomeScreen(),
    ResultScreen(),
    PredictionHistoryScreen(),
    ProfileScreen(),
  ];

  final List<Map<String, dynamic>> _navItems = [
    {'icon': Icons.home_filled, 'label': 'Home'},
    {'icon': Icons.description_rounded, 'label': 'Result'},
    {'icon': Icons.history, 'label': 'Histroy'},
    {'icon': Icons.person, 'label': 'Profile'},
  ];

  Widget _buildNavItem(int index, bool isSelected) {
    final item = _navItems[index];
    final color = isSelected ? AppColors.buttonColor : Colors.grey.shade700;

    return InkWell(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 3.h,
            width: isSelected ? 40.w : 0.w,
            decoration: BoxDecoration(
              color: AppColors.buttonColor,
              borderRadius: BorderRadius.circular(1.5.r),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
            child: Icon(
              item['icon'] as IconData,
              color: color,
              size: 26.w,
            ),
          ),
          Text(
            item['label'] as String,
            style: TextStyle(
              color: color,
              fontSize: 12.sp,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
          SizedBox(height: 4.h),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 10.r,
              offset: Offset(0, -1.h),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _navItems.asMap().entries.map((entry) {
              int index = entry.key;
              return Expanded(
                child: _buildNavItem(index, index == _currentIndex),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
