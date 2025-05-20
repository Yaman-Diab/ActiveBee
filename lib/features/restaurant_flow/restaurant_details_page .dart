import 'package:active_bee/core/theme/app_colors.dart';
import 'package:active_bee/core/theme/app_text_styles.dart';
import 'package:active_bee/features/restaurant_flow/data/all_menu_items.dart';
import 'package:active_bee/features/restaurant_flow/function/share_restaurant.dart';
import 'package:active_bee/features/restaurant_flow/models/food_menu_item.dart';
import 'package:active_bee/features/restaurant_flow/models/restaurant_model.dart';
import 'package:active_bee/core/widgets/favorite_search_share_bar.dart';
import 'package:active_bee/features/restaurant_flow/widget/restaurant_info.dart';
import 'package:active_bee/features/restaurant_flow/widget/food_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grouped_list/grouped_list.dart';

class RestaurantDetailsPage extends StatelessWidget {
  final RestaurantModel restaurant;
  const RestaurantDetailsPage({super.key, required this.restaurant});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          Column(
            children: [
              Image.asset(
                restaurant.imageAsset,
                height: 220.h,
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
              top: 40.h,
              left: 20.w,
              right: 20.w,
              child: FavoriteSearchShareBar(
                onSharePressed: () {
                  shareRestaurant(restaurant);
                },
              )),
          Positioned(
            top: 184.h,
            left: 20.w,
            right: 20.w,
            child: RestaurantInfo(restaurant: restaurant),
          ),
        ],
      ),
    );
  }
}



