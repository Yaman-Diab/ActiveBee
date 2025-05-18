import 'package:active_bee/core/app_constants/app_assets.dart';
import 'package:active_bee/core/app_constants/app_categories.dart';
import 'package:active_bee/core/app_theme/app_colors.dart';
import 'package:active_bee/core/app_theme/app_text_styles.dart';
import 'package:active_bee/core/app_widgets/app_categories_container.dart';
import 'package:active_bee/core/app_widgets/rounded_image.dart';
import 'package:active_bee/features/main_screen/home/cubit/location_cubit.dart';
import 'package:active_bee/features/main_screen/home/cubit/location_state.dart';
import 'package:active_bee/features/main_screen/home/screen/my_cart.dart';
import 'package:active_bee/features/main_screen/home/widget/offers_section.dart';
import 'package:active_bee/features/app_categories/restaurants_screen.dart';
import 'package:active_bee/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200.h,
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(12.w),
                    height: 160.h,
                    color: AppColors.primaryColor,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on_rounded,
                          color: Colors.white,
                          size: 32,
                        ),
                        SizedBox(width: 4.w),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text("Deliver to:",
                                style: AppTextStyles.f16W600White),
                            BlocBuilder<LocationCubit, LocationState>(
                              builder: (context, state) {
                                if (state is LocationLoading) {
                                  return Text(
                                    "Location is being\ndetermined...",
                                    style: AppTextStyles.f20W600SecColor
                                        .copyWith(color: AppColors.whiteColor),
                                  );
                                } else if (state is LocationSuccess) {
                                  return Text(
                                    "${state.cityName}",
                                    style: AppTextStyles.f20W600SecColor
                                        .copyWith(color: AppColors.whiteColor),
                                  );
                                } else if (state is LocationError) {
                                  return Text(
                                    state.message,
                                    style: AppTextStyles.f20W600SecColor
                                        .copyWith(color: Colors.redAccent),
                                  );
                                } else {
                                  return Text(
                                    "Current location is: ",
                                    style: AppTextStyles.f20W600SecColor
                                        .copyWith(color: AppColors.whiteColor),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                        SizedBox(width: 4.w),
                        IconButton(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: AppColors.whiteColor,
                            size: 36,
                          ),
                          onPressed: () {},
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => MyCart(),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.shopping_cart_outlined,
                            color: AppColors.whiteColor,
                            size: 32,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 68.h,
                      margin: EdgeInsets.symmetric(horizontal: 12.w),
                      padding: EdgeInsets.symmetric(horizontal: 12.h),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 4.r,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                AppAssets.funnyBee,
                                width: 60,
                                height: 60,
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Center(
                                child: Text("Loyalty Store",
                                    style: AppTextStyles.f20W600SecColor),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 8.h, left: 16.w),
                                child: Icon(Icons.info_outline),
                              ),
                              Text(
                                "0 Points",
                                style: AppTextStyles.f14W400Grey.copyWith(
                                  color: AppColors.primaryColor,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.only(right: 20.w, left: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24.h),
                  SizedBox(
                    height: 180.h,
                    child: Column(
                      children: [
                        Expanded(
                          child: PageView(
                            controller: _pageController,
                            children: [
                              RoundedImage(
                                imagePath: AppAssets.orderNow,
                              ),
                              RoundedImage(
                                imagePath: AppAssets.getDelivered,
                              ),
                              RoundedImage(
                                imagePath: AppAssets.clickNow,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8.h),
                        SmoothPageIndicator(
                          controller: _pageController,
                          count: 3,
                          effect: WormEffect(
                            dotColor: Colors.grey.shade400,
                            activeDotColor: AppColors.primaryColor,
                            dotHeight: 10.h,
                            dotWidth: 10.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    "What would you like to order?",
                    style: AppTextStyles.f20W600SecColor,
                  ),
                  SizedBox(height: 16.h),
                  SizedBox(
                    height: 100.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: appCategories.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(width: 8.w),
                      itemBuilder: (context, index) {
                        return AppCategoriesContainer(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => RestaurantsScreen(),
                              ),
                            );
                          },
                          icon: appCategories[index]['icon'] as IconData,
                          title: appCategories[index]['title'] as String,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4.r,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AppAssets.percent,
                          width: 68,
                          height: 68,
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Text(
                            "Sign in and get \nspecial discounts",
                            style: AppTextStyles.f16W400SecColor,
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios,
                            size: 36, color: AppColors.primaryColor),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  OffersSection(
                    title: "ActiveBee offers",
                    imagePaths: [
                      AppAssets.hamburger,
                      AppAssets.burger,
                      AppAssets.rice,
                      AppAssets.taco,
                      AppAssets.grills,
                      AppAssets.cheesePoke,
                    ],
                    imageWidth: 100.w,
                    imageHeight: 136.h,
                  ),
                  SizedBox(height: 24.h),
                  OffersSection(
                    title: "Restaurants recommended by ActiveBee",
                    imagePaths: [
                      AppAssets.hamburger,
                      AppAssets.burger,
                      AppAssets.rice,
                      AppAssets.taco,
                      AppAssets.grills,
                      AppAssets.cheesePoke,
                    ],
                    imageWidth: 240.w,
                    imageHeight: 160.h,
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
