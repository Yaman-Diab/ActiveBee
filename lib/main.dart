import 'package:active_bee/core/app_theme/app_colors.dart';
import 'package:active_bee/core/app_widgets/bottom_navigation_bar/cubit/bottom_navigation_cubit.dart';
import 'package:active_bee/features/auth/screens/log_in_screen.dart';
import 'package:active_bee/features/auth/screens/otp_verification_screen.dart';
import 'package:active_bee/features/main_screen/main_screen.dart';
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
        return MaterialApp(
          theme: ThemeData(
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: AppColors.primaryColor,
              selectionColor: AppColors.primaryColor.withOpacity(0.5),
              selectionHandleColor: AppColors.primaryColor,
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: MultiBlocProvider(
            providers: [
              BlocProvider<BottomNavigationCubit>(
                create: (context) => BottomNavigationCubit(),
              ),
            ],
            child: LogInScreen(),
          ),
        );
      },
    );
  }
}
