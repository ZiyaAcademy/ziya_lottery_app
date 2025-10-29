
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:ziya_lottery_app/Constants/app_colors.dart';
// import 'package:ziya_lottery_app/Constants/app_strings.dart';
// import 'package:ziya_lottery_app/Histroy/view_model/prediction_history_view_model.dart';
// import 'package:ziya_lottery_app/Histroy/widgets/prediction_card.dart' show PredictionCard;
// import 'package:ziya_lottery_app/Histroy/widgets/tab_selector.dart';


// class PredictionHistoryScreen extends StatelessWidget {
//   const PredictionHistoryScreen({super.key});

//   Widget _buildGradientHeader(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [AppColors.primaryBlueLight, AppColors.primaryBlueDark],
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//         ),
//         borderRadius: const BorderRadius.only(
//           bottomLeft: Radius.circular(18),
//           bottomRight: Radius.circular(18),
//         ),
//       ),
//       child: SafeArea(
//         bottom: false,
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
//           child: Row(
//             children: [
//               IconButton(
//                 icon: Icon(Icons.arrow_back, color: AppColors.white, size: 22.w),
//                 onPressed: () => Navigator.maybePop(context),
//               ),
//               SizedBox(width: 4.w),
//               Text(
//                 'Prediction History', // exact title from UI
//                 style: TextStyle(color: AppColors.white, fontSize: 18.sp, fontWeight: FontWeight.w600),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final viewModel = Provider.of<PredictionHistoryViewModel>(context);

//     return Scaffold(
//       backgroundColor: AppColors.backgroundGrey,
//       body: Column(
//         children: [
//           // gradient header
//           _buildGradientHeader(context),

//           // Tabs
//           TabSelector(
//             selectedTab: viewModel.selectedTab,
//             onTabSelected: viewModel.setTab,
//           ),

//           // Content list
//           Expanded(
//             child: viewModel.predictions.isEmpty
//                 ? Center(
//                     child: Text(
//                       AppStrings.noResults ?? 'No results', // fallback if constant missing
//                       style: TextStyle(color: AppColors.grey, fontSize: 14.sp),
//                     ),
//                   )
//                 : ListView.builder(
//                     padding: EdgeInsets.symmetric(vertical: 10.h),
//                     itemCount: viewModel.predictions.length,
//                     itemBuilder: (context, index) {
//                       final item = viewModel.predictions[index];
//                       return PredictionCard(prediction: item);
//                     },
//                   ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ziya_lottery_app/Constants/app_colors.dart';
import 'package:ziya_lottery_app/Constants/app_strings.dart';
import 'package:ziya_lottery_app/Histroy/view_model/prediction_history_view_model.dart';
import 'package:ziya_lottery_app/Histroy/widgets/prediction_card.dart' show PredictionCard;
import 'package:ziya_lottery_app/Histroy/widgets/tab_selector.dart';
import 'package:ziya_lottery_app/Result/widgets/custom_app_bar.dart'; // import your GradientHeader

class PredictionHistoryScreen extends StatelessWidget {
  const PredictionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<PredictionHistoryViewModel>(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundGrey,
      body: Column(
        children: [
          SizedBox(
            height:100.h,
            child: GradientHeader(
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                  child: Row(
                    children: [
                     
                      SizedBox(width: 4.w),
                      Text(
                        'Prediction History',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Tabs
          TabSelector(
            selectedTab: viewModel.selectedTab,
            onTabSelected: viewModel.setTab,
          ),

          // Content
          Expanded(
            child: viewModel.predictions.isEmpty
                ? Center(
                    child: Text(
                      AppStrings.noResults ?? 'No results',
                      style: TextStyle(color: AppColors.grey, fontSize: 14.sp),
                    ),
                  )
                : ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    itemCount: viewModel.predictions.length,
                    itemBuilder: (context, index) {
                      final item = viewModel.predictions[index];
                      return PredictionCard(prediction: item);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
