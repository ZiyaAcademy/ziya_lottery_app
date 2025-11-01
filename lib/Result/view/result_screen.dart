import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ziya_lottery_app/Constants/app_colors.dart';
import 'package:ziya_lottery_app/Constants/app_strings.dart';
import 'package:ziya_lottery_app/Result/ViewModel/lottery_view_model.dart';
import 'package:ziya_lottery_app/common_widgets/gradient_header.dart';
import '../widgets/ad_view_content.dart';
import '../widgets/results_view_content.dart';
import '../widgets/search_card.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LotteryViewModel>(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          /// 🟦 Gradient Header (auto height)
          GradientHeader(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 35.h, horizontal: 20.w),
              child: SafeArea(
                bottom: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Title + QR icon row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppStrings.appTitle,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                backgroundColor: Colors.black87,
                                content: Text(
                                  'Barcode Scan feature coming soon!',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          },
                          child: Icon(
                            Icons.qr_code_scanner,
                            color: Colors.white,
                            size: 25.sp,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 25.h),

                    /// Search section
                    const SearchCard(),
                  ],
                ),
              ),
            ),
          ),

          /// 🧩 Scrollable content
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: 15.h),
              child: Column(
                children: [
                  if (provider.showAdView)
                    const AdViewContent()
                  else
                    const ResultsViewContent(),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
