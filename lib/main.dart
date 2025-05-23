import 'package:active_bee/core/cubit/auth_cubit.dart';
import 'package:active_bee/core/theme/app_colors.dart';
import 'package:active_bee/core/widgets/bottom_navigation_bar/cubit/bottom_navigation_cubit.dart';
import 'package:active_bee/features/auth/screens/log_in_screen.dart';
import 'package:active_bee/features/main_screen/home/cubit/location_cubit.dart';
import 'package:active_bee/features/main_screen/home/manager/location_maneger.dart';
import 'package:active_bee/features/main_screen/home/manager/server_manager.dart';
import 'package:active_bee/features/main_screen/search/cubit/category_search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<BottomNavigationCubit>(
              create: (context) => BottomNavigationCubit(),
            ),
            BlocProvider<LocationCubit>(
              create: (context) => LocationCubit(
                locationManager: LocationManager(),
                serverManager: ServerManager(),
              )..fetchCityName(),
            ),
            BlocProvider<CategorySearchCubit>(
              create: (context) => CategorySearchCubit(),
            ),
            BlocProvider<AuthCubit>(
              create: (context) =>
                  AuthCubit()..checkLoginStatus(),
            ),
          ],
          child: MaterialApp(
            theme: ThemeData(
              textSelectionTheme: TextSelectionThemeData(
                cursorColor: AppColors.primaryColor,
                selectionColor: AppColors.primaryColor.withValues(alpha: 0.5),
                selectionHandleColor: AppColors.primaryColor,
              ),
            ),
            debugShowCheckedModeBanner: false,
            home: LogInScreen(),
          ),
        );
      },
    );
  }
}
