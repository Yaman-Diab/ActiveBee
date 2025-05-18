import 'package:active_bee/core/app_constants/app_assets.dart';
import 'package:active_bee/core/app_constants/app_categories.dart';
import 'package:active_bee/core/app_theme/app_colors.dart';
import 'package:active_bee/core/app_theme/app_text_styles.dart';
import 'package:active_bee/core/app_widgets/food_categories_container.dart';
import 'package:active_bee/features/app_categories/constant/all_resturants.dart';
import 'package:active_bee/features/app_categories/widget/filter_chip_item.dart';
import 'package:active_bee/features/app_categories/widget/restaurant_item_card.dart';
import 'package:active_bee/features/app_categories/widget/sort_by_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RestaurantsScreen extends StatelessWidget {
  const RestaurantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Text(
          "Restaurants",
          style: AppTextStyles.f20W600SecColor,
        ),
        centerTitle: true,
        leading: IconButton(
          color: AppColors.secondaryColor,
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: SvgPicture.asset(
              AppAssets.unselectedSearch,
              color: AppColors.secondaryColor,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Categories",
              style: AppTextStyles.f20W600Primary.copyWith(
                color: AppColors.secondaryColor,
              ),
            ),
            SizedBox(height: 12.h),
            SizedBox(
              height: 100.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: foodCategories.length,
                itemBuilder: (context, index) {
                  final item = foodCategories[index];
                  return Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: FoodCategoriesContainer(
                      item: item,
                      ContainerHeight: 60,
                      ContainerWidth: 160,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FilterChipItem(label: "Online"),
                FilterChipItem(label: "24 h"),
                FilterChipItem(label: "Free Delivery"),
                SortByChip(onTap: () {}),
              ],
            ),
            SizedBox(height: 16.h),

            // ✅ استخدام allRestaurant هنا
            Expanded(
              child: ListView.builder(
                itemCount: allRestaurant.length,
                itemBuilder: (context, index) {
                  final restaurant = allRestaurant[index];
                  return RestaurantItemCard(restaurant: restaurant);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
