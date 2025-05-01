import 'package:active_bee/core/app_theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../app_theme/app_text_styles.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {this.buttonWidth = 353,
      required this.buttonText,
      required this.buttonOnPressed,
      this.textColor = AppColors.backgroundColor,
      this.buttonColor = AppColors.primaryColor,
      this.buttonColorSide = AppColors.primaryColor,
      super.key});

  final Color buttonColor;
  final Color buttonColorSide;
  final Color textColor;
  final String buttonText;
  final Function? buttonOnPressed;
  final double buttonWidth;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          buttonOnPressed!();
        },
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            side: BorderSide(color: buttonColorSide),
            backgroundColor: buttonColor,
            minimumSize: Size(buttonWidth.w, 48.h)),
        child: Text(
          buttonText,
          style: AppTextStyles.f16W600White.copyWith(color: textColor),
        ));
  }
}
