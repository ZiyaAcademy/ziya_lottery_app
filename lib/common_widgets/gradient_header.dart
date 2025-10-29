// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class GradientHeader extends StatelessWidget {
//   /// Default height if not passed
//   static double defaultHeight = 210.h;

//   final Widget child;
//   final double? height;

//   const GradientHeader({super.key, required this.child, this.height});

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           height: height ?? defaultHeight,
//           decoration: BoxDecoration(
//             gradient: const LinearGradient(
//               colors: [Color(0xFF66BDFF), Color(0xFF065087)],
//               begin: Alignment.topLeft,
//               end: Alignment.topRight,
//             ),
//             borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(25.0),
//               bottomRight: Radius.circular(25.0),
//             ),
//           ),
//         ),
//         child,
//       ],
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class GradientHeader extends StatelessWidget {
//   /// Static height used globally
//   static double defaultHeight = 210.h;

//   final Widget child;
//   final double? height;

//   GradientHeader({super.key, required this.child, this.height}) {
//     if (height != null) {
//       defaultHeight = height!;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           height: defaultHeight,
//           decoration: BoxDecoration(
//             gradient: const LinearGradient(
//               colors: [Color(0xFF66BDFF), Color(0xFF065087)],
//               begin: Alignment.topLeft,
//               end: Alignment.topRight,
//             ),
//             borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(25.0),
//               bottomRight: Radius.circular(25.0),
//             ),
//           ),
//         ),
//         child,
//       ],
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class GradientHeader extends StatelessWidget {
//   final Widget child;

//   const GradientHeader({super.key, required this.child});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.only(bottom: 20.h), // smooth bottom shape
//       decoration: BoxDecoration(
//         gradient: const LinearGradient(
//           colors: [Color(0xFF66BDFF), Color(0xFF065087)],
//           begin: Alignment.topLeft,
//           end: Alignment.topRight,
//         ),
//         borderRadius: BorderRadius.only(
//           bottomLeft: Radius.circular(25.0),
//           bottomRight: Radius.circular(25.0),
//         ),
//       ),
//       child: child,
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
