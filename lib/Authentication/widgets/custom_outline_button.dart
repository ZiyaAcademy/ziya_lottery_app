import 'package:flutter/material.dart';
import 'package:ziya_lottery_app/Constants/app_colors.dart';

class CustomOutlineButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomOutlineButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.white,
        side: const BorderSide(color: AppColors.white, width: 1),
        minimumSize: const Size(double.infinity, 57),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
