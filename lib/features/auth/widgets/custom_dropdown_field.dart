
import 'package:active_bee/core/app_theme/app_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdownField extends StatelessWidget {
  final String? hintText;
  final ValueListenable<String?> valueListenable;
  final List<String> items;
  final void Function(String?) onChanged;
  final bool hasLabel;

  const CustomDropdownField({
    super.key,
    this.hintText,
    required this.valueListenable,
    required this.items,
    required this.onChanged,
    this.hasLabel = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ValueListenableBuilder<String?>(
          valueListenable: valueListenable,
          builder: (context, value, child) {
            return DropdownButtonFormField<String>(
              value: value,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(12.h),
                hintText: hintText,
                filled: true,
                fillColor: AppColors.backgroundColor,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.r),
                  borderSide: BorderSide(color: AppColors.secondaryColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.r),
                  borderSide: BorderSide(
                    color: AppColors.primaryColor,
                    width: 2.w,
                  ),
                ),
              ),
              items: items.map((item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: onChanged,
            );
          },
        ),
      ],
    );
  }
}
