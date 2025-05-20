import 'package:active_bee/core/theme/app_colors.dart';
import 'package:active_bee/core/theme/app_text_styles.dart';
import 'package:active_bee/features/restaurant_flow/models/food_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodMenuItem extends StatelessWidget {
  final FoodMenuItemModel item;

  const FoodMenuItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Colors.white,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // النصوص على اليسار
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: AppTextStyles.f20W600SecColor,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    item.description,
                    style: AppTextStyles.f12W400SecColor,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Text(
                        item.price,
                        style: AppTextStyles.f16W500SecColor,
                      ),
                      if (item.oldPrice != null && item.discount != null) ...[
                        SizedBox(width: 6.w),
                        Text(
                          item.oldPrice!,
                          style: AppTextStyles.f12W400SecColor.copyWith(
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          item.discount!,
                          style: AppTextStyles.f16W600Primary,
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.asset(
                item.image,
                width: 120.w,
                height: 80.h,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
