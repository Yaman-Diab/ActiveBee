import 'package:active_bee/core/app_constants/app_assets.dart';
import 'package:active_bee/core/app_theme/app_colors.dart';
import 'package:active_bee/features/main_screen/home/screen/home_screen.dart';
import 'package:active_bee/features/main_screen/my_order/my_order_screen.dart';
import 'package:active_bee/features/main_screen/profile/profile_screen.dart';
import 'package:active_bee/features/main_screen/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/app_widgets/bottom_navigation_bar/bottom_navigation_bar_items.dart';
import '../../core/app_widgets/bottom_navigation_bar/cubit/bottom_navigation_cubit.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    context.read<BottomNavigationCubit>().changePageIndex(newPageIndex: 0);
  }

  List<Widget> pages = [
    HomeScreen(),
    SearchScreen(),
    MyOrderScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
      builder: (BuildContext context, BottomNavigationState state) {
        return Scaffold(
          body: pages[state.pageIndex],
          bottomNavigationBar: SizedBox(
            height: 65.h,
            child: BottomNavigationBar(
              backgroundColor: AppColors.whiteColor,
              currentIndex: state.pageIndex,
              selectedFontSize: 14.sp,
              unselectedFontSize: 14.sp,
              selectedItemColor: AppColors.primaryColor,
              // unselectedItemColor: AppColors.secondaryColor,
              onTap: (index) {
                context
                    .read<BottomNavigationCubit>()
                    .changePageIndex(newPageIndex: index);
              },
              elevation: 10.0,
              type: BottomNavigationBarType.fixed,
              items: [
                bottomNavBarItem(
                  title: 'Home',
                  icon: state.pageIndex == 0
                      ? AppAssets.selectedHome
                      : AppAssets.unselectedHome,
                ),
                bottomNavBarItem(
                  title: 'Search',
                  icon: state.pageIndex == 1
                      ? AppAssets.selectedSearch
                      : AppAssets.unselectedSearch,
                ),
                bottomNavBarItem(
                  title: 'My Order',
                  icon: state.pageIndex == 2
                      ? AppAssets.selectedCube
                      : AppAssets.unselectedCube,
                ),
                bottomNavBarItem(
                  title: 'Profile',
                  icon: state.pageIndex == 3
                      ? AppAssets.selectedProfile
                      : AppAssets.unselectedProfile,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
