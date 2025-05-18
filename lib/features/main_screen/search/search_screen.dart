import 'package:active_bee/core/app_constants/app_assets.dart';
import 'package:active_bee/core/app_theme/app_colors.dart';
import 'package:active_bee/core/app_theme/app_text_styles.dart';
import 'package:active_bee/core/app_widgets/food_categories_container.dart';
import 'package:active_bee/core/app_widgets/custom_text_form_field.dart';
import 'package:active_bee/features/main_screen/home/cubit/location_cubit.dart';
import 'package:active_bee/features/main_screen/home/cubit/location_state.dart';
import 'package:active_bee/features/main_screen/search/cubit/category_search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                      BlocBuilder<LocationCubit, LocationState>(
                        builder: (context, state) {
                          if (state is LocationLoading) {
                            return Text(
                              "Location is being\ndetermined...",
                              style: AppTextStyles.f16W600SecColor.copyWith(
                                color: AppColors.primaryColor,
                              ),
                            );
                          } else if (state is LocationSuccess) {
                            return Text(
                              "${state.cityName}",
                              style: AppTextStyles.f16W600SecColor.copyWith(
                                color: AppColors.primaryColor,
                              ),
                            );
                          } else if (state is LocationError) {
                            return Text(
                              state.message,
                              style: AppTextStyles.f16W600SecColor.copyWith(
                                color: Colors.redAccent,
                              ),
                            );
                          } else {
                            return Text(
                              "Current location",
                              style: AppTextStyles.f16W600SecColor.copyWith(
                                color: AppColors.primaryColor,
                              ),
                            );
                          }
                        },
                      ),
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
                controller: searchController,
                textInputAction: TextInputAction.done,
                hintText: "Restaurant, shop and category",
                keyBoardType: TextInputType.text,
                validationMessage: "The field cannot be empty",
                prefixIcon: SvgPicture.asset(AppAssets.unselectedSearch),
                suffixIcon: searchController.text.isNotEmpty
                    ? IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          searchController.clear();
                          context.read<CategorySearchCubit>().clearSearch();
                        },
                      )
                    : null,
                onChanged: (query) =>
                    context.read<CategorySearchCubit>().filter(query),
              ),
              SizedBox(height: 24.h),
              Expanded(
                child:
                    BlocBuilder<CategorySearchCubit, List<Map<String, String>>>(
                  builder: (context, filteredCategories) {
                    if (filteredCategories.isEmpty) {
                      return Center(child: Text('No results found'));
                    }
                    return GridView.builder(
                      itemCount: filteredCategories.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (context, index) {
                        final item = filteredCategories[index];
                        return FoodCategoriesContainer(
                          item: item,
                          ContainerHeight: 100,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
