import 'package:active_bee/core/app_theme/app_colors.dart';
import 'package:active_bee/core/app_theme/app_text_styles.dart';
import 'package:active_bee/features/app_categories/models/restaurant_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestaurantInfo extends StatelessWidget {
  const RestaurantInfo({required this.restaurant});
  final RestaurantModel restaurant;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, // يسمح بخروج الصورة خارج الـ Container
      children: [
        // Container الأساسي
        Container(
          decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),
          padding: EdgeInsets.only(
            top: 28.r,
            left: 16.r,
            right: 16.r,
            bottom: 16.r,
          ),
          height: 160.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                restaurant.name,
                style: AppTextStyles.f20W600SecColor,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    restaurant.type,
                    style: AppTextStyles.f12W400Grey,
                  ),
                  Text(
                    restaurant.openingHours,
                    style: AppTextStyles.f12W400Grey,
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        restaurant.deliveryTime,
                        style: AppTextStyles.f16W500SecColor,
                      ),
                      Text(
                        "Delivery time",
                        style: AppTextStyles.f12W400SecColor,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        restaurant.deliveryFee,
                        style: AppTextStyles.f16W500SecColor,
                      ),
                      Text(
                        "Delivery fee",
                        style: AppTextStyles.f12W400SecColor,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        restaurant.distance,
                        style: AppTextStyles.f16W500SecColor,
                      ),
                      Text(
                        "Distance",
                        style: AppTextStyles.f12W400SecColor,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),

        // الصورة الدائرية
        Positioned(
          top: -40.r,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              width: 80.r,
              height: 80.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 0, 0, 0)
                        .withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: Offset(4, -4),
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 40.r,
                backgroundImage: AssetImage(restaurant.logoPath),
              ),
            ),
          ),
        ),

        Positioned(
          top: 24.h, // ← نصف القطر حتى تظهر الصورة فوق الـ Container
          left: 0,
          right: 50.w,
          child: Center(
            child: CircleAvatar(
              radius: 8.r,
              backgroundColor:
                  (restaurant.isOpened == true) ? Colors.green : Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
