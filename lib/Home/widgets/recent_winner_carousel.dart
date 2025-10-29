import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ziya_lottery_app/Home/models/lottery.dart';
import 'package:ziya_lottery_app/Home/widgets/recent_winner_card.dart';
import 'package:ziya_lottery_app/common_widgets/gradient_container.dart';

class RecentWinnerCarousel extends StatefulWidget {
  final List<WinnerModel> winners;
  const RecentWinnerCarousel({super.key, required this.winners});

  @override
  State<RecentWinnerCarousel> createState() => _RecentWinnerCarouselState();
}

class _RecentWinnerCarouselState extends State<RecentWinnerCarousel> {
  late final PageController _pageController;
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1.0); // full width

    if (widget.winners.length > 1) {
      _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
        setState(() {
          _currentPage = (_currentPage + 1) % widget.winners.length;
        });
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int totalItems = widget.winners.length;
    const int maxDots = 5;
    final int displayCount = totalItems > maxDots ? maxDots : totalItems;

    int startDotIndex = 0;
    if (totalItems > maxDots) {
      startDotIndex = (_currentPage - 2).clamp(0, totalItems - maxDots);
    }

    int activeDotIndex = _currentPage;
    if (totalItems > maxDots) {
      activeDotIndex = _currentPage - startDotIndex;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// 🏆 Header Row + Dots
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              GradientContainer(
                height: 40.w,
                width: 40.w,
                child: Image.asset('assets/icons/trophy.png'),
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "RECENT 1ST PRIZE WINNERS",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    "Latest lottery winners",
                    style: TextStyle(fontSize: 10.sp, color: Colors.grey),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  displayCount,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 2.w),
                    width: activeDotIndex == index ? 10.w : 6.w,
                    height: 6.w,
                    decoration: BoxDecoration(
                      color: activeDotIndex == index
                          ? Colors.green
                          : Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 10.h),

        /// 🧩 Full-width PageView
        SizedBox(
          width: double.infinity,
          height: 210.h,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.winners.length,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                ), // no side padding
                child: RecentWinnerCard(winner: widget.winners[index]),
              );
            },
          ),
        ),

        SizedBox(height: 10.h),
      ],
    );
  }
}
