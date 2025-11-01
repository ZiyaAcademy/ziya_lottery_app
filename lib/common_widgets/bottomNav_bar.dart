import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ziya_lottery_app/Constants/app_colors.dart';
import 'package:ziya_lottery_app/Histroy/View/HistoryScreen.dart';
import 'package:ziya_lottery_app/Home/views/home_screen.dart';
import 'package:ziya_lottery_app/ProfileScreen/View/ProfileScreen.dart';
import 'package:ziya_lottery_app/Result/view/result_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

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
            child: Icon(item['icon'] as IconData, color: color, size: 26.w),
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
