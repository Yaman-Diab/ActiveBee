import 'package:active_bee/core/theme/app_colors.dart';
import 'package:active_bee/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCategoriesContainer extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final String title;

  const AppCategoriesContainer({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 88.w,
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: 24.r,
              backgroundColor: AppColors.thirdColor,
              child: Icon(
                icon,
                color: AppColors.secondaryColor,
                size: 32,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              title,
              style: AppTextStyles.f12W400SecColor,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
