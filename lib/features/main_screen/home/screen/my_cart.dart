import 'package:active_bee/core/app_constants/app_assets.dart';
import 'package:active_bee/core/app_theme/app_colors.dart';
import 'package:active_bee/core/app_theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Text(
          "My Cart",
          style: AppTextStyles.f20W600SecColor,
        ),
        centerTitle: true,
        leading: IconButton(
          color: AppColors.secondaryColor,
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
          child: Text(
        "No carts added",
        style: AppTextStyles.f14W600SecColor,
      )),
    );
  }
}
