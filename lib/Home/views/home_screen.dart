// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import 'package:ziya_lottery_app/Constants/app_colors.dart';
// import 'package:ziya_lottery_app/Home/view_models/home_vm.dart';
// import 'package:ziya_lottery_app/Home/widgets/ad_banner.dart';
// import 'package:ziya_lottery_app/Home/widgets/recent_winner_carousel.dart';
// import 'package:ziya_lottery_app/Home/widgets/shimmer_loader.dart';
// import 'package:ziya_lottery_app/common_widgets/gradient_header.dart';
// import 'package:ziya_lottery_app/Home/widgets/bottom_nav_bar.dart';
// import 'package:ziya_lottery_app/Home/widgets/lottery_grid_item.dart';
// import 'package:ziya_lottery_app/Home/widgets/plan_card_content.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       bottomNavigationBar: const BottomNavBar(),
//       body: Consumer<HomeViewModel>(
//         builder: (context, vm, _) {
//           if (vm.isLoading) {
//             return const HomeShimmerLoader();
//           }

//           return Stack(
//             children: [
//               GradientHeader(
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(
//                     vertical: 60.h,
//                     horizontal: 20.w,
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       /// Welcome and Notification Row
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Welcome Back!',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 20.sp,
//                                 ),
//                               ),
//                               Text(
//                                 vm.currentUser.name,
//                                 style: TextStyle(
//                                   color: Colors.white70,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 15.sp,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           // 🔹 Notification Button
//                           GestureDetector(
//                             onTap: () {},
//                             child: Container(
//                               padding: EdgeInsets.all(5.w),
//                               decoration: const BoxDecoration(
//                                 color: AppColors.white,
//                                 shape: BoxShape.circle,
//                               ),
//                               child: Stack(
//                                 alignment: Alignment.topRight,
//                                 children: [
//                                   Icon(
//                                     Icons.notifications_none_outlined,
//                                     size: 25.sp,
//                                     color: AppColors.black,
//                                   ),

//                                   Positioned(
//                                     right: 2.w,
//                                     top: 2.h,
//                                     child: Container(
//                                       width: 8.w,
//                                       height: 8.w,
//                                       decoration: const BoxDecoration(
//                                         color: Colors.red,
//                                         shape: BoxShape.circle,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 25.h),

//                       /// Plan Card
//                       PlanCard(
//                         currentPlan: vm.currentUser.currentPlan,
//                         hasFreePlan: vm.currentUser.hasFreePlan,
//                         isPlanExpired: vm.isPlanExpired,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),

//               /// 📜 Scrollable Main Content
//               Positioned.fill(
//                 top: GradientHeader.headerHeight.h + 3.h,
//                 child: Container(
//                   color: Colors.white,
//                   child: SingleChildScrollView(
//                     physics: const BouncingScrollPhysics(),
//                     padding: EdgeInsets.only(
//                       top: 10.h,
//                       left: 0.w,
//                       right: 0.w,
//                       bottom: 70.h,
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         /// 🖼 Ad Banner
//                         AdBanner(imageUrls: vm.adImages),
//                         SizedBox(height: 20.h),
//                         RecentWinnerCarousel(winners: vm.recentWinners),

//                         SizedBox(height: 15.h),
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 16.w),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 'All Lotteries',
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 16.sp,
//                                 ),
//                               ),
//                               Container(
//                                 decoration: BoxDecoration(
//                                   color: Colors.green,
//                                   borderRadius: BorderRadius.circular(5.r),
//                                 ),
//                                 padding: EdgeInsets.symmetric(
//                                   horizontal: 10.w,
//                                   vertical: 5.h,
//                                 ),
//                                 child: Text(
//                                   'Prediction',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 13.sp,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),

