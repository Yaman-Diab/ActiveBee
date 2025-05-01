import 'package:active_bee/core/app_constants/app_assets.dart';
import 'package:active_bee/core/app_theme/app_colors.dart';
import 'package:active_bee/core/app_theme/app_text_styles.dart';
import 'package:active_bee/core/app_widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> categories = [
      {"label": "Chicken", "image": AppAssets.chicken},
      {"label": "Grills", "image": AppAssets.grill1},
      {"label": "Mandi", "image": AppAssets.mandi},
      {"label": "Sandwich", "image": AppAssets.sandwich},
      {"label": "Salad", "image": AppAssets.salad},
      {"label": "Dessert", "image": AppAssets.dessert},
      {"label": "Stationery", "image": AppAssets.stationery},
      {"label": "Cosmetics", "image": AppAssets.cosmetics},
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Search',
                  style: AppTextStyles.f24W600SecColor,
                ),
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Deliver to: ",
                        style: AppTextStyles.f14W400SecColor,
                      ),
                      Text("Current location",
                          style: AppTextStyles.f16W600SecColor.copyWith(
                            color: AppColors.primaryColor,
                          )),
                      Icon(Icons.keyboard_arrow_down,
                          color: AppColors.primaryColor),
                    ],
                  ),
                  Icon(Icons.shopping_cart_outlined,
                      size: 32, color: AppColors.primaryColor),
                ],
              ),
              SizedBox(height: 16.h),
              CustomTextFormField(
                  fillColor: AppColors.secondaryColor.withOpacity(.2),
                  hintText: "Restaurant, store, category..",
                  prefixIcon: SvgPicture.asset(AppAssets.unselectedSearch),
                  controller: _searchController,
                  validationMessage: "validationMessage",
                  keyBoardType: TextInputType.text),
              SizedBox(height: 24.h),
              Expanded(
                child: GridView.builder(
                  itemCount: categories.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.w,
                    mainAxisSpacing: 16.h,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    final item = categories[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: AppColors.thirdColor,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            item['image']!,
                            height: 100.h,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            item['label']!,
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
