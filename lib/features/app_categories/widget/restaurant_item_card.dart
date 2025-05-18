import 'package:active_bee/core/app_theme/app_colors.dart';
import 'package:active_bee/core/app_theme/app_text_styles.dart';
import 'package:active_bee/core/app_widgets/rounded_image.dart';
import 'package:active_bee/features/app_categories/models/restaurant_model.dart';
import 'package:active_bee/features/app_categories/restaurant_details_page%20.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestaurantItemCard extends StatelessWidget {
  final RestaurantModel restaurant;
  final VoidCallback? onTap;

  const RestaurantItemCard({
    Key? key,
    required this.restaurant,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RestaurantDetailsPage(restaurant: restaurant),
          ),
        );
      },
      child: Stack(
        children: [
          Card(
            margin: EdgeInsets.only(bottom: 16.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RoundedImage(
                  imagePath: restaurant.imageAsset,
                  imageHeight: 120.h,
                  borderRadius: 12.r,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.all(12.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurant.name,
                        style: AppTextStyles.f20W600SecColor,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        restaurant.type,
                        style: AppTextStyles.f14W400Grey.copyWith(
                          color: AppColors.greyFontColor,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "Delivery fee: ${restaurant.deliveryFee}",
                        style: AppTextStyles.f16W400SecColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // شعار المطعم (اللوغو)
          Positioned(
            top: 100.h,
            right: 16.w,
            child: CircleAvatar(
              radius: 24.r,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 22.r,
                backgroundImage: AssetImage(restaurant.logoPath),
              ),
            ),
          ),

          // مؤشر الحالة (مثلاً Online)
          Positioned(
            top: 135.h,
            right: 12.w,
            child: CircleAvatar(
              radius: 8.r,
              backgroundColor:
                  (restaurant.isOpened == true) ? Colors.green : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
