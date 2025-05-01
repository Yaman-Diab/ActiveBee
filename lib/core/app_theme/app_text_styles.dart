import 'package:active_bee/core/app_theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  /// Font Size 24

  static final TextStyle f24W600SecColor = TextStyle(
    color: AppColors.secondaryColor,
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
  );

  /// Font Size 20
  static final TextStyle f20W600Primary = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle f20W600SecColor = TextStyle(
    color: AppColors.secondaryColor,
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
  );

  /// Font Size 16
  static final TextStyle f16W600White = TextStyle(
    color: AppColors.whiteColor,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle f16W400SecColor = TextStyle(
    color: AppColors.secondaryColor,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle f16W600SecColor = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.secondaryColor,
  );

  /// Font Size 14
  static final TextStyle f14W500Grey = TextStyle(
    color: AppColors.greyFontColor,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle f14W600SecColor = TextStyle(
    color: AppColors.secondaryColor,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle f14W400SecColor = TextStyle(
    color: AppColors.secondaryColor,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle f14W400Grey = TextStyle(
    color: AppColors.greyFontColor,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle f14W400SecColorWithOpacity = TextStyle(
    color: AppColors.secondaryColor.withOpacity(0.7),
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );

  /// Font Size 12
  static final TextStyle f12W400SecColor = TextStyle(
    color: AppColors.secondaryColor,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  );
}