//                         /// 🎯 Lottery Grid
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 16.w),
//                           child: GridView.builder(
//                             shrinkWrap: true,
//                             physics: const NeverScrollableScrollPhysics(),
//                             gridDelegate:
//                                 SliverGridDelegateWithFixedCrossAxisCount(
//                                   crossAxisCount: 2,
//                                   crossAxisSpacing: 15.w,
//                                   mainAxisSpacing: 12.h,
//                                   childAspectRatio: 1.1,
//                                 ),
//                             itemCount: vm.allLotteries.length,
//                             itemBuilder: (_, i) =>
//                                 LotteryGridItem(lottery: vm.allLotteries[i]),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
// ignore_for_file: use_build_context_synchronously
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import 'package:ziya_lottery_app/Constants/app_colors.dart';
// import 'package:ziya_lottery_app/Home/view_models/home_vm.dart';
// import 'package:ziya_lottery_app/Home/widgets/ad_banner.dart';
// import 'package:ziya_lottery_app/Home/widgets/recent_winner_carousel.dart';
// import 'package:ziya_lottery_app/Home/widgets/shimmer_loader.dart';
// import 'package:ziya_lottery_app/Prediction_section/view_models/prediction.vm.dart';
// import 'package:ziya_lottery_app/common_widgets/gradient_header.dart';
// import 'package:ziya_lottery_app/Home/widgets/bottom_nav_bar.dart';
// import 'package:ziya_lottery_app/Home/widgets/lottery_grid_item.dart';
// import 'package:ziya_lottery_app/Home/widgets/plan_card_content.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       bottomNavigationBar: const BottomNavBar(),
//       body: Consumer<HomeViewModel>(
//         builder: (context, vm, _) {
//           if (vm.isLoading) {
//             return const HomeShimmerLoader();
//           }

//           return Stack(
//             children: [
//               GradientHeader(
//                 height: 250.h,
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(
//                     vertical: 60.h,
//                     horizontal: 20.w,
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Welcome Back!',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 20.sp,
//                                 ),
//                               ),
//                               Text(
//                                 vm.currentUser.name,
//                                 style: TextStyle(
//                                   color: Colors.white70,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 15.sp,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           GestureDetector(
//                             onTap: () {},
//                             child: Container(
//                               padding: EdgeInsets.all(5.w),
//                               decoration: const BoxDecoration(
//                                 color: AppColors.white,
//                                 shape: BoxShape.circle,
//                               ),
//                               child: Stack(
//                                 alignment: Alignment.topRight,
//                                 children: [
//                                   Icon(
//                                     Icons.notifications_none_outlined,
//                                     size: 25.sp,
//                                     color: AppColors.black,
//                                   ),
//                                   Positioned(
//                                     right: 2.w,
//                                     top: 2.h,
//                                     child: Container(
//                                       width: 8.w,
//                                       height: 8.w,
//                                       decoration: const BoxDecoration(
//                                         color: Colors.red,
//                                         shape: BoxShape.circle,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 25.h),

//                       PlanCard(
//                         currentPlan: vm.currentUser.currentPlan,
//                         hasFreePlan: vm.currentUser.hasFreePlan,
//                         isPlanExpired: vm.isPlanExpired,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),

//               Positioned.fill(
//                 top: GradientHeader.defaultHeight.h + 3.h,
//                 child: Container(
//                   color: Colors.white,
//                   child: SingleChildScrollView(
//                     physics: const BouncingScrollPhysics(),
//                     padding: EdgeInsets.only(top: 10.h, bottom: 70.h),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         AdBanner(imageUrls: vm.adImages),
//                         SizedBox(height: 20.h),
//                         RecentWinnerCarousel(winners: vm.recentWinners),

//                         SizedBox(height: 15.h),
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 16.w),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 'All Lotteries',
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 16.sp,
//                                 ),
//                               ),
//                               Container(
//                                 decoration: BoxDecoration(
//                                   color: Colors.green,
//                                   borderRadius: BorderRadius.circular(5.r),
//                                 ),
//                                 padding: EdgeInsets.symmetric(
//                                   horizontal: 10.w,
//                                   vertical: 5.h,
//                                 ),
//                                 child: Text(
//                                   'Prediction',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 13.sp,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),

