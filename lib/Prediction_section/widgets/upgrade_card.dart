import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpgradeCard extends StatelessWidget {
  final String activePlan;
  const UpgradeCard({super.key, required this.activePlan});

  @override
  Widget build(BuildContext context) {
    switch (activePlan.toUpperCase()) {
      case 'PLAN 2':
        return _buildPlanCard(
          title: "Premium",
          subtitle: "Advanced predictions with higher accuracy",
          price: "\$299",
          duration: "month",
          accentColor: Colors.amber.shade700,
          icon: Icons.workspace_premium_outlined,
          features: [
            "10 Predictions per Month", 
            "Predict 4th, 5th, 6th, 7th, 8th & 9th Prizes",
            "30 Numbers per Prediction",
            "Prediction Percentage Display for each number",
            "Multi-Prize Analytics (trend suggestions)",
            "Hot & Cold number indicators",
            "Success Probability Meter",
            "Priority result notifications",
            "Larger prediction range for higher chances",
            "Recommended for regular players",
          ],
        );

      case 'PLAN 3':
        return _buildPlanCard(
          title: "Elite",
          subtitle: "Advanced predictions with higher accuracy",
          price: "\$299",
          duration: "month",
          accentColor: Colors.green,
          icon: Icons.shield_outlined,
          features: [
            "10 Predictions per Day",
            "Predict 1st to 9th Prizes (All Prizes Unlocked)",
            "50 Numbers per Prediction",
            "Prediction Percentage Display for each number",
            "Advanced AI Pattern Analysis",
            "Winning number frequency charts",
            "Monthly performance reports",
            "Priority customer support",
            "Exclusive special draw tips",
            "Higher success optimization tools enabled",
          ],
        );

      default:
        return _buildPlanCard(
          title: "Basic",
          subtitle: "Get started with basic predictions",
          price: "\$99",
          duration: "month",
          accentColor: Colors.blue,
          icon: Icons.auto_awesome,
          features: [
            "10 Predictions per Month",
            "7th, 8th & 9th Prizes Only",
            "15 Numbers per Prediction",
            "Prediction Percentage Display for each number",
            "Designed for quick and low-risk prediction",
            "Simple UI mode for fast entry",
            "Basic history analytics (previous day results)",
            "Recommended for players testing the app and learning patterns",
            "Access to basic support",
          ],
        );
    }
  }

  Widget _buildPlanCard({
    required String title,
    required String subtitle,
    required String price,
    required String duration,
    required Color accentColor,
    required IconData icon,
    required List<String> features,
  }) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.black12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: accentColor, size: 28.sp),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                          color: Colors.black87)),
                  Text(subtitle,
                      style:
                          TextStyle(fontSize: 12.sp, color: Colors.black54)),
                ],
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(price,
                  style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87)),
              SizedBox(width: 4.w),
              Text("/$duration",
                  style: TextStyle(fontSize: 12.sp, color: Colors.black54)),
            ],
          ),
          SizedBox(height: 12.h),
          Divider(color: Colors.black12, thickness: 1),
          SizedBox(height: 8.h),
          Row(
            children: [
              Icon(Icons.show_chart, color: accentColor, size: 18.sp),
              SizedBox(width: 6.w),
              const Text("Predictions",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.black87)),
            ],
          ),
          SizedBox(height: 6.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: features.map((f) {
              return Padding(
                padding: EdgeInsets.only(bottom: 6.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.check_circle,
                        color: accentColor, size: 14.sp),
                    SizedBox(width: 6.w),
                    Expanded(
                      child: Text(f,
                          style: TextStyle(
                              fontSize: 12.sp, color: Colors.black87)),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 12.h),
          SizedBox(
            width: double.infinity,
            height: 38.h,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: accentColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r)),
              ),
              child: const Text("Upgrade Now",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600)),
            ),
          ),
        ],
      ),
    );
  }
}
