
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import 'package:ziya_lottery_app/Prediction_section/view_models/prediction.vm.dart';
// import 'package:ziya_lottery_app/Prediction_section/widgets/ai_prediction_title.dart';
// import 'package:ziya_lottery_app/Prediction_section/widgets/header_section.dart';
// import 'package:ziya_lottery_app/Prediction_section/widgets/plan_tabs.dart';
// import 'package:ziya_lottery_app/Prediction_section/widgets/predict_button.dart';
// import 'package:ziya_lottery_app/Prediction_section/widgets/prediction_loading.dart';
// import 'package:ziya_lottery_app/Prediction_section/widgets/prediction_result_section.dart';
// import 'package:ziya_lottery_app/Prediction_section/widgets/upgrade_card.dart';

// class PredictionScreen extends StatelessWidget {
//   const PredictionScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final vm = context.watch<PredictionViewModel>();
//     final prediction = vm.selectedPrediction;

//     if (prediction == null) {
//       return const Scaffold(body: SafeArea(child: PredictionLoading()));
//     }

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           physics: const BouncingScrollPhysics(),
//           child: Column(
//             children: [
//               HeaderSection(
//                 name: prediction.name,
//                 prize: prediction.prize,
//                 amount: prediction.amount,
//               ),
//               const AiPredictionTitle(),
//               const PlanTabs(),
//               if (vm.canGenerateForActivePlan())
//                 PredictionResultSection(lotteryName: prediction.name),
//               Padding(
//                 padding: EdgeInsets.only(bottom: 28.h),
//                 child: vm.canGenerateForActivePlan()
//                     ? PredictButton(onTap: vm.generatePrediction)
//                     : UpgradeCard(activePlan: vm.activePlan),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ziya_lottery_app/Prediction_section/view_models/prediction.vm.dart';
import 'package:ziya_lottery_app/Prediction_section/widgets/ai_prediction_title.dart';
import 'package:ziya_lottery_app/Prediction_section/widgets/header_section.dart';
import 'package:ziya_lottery_app/Prediction_section/widgets/plan_tabs.dart';
import 'package:ziya_lottery_app/Prediction_section/widgets/predict_button.dart';
import 'package:ziya_lottery_app/Prediction_section/widgets/prediction_loading.dart';
import 'package:ziya_lottery_app/Prediction_section/widgets/prediction_result_section.dart';
import 'package:ziya_lottery_app/Prediction_section/widgets/upgrade_card.dart';

class PredictionScreen extends StatelessWidget {
  const PredictionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<PredictionViewModel>();
    final prediction = vm.selectedPrediction;

    if (prediction == null) {
      return const Scaffold(body: SafeArea(child: PredictionLoading()));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            /// 🧩 Scrollable content
            Padding(
              padding: EdgeInsets.only(top: 220.h), // same as header height
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const AiPredictionTitle(),
                    const PlanTabs(),
                    if (vm.canGenerateForActivePlan())
                      PredictionResultSection(lotteryName: prediction.name),
                    Padding(
                      padding: EdgeInsets.only(bottom: 28.h),
                      child: vm.canGenerateForActivePlan()
                          ? PredictButton(onTap: vm.generatePrediction)
                          : UpgradeCard(activePlan: vm.activePlan),
                    ),
                  ],
                ),
              ),
            ),

            /// 🧭 Fixed header at top
            SizedBox(
              height: 220.h, // header fixed height
              width: double.infinity,
              child: HeaderSection(
                name: prediction.name,
                prize: prediction.prize,
                amount: prediction.amount,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
