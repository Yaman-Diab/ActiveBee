import 'package:active_bee/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OffersSection extends StatelessWidget {
  final String title;
  final List<String> imagePaths;
  final double imageWidth;
  final double imageHeight;

  const OffersSection({
    super.key,
    required this.title,
    required this.imagePaths,
    required this.imageWidth,
    required this.imageHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.f20W600SecColor),
        SizedBox(height: 12.h),
        SizedBox(
          height: imageHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: imagePaths.length,
            itemBuilder: (context, index) {
              return Container(
                width: imageWidth,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(imagePaths[index]),
                  ),
                  borderRadius: BorderRadius.circular(12.r),
                ),
              );
            },
            separatorBuilder: (_, __) => SizedBox(width: 8.w),
          ),
        ),
      ],
    );
  }
}
