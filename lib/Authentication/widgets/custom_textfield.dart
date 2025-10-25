// import 'package:flutter/material.dart';
// import 'package:ziya_lottery_app/Constants/app_colors.dart';

// class CustomTextField extends StatelessWidget {
//   final String label;
//   final String hint;
//   final TextEditingController controller;
//   final bool obscure;
//   final TextInputType keyboardType;

//   const CustomTextField({
//     super.key,
//     required this.label,
//     required this.hint,
//     required this.controller,
//     this.obscure = false,
//     this.keyboardType = TextInputType.text,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: controller,
//       obscureText: obscure,
//       keyboardType: keyboardType,
//       decoration: InputDecoration(
//         labelText: label,
//         hintText: hint,
//         labelStyle: const TextStyle(color: AppColors.grey),
//         enabledBorder: const UnderlineInputBorder(
//           borderSide: BorderSide(color: AppColors.grey),
//         ),
//         focusedBorder: const UnderlineInputBorder(
//           borderSide: BorderSide(color: AppColors.primaryBlue),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ziya_lottery_app/Constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final bool obscure;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.obscure = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextField(
          controller: controller,
          obscureText: obscure,
          keyboardType: keyboardType,
          style: TextStyle(fontSize: 16.sp, color: Colors.black),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: AppColors.grey, fontSize: 16.sp),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.grey, width: 1),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryBlue, width: 1.5),
            ),
            contentPadding: const EdgeInsets.only(bottom: 4),
          ),
        ),
      ],
    );
  }
}
