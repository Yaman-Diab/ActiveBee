import 'package:active_bee/core/constant/app_assets.dart';
import 'package:active_bee/core/theme/app_colors.dart';
import 'package:active_bee/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Text(
          "Favorite Screen",
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
        "No Favorites Yet",
        style: AppTextStyles.f14W600SecColor,
      )),
    );
  }
}
