
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:ziya_lottery_app/Constants/app_colors.dart';
// import 'package:ziya_lottery_app/Constants/app_strings.dart';

// class AdViewContent extends StatelessWidget {
//   const AdViewContent({super.key});

//   static const String _adPlaceholderUrl =
//       'https://t4.ftcdn.net/jpg/14/95/32/85/360_F_1495328506_JkFdUwgebhL5wM1wbLA7iwGmDFYoMjxV.jpg';

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
//       child: Center(
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(16.r),
//           child: Container(
//             width: double.infinity,
//             height: 0.35.sh, // height scales proportionally with screen
//             decoration: BoxDecoration(
//               color: AppColors.white,
//               borderRadius: BorderRadius.circular(16.r),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.05),
//                   blurRadius: 6.r,
//                   offset: Offset(0, 3.h),
//                 ),
//               ],
//             ),
//             alignment: Alignment.center,
//             child: Image.network(
//               _adPlaceholderUrl,
//               fit: BoxFit.cover,
//               width: double.infinity,
//               height: double.infinity,
//               errorBuilder: (context, error, stackTrace) {
//                 return Container(
//                   color: Colors.grey[200],
//                   alignment: Alignment.center,
//                   child: Text(
//                     AppStrings.adPlaceholder,
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 16.sp,
//                       color: Colors.grey[700],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ziya_lottery_app/Constants/app_colors.dart';
import 'package:ziya_lottery_app/Constants/app_strings.dart';
import '../ViewModel/lottery_view_model.dart';

class AdViewContent extends StatelessWidget {
  const AdViewContent({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<LotteryViewModel>(context, listen: true);
    final url = vm.adImageUrl;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: Container(
            width: double.infinity,
            height: (0.35 * MediaQuery.of(context).size.height).clamp(200.h, 420.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 6.r,
                  offset: Offset(0, 3.h),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Image.network(
              url,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[200],
                  alignment: Alignment.center,
                  child: Text(
                    AppStrings.adPlaceholder,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.grey[700],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
