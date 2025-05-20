import 'package:active_bee/core/cubit/favorite_cubit.dart';
import 'package:active_bee/core/theme/app_colors.dart';
import 'package:active_bee/core/theme/app_text_styles.dart';
import 'package:active_bee/core/widgets/rounded_image.dart';
import 'package:active_bee/features/restaurant_flow/models/restaurant_model.dart';
import 'package:active_bee/features/restaurant_flow/restaurant_details_page%20.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            builder: (context) => BlocProvider(
              create: (_) => FavoriteCubit(),
              child: RestaurantDetailsPage(restaurant: restaurant),
            ),
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
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: Offset(4, -4),
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 22.r,
                backgroundImage: AssetImage(restaurant.logoPath),
              ),
            ),
          ),

          // مؤشر الحالة (مثلاً Online)
          Positioned(
            top: 130.h,
            right: 12.w,
            child: CircleAvatar(
              radius: 6.r,
              backgroundColor:
                  (restaurant.isOpened == true) ? Colors.green : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
