
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class GradientHeader extends StatelessWidget {
//   final Widget child;
//   static const double defaultHeight = 270; // raw height value

//   const GradientHeader({super.key, required this.child});

//   @override
//   Widget build(BuildContext context) {
//     // Apply .h scaling safely inside build
//     final double headerHeight = defaultHeight.h;

//     return Stack(
//       children: [
//         Container(
//           height: headerHeight,
//           decoration: BoxDecoration(
//             gradient: const LinearGradient(
//               colors: [Color(0xFF66BDFF), Color(0xFF065087)],
//               begin: Alignment.topLeft,
//               end: Alignment.topRight,
//             ),
//             borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(25.r),
//               bottomRight: Radius.circular(25.r),
//             ),
//           ),
//         ),
//         child,
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradientHeader extends StatelessWidget {
  final Widget child;

  const GradientHeader({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(25),
        bottomRight: Radius.circular(25),
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF66BDFF), Color(0xFF065087)],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25.0.r),
            bottomRight: Radius.circular(25.0.r),
          ),
        ),
        child: child,
      ),
    );
  }
}