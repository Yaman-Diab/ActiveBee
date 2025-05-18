import 'package:active_bee/core/app_theme/app_text_styles.dart';
import 'package:active_bee/features/app_categories/constant/all_menu_items.dart';
import 'package:active_bee/features/app_categories/models/food_menu_item.dart';
import 'package:active_bee/features/app_categories/models/restaurant_model.dart';
import 'package:active_bee/features/app_categories/widget/restaurant_info.dart';
import 'package:active_bee/features/app_categories/widget/food_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grouped_list/grouped_list.dart';

class RestaurantDetailsPage extends StatelessWidget {
  final RestaurantModel restaurant;
  const RestaurantDetailsPage({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Image.asset(
                restaurant.imageAsset,
                height: 200.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 120.h),
              Expanded(
                child: GroupedListView<FoodMenuItemModel, String>(
                  elements: allMenuItems,
                  groupBy: (item) => item.category,
                  groupSeparatorBuilder: (String groupValue) => Padding(
                    padding: EdgeInsets.only(
                      top: 24.h,
                      bottom: 8.h,
                      left: 24.w,
                      right: 24.w,
                    ),
                    child:
                        Text(groupValue, style: AppTextStyles.f20W600SecColor),
                  ),
                  itemBuilder: (context, item) => FoodMenuItem(item: item),
                  separator: SizedBox(height: 8.h),
                  useStickyGroupSeparators: true,
                  padding: EdgeInsets.symmetric(horizontal: 8.r),
                ),
              ),
            ],
          ),
          Positioned(
            top: 180.h,
            left: 20.w,
            right: 20.w,
            child: RestaurantInfo(restaurant: restaurant),
          ),
        ],
      ),
    );
  }
}
