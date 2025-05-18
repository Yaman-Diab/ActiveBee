import 'package:active_bee/core/app_theme/app_colors.dart';
import 'package:active_bee/core/app_theme/app_text_styles.dart';
import 'package:active_bee/features/app_categories/models/food_menu_item.dart';
import 'package:flutter/material.dart';

class FoodMenuItem extends StatelessWidget {
  final FoodMenuItemModel item;

  const FoodMenuItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: AppColors.backgroundColor,
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
                  const SizedBox(height: 4),
                  Text(
                    item.description,
                    style: AppTextStyles.f12W400SecColor,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        item.price,
                        style: AppTextStyles.f16W500SecColor,
                      ),
                      if (item.oldPrice != null && item.discount != null) ...[
                        const SizedBox(width: 6),
                        Text(
                          item.oldPrice!,
                          style: AppTextStyles.f12W400SecColor.copyWith(
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        const SizedBox(width: 6),
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
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                item.image,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