//                         /// 🎯 Lottery Grid (from Prediction VM)
//                         Consumer<PredictionViewModel>(
//                           builder: (context, predictionVM, _) {
//                             return Padding(
//                               padding: EdgeInsets.symmetric(horizontal: 16.w),
//                               child: GridView.builder(
//                                 shrinkWrap: true,
//                                 physics: const NeverScrollableScrollPhysics(),
//                                 gridDelegate:
//                                     SliverGridDelegateWithFixedCrossAxisCount(
//                                       crossAxisCount: 2,
//                                       crossAxisSpacing: 15.w,
//                                       mainAxisSpacing: 12.h,
//                                       childAspectRatio: 1.1,
//                                     ),
//                                 itemCount: predictionVM.allLotteries.length,
//                                 itemBuilder: (_, i) => LotteryGridItem(
//                                   lottery: predictionVM.allLotteries[i],
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ziya_lottery_app/Constants/app_colors.dart';
import 'package:ziya_lottery_app/Home/view_models/home_vm.dart';
import 'package:ziya_lottery_app/Home/widgets/ad_banner.dart';
import 'package:ziya_lottery_app/Home/widgets/recent_winner_carousel.dart';
import 'package:ziya_lottery_app/Home/widgets/shimmer_loader.dart';
import 'package:ziya_lottery_app/Prediction_section/view_models/prediction.vm.dart';
import 'package:ziya_lottery_app/Prediction_section/views/prediction_category_screen.dart';
import 'package:ziya_lottery_app/Prediction_section/widgets/todaysFeaturedPredictionCard.dart';
import 'package:ziya_lottery_app/common_widgets/gradient_header.dart';
import 'package:ziya_lottery_app/Home/widgets/bottom_nav_bar.dart';
import 'package:ziya_lottery_app/Home/widgets/lottery_grid_item.dart';
import 'package:ziya_lottery_app/Home/widgets/plan_card_content.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: const BottomNavBar(),
      body: Consumer<HomeViewModel>(
        builder: (context, vm, _) {
          if (vm.isLoading) return const HomeShimmerLoader();

          return Column(
            children: [
              /// 🟦 Gradient Header (fixed top, height = content)
              GradientHeader(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 25.h,
                    left: 16.w,
                    right: 16.w,
                    bottom: 20.h,
                  ),
                  child: SafeArea(
                    bottom: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Welcome Back!',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.sp,
                                  ),
                                ),
                                Text(
                                  vm.currentUser.name,
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.all(5.w),
                                decoration: const BoxDecoration(
                                  color: AppColors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    Icon(
                                      Icons.notifications_none_outlined,
                                      size: 25.sp,
                                      color: AppColors.black,
                                    ),
                                    Positioned(
                                      right: 2.w,
                                      top: 2.h,
                                      child: Container(
                                        width: 8.w,
                                        height: 8.w,
                                        decoration: const BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 25.h),

                        vm.todayPredicted
                            ? TodaysFeaturedPredictionCard()
                            : PlanCard(
                                currentPlan: vm.currentUser.currentPlan,
                                hasFreePlan: vm.currentUser.hasFreePlan,
                                isPlanExpired: vm.isPlanExpired,
                              ),
                      ],
                    ),
                  ),
                ),
              ),

              /// 🧩 Scrollable body
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.only(top: 15.h, bottom: 70.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AdBanner(imageUrls: vm.adImages),
                      SizedBox(height: 20.h),

                      if (vm.recentWinners.isNotEmpty)
                        RecentWinnerCarousel(winners: vm.recentWinners),
                      SizedBox(height: 15.h),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'All Lotteries',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 5.h,
                              ),
                              child: Text(
                                'Prediction',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),

                      Consumer<PredictionViewModel>(
                        builder: (context, predictionVM, _) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 15.w,
                                    mainAxisSpacing: 12.h,
                                    childAspectRatio: 1.1,
                                  ),
                              itemCount: predictionVM.allLotteries.length,
                              itemBuilder: (_, i) {
                                final lottery = predictionVM.allLotteries[i];
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            PredictionCategoryScreen(
                                              lottery: lottery,
                                            ),
                                      ),
                                    );
                                  },
                                  child: LotteryGridItem(lottery: lottery),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
