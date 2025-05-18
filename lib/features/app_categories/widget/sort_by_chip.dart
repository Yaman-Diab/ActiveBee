import 'package:active_bee/core/app_theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SortByChip extends StatelessWidget {
  final VoidCallback? onTap;

  const SortByChip({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 0.5,
              offset: Offset(0, 0.8),
            ),
          ],
        ),
        child: Row(
          children: [
            Text("Sort by", style: AppTextStyles.f16W400Black),
            Icon(Icons.keyboard_arrow_down),
          ],
        ),
      ),
    );
  }
}
