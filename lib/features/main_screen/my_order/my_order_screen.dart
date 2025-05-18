import 'package:active_bee/core/app_theme/app_colors.dart';
import 'package:active_bee/core/app_theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'My Orders',
            style: AppTextStyles.f24W600SecColor,
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(48.h),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  )
                ],
              ),
              child: TabBar(
                indicatorColor: AppColors.primaryColor,
                indicatorWeight: 2,
                labelColor: AppColors.primaryColor,
                unselectedLabelColor: AppColors.primaryColor.withOpacity(0.5),
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15.sp,
                ),
                unselectedLabelStyle: AppTextStyles.f16W600SecColor,
                tabs: const [
                  Tab(text: 'My Orders'),
                  Tab(text: "Future Orders"),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Text(
                'My Orders',
                style: AppTextStyles.f12W400SecColor,
              ),
            ),
            Center(
              child: Text(
                "Future Orders",
                style: AppTextStyles.f12W400SecColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
