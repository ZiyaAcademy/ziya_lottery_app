import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stacked_cards_carousel/stacked_cards_carousel.dart';
import 'package:ziya_lottery_app/common_widgets/gradient_header.dart';
import '../view_model/subscription_view_model.dart';
import '../widgets/upgrade_plan_card.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SubscriptionViewModel(),
      child: const _SubscriptionScreenBody(),
    );
  }
}

class _SubscriptionScreenBody extends StatelessWidget {
  const _SubscriptionScreenBody();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<SubscriptionViewModel>();
    final double cardHeight = 455.h;

    final List<Widget> reversedPlanCards = vm.plans
        .map((plan) {
          return UpgradePlanCard(
            title: plan.title,
            subtitle: plan.subtitle,
            price: plan.price,
            duration: plan.duration,
            accentColor: plan.accentColor,
            features: plan.features,
            isCurrentPlan: plan.id == vm.currentPlanId,
            onUpgrade: () {
              vm.setPurchasedPlan(vm.planIdToLevel(plan.id));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Upgraded to ${plan.title}')),
              );
            },
            activePlan: plan.id,
          );
        })
        .toList()
        .reversed
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          /// ✅ Fixed Gradient Header (stays at top)
          GradientHeader(
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 64.w,
                          height: 64.w,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.emoji_events,
                            color: Colors.amber,
                            size: 34,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'Subscriptions',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// ✅ Scrollable Content Below Header
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 24.h),

                  /// Upgrade Message
                  Column(
                    children: [
                      Icon(
                        Icons.workspace_premium,
                        color: Colors.amber.shade700,
                        size: 22.sp,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Upgrade Required',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'This prize requires a higher plan. Upgrade now to get predictions!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12.5.sp,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 24.h),

                  /// Carousel
                  SizedBox(
                    height: cardHeight,
                    child: StackedCardsCarouselWidget(
                      height: cardHeight,
                      stackLevels: 2,
                      width: 300.w,
                      items: reversedPlanCards,
                    ),
                  ),

                  SizedBox(height: 30.h),

                  /// Why Upgrade Section
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Why Upgrade?',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        _bullet(
                          'Get started with basic predictions',
                          Colors.blue,
                        ),
                        _bullet(
                          'Advanced predictions with higher accuracy',
                          Colors.amber,
                        ),
                        _bullet('Higher Win Probability', Colors.green),
                        SizedBox(height: 40.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bullet(String text, Color color) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        children: [
          Icon(Icons.circle, color: color, size: 10.sp),
          SizedBox(width: 8.w),
          Text(
            text,
            style: TextStyle(fontSize: 12.5.sp, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
