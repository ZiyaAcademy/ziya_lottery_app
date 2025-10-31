
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ziya_lottery_app/Prediction_section/view_models/prediction.vm.dart';

class PlanTabs extends StatelessWidget {
  const PlanTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<PredictionViewModel>();

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: const Color(0xFFE8E8E8),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          _tabItem(context, "PLAN 1", vm.activePlan == "PLAN 1"),
          _tabItem(context, "PLAN 2", vm.activePlan == "PLAN 2"),
          _tabItem(context, "PLAN 3", vm.activePlan == "PLAN 3"),
        ],
      ),
    );
  }

  Widget _tabItem(BuildContext context, String text, bool isActive) => Expanded(
        child: GestureDetector(
          onTap: () {
            // When a tab is tapped, we update the active plan in the ViewModel.
            final vm = context.read<PredictionViewModel>();

            // This logic handles prize-specific plan restrictions.
            final tappedPlanIndex = vm.getPlanIndex(text);
            final userHasTappedPlan = vm.purchasedPlan >= tappedPlanIndex;
            bool wasBlocked = false; // Flag to track if a restriction was hit.

            // --- Prize-Specific Rules ---

            // Rule for Elite prizes (e.g., ₹10 Lakh)
            if (vm.isElitePrize && text.toUpperCase() != 'PLAN 3') {
              _showRestrictionSnackbar(context, "This prize can only be predicted with PLAN 3.");
              wasBlocked = true;
              return; // Stop execution.
            }

            // Rule for Premium prizes (e.g., ₹1 Lakh)
            if (vm.isPremiumPrize && text.toUpperCase() != 'PLAN 2') {
              // For premium-only prizes, block switching to ANY other tab.
              _showRestrictionSnackbar(context, "This prize can only be predicted with PLAN 2.");
              wasBlocked = true;
              return; // Stop execution.
            }

            // Rule for Basic prizes (e.g., ₹1,000)
            if (vm.isBasicPrize && text.toUpperCase() != 'PLAN 1') {
              // If the user owns the tapped plan, block them.
              // If they don't own it, allow the switch so they can see the upgrade card.
              if (userHasTappedPlan) {
                _showRestrictionSnackbar(context, "This prize can only be predicted with PLAN 1.");
                wasBlocked = true;
                return; // Stop execution.
              }
              // If they don't own the plan, the logic proceeds and will show the upgrade card.
            }

            // --- End of Prize-Specific Rules ---

            vm.updatePlan(text);

            // After updating, we check if the user has access to this newly selected plan.
            // If not, we show a snackbar to inform them.
            if (!vm.canGenerateForActivePlan() && !wasBlocked) {
              // Hide any existing snackbars before showing a new one.
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "Please upgrade to access $text.",
                  ),
                  duration: const Duration(seconds: 2),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            }
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            padding: EdgeInsets.symmetric(vertical: 8.h),
            decoration: BoxDecoration(
              color: isActive ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: isActive
                  ? [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ]
                  : [],
            ),
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.black,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ),
        ),
      );

  // Helper to show a consistent snackbar message for plan restrictions.
  void _showRestrictionSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    final snackBar = SnackBar(
      backgroundColor: Colors.transparent, // Make it transparent
      elevation: 0, // No shadow
      behavior: SnackBarBehavior.floating,
      content: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        decoration: BoxDecoration(
          // Glassy effect
          color: Colors.black.withOpacity(0.7),
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Text(
          message,
          style: const TextStyle(color: Colors.white, fontSize: 13),
          textAlign: TextAlign.center,
        ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
