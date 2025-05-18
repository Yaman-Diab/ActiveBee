import 'package:active_bee/core/app_constants/app_assets.dart';
import 'package:active_bee/core/app_theme/app_colors.dart';
import 'package:active_bee/core/app_theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuItemModel {
  final String title;
  final IconData? icon;
  final bool isNew;
  final bool isSection;

  MenuItemModel({
    required this.title,
    this.icon,
    this.isNew = false,
    this.isSection = false,
  });
}

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final List<MenuItemModel> _menuItems = [
    MenuItemModel(title: 'Edit Profile', icon: Icons.person, isSection: true),
    MenuItemModel(
      title: 'Account Information',
      icon: Icons.person_pin_sharp,
      isSection: true,
    ),
    MenuItemModel(title: 'My Orders'),
    MenuItemModel(title: 'My Addresses'),
    MenuItemModel(title: 'Wallet', isNew: true),
    MenuItemModel(title: 'Favorites'),
    MenuItemModel(title: 'Sharing', icon: Icons.group, isSection: true),
    MenuItemModel(title: 'Invite Friends'),
    MenuItemModel(title: 'Settings', icon: Icons.settings, isSection: true),
    MenuItemModel(title: 'Language'),
    MenuItemModel(
        title: 'Help Center', icon: Icons.help_outline, isSection: true),
    MenuItemModel(title: 'Privacy Policy'),
    MenuItemModel(title: 'Terms of Use'),
    MenuItemModel(title: 'Get Help'),
    MenuItemModel(title: 'About us'),
    MenuItemModel(title: 'Join the Delivery Team'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 24.h),
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  "Yaman Diab",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.secondaryColor,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemCount: _menuItems.length,
                itemBuilder: (context, index) {
                  final item = _menuItems[index];
                  return item.isSection
                      ? _sectionTitle(item.icon!, item.title)
                      : _menuItem(item.title, isNew: item.isNew);
                },
                // separatorBuilder: (context, index) => SizedBox(height: 4.h),
                separatorBuilder: (context, index) {
                  final item = _menuItems[index];

                  return item.isSection
                      ? SizedBox.shrink()
                      : SizedBox(height: 4.h);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.thirdColor,
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0.r),
        ),
        child: SvgPicture.asset(AppAssets.chatBubbles),
      ),
    );
  }

  Widget _sectionTitle(IconData icon, String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: AppColors.primaryColor),
              SizedBox(width: 8.w),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          (title == 'Edit Profile')
              ? Icon(
                  Icons.arrow_right,
                  size: 24.sp,
                  color: AppColors.secondaryColor,
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget _menuItem(String title, {bool isNew = false}) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade400, width: 1),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: AppTextStyles.f20W400SecColor),
                  if (isNew)
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                      margin: EdgeInsets.only(left: 8.w),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Text(
                        'NEW',
                        style: AppTextStyles.f12W400White
                      ),
                    ),
                ],
              ),
            ),
            Icon(Icons.arrow_right,
                size: 24.sp, color: AppColors.secondaryColor),
          ],
        ),
      ),
    );
  }
}
