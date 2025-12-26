import 'package:flutter/material.dart';
import 'package:ziya_lottery_app/Constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? height;
  final List<Color>? colors;
  final double? borderRadius;
  final Color? textColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height,
    this.colors,
    this.borderRadius,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final buttonHeight = height ?? 56.0;
    final buttonRadius = borderRadius ?? 15.0;
    final gradientColors =
        colors ?? [AppColors.gradientLight, AppColors.primaryBlue];

    // Detect if only one color or same colors are provided
    final isSingleColor =
        gradientColors.length == 1 ||
        gradientColors.every((c) => c == gradientColors.first);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        padding: EdgeInsets.zero,
        minimumSize: Size(double.infinity, buttonHeight),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(buttonRadius),
        ),
        elevation: 0,
      ),
      onPressed: onPressed,
      child: Ink(
        decoration: BoxDecoration(
          color: isSingleColor ? gradientColors.first : null,
          gradient: isSingleColor
              ? null
              : LinearGradient(
                  colors: gradientColors,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
          borderRadius: BorderRadius.circular(buttonRadius),
        ),
        child: Container(
          height: buttonHeight,
          width: double.infinity,
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: textColor ?? AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
