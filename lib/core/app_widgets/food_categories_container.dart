import 'package:active_bee/core/app_theme/app_colors.dart';
import 'package:active_bee/core/app_theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodCategoriesContainer extends StatelessWidget {
  const FoodCategoriesContainer({
    super.key,
    required this.item,
    required this.ContainerHeight,
    this.ContainerWidth,
  });

  final double? ContainerHeight;
  final double? ContainerWidth;
  final Map<String, String> item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.thirdColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            item['image']!,
            height: ContainerHeight,
            fit: BoxFit.contain,
            width: ContainerWidth,
          ),
          SizedBox(height: 8.h),
          Text(
            item['label']!,
            style: AppTextStyles.f14W600SecColor,
          ),
        ],
      ),
    );
  }
}
