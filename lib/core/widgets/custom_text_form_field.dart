// import 'package:active_bee/core/app_theme/app_colors.dart';
// import 'package:active_bee/core/app_theme/app_text_styles.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CustomTextFormField extends StatelessWidget {
//   const CustomTextFormField({
//     super.key,
//     required this.controller,
//     required this.validationMessage,
//     required this.keyBoardType,
//     this.hintText,
//     this.suffixIcon,
//     this.prefixIcon,
//     this.obscureText = false,
//     this.fillColor = AppColors.backgroundColor,
//   });

//   final String? hintText;
//   final TextEditingController controller;
//   final IconButton? suffixIcon;
//   final Widget? prefixIcon;
//   final bool obscureText;
//   final String validationMessage;
//   final TextInputType keyBoardType;
//   final Color? fillColor;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 353.w,
//       child: TextFormField(
//         controller: controller,
//         cursorColor: AppColors.primaryColor,
//         keyboardType: keyBoardType,
//         decoration: InputDecoration(
//           contentPadding:
//               EdgeInsets.symmetric(vertical: 10.w, horizontal: 10.h),
//           fillColor: fillColor,
//           filled: true,
//           hintText: hintText,
//           hintStyle: AppTextStyles.f14W500Grey,
//           errorBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(30.r),
//             borderSide: BorderSide(color: AppColors.errorColor),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(30.r),
//             borderSide: BorderSide(color: AppColors.secondaryColor),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(30.r),
//             borderSide: BorderSide(color: AppColors.primaryColor, width: 2.w),
//           ),
//           suffixIcon: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 15.0.w),
//             child: suffixIcon,
//           ),
//           suffixIconConstraints:
//               BoxConstraints(minHeight: 18.h, minWidth: 22.w),
//           prefixIcon: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 19.0.w),
//             child: prefixIcon,
//           ),
//           prefixIconConstraints:
//               BoxConstraints(minHeight: 23.h, minWidth: 17.w),
//         ),
//         textInputAction: TextInputAction.next,
//         obscureText: obscureText,
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return validationMessage;
//           }
//           return null;
//         },
//       ),
//     );
//   }
// }
import 'package:active_bee/core/theme/app_colors.dart';
import 'package:active_bee/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.validationMessage,
    required this.keyBoardType,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText = false,
    this.fillColor = AppColors.backgroundColor,
    this.onChanged,
    this.textInputAction = TextInputAction.next,
  });

  final String? hintText;
  final TextEditingController controller;
  final IconButton? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final String validationMessage;
  final TextInputType keyBoardType;
  final Color? fillColor;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 353.w,
      child: TextFormField(
        controller: controller,
        cursorColor: AppColors.primaryColor,
        textInputAction: textInputAction,
        keyboardType: keyBoardType,
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.w, horizontal: 10.h),
          fillColor: fillColor,
          filled: true,
          hintText: hintText,
          hintStyle: AppTextStyles.f14W500Grey,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide(color: AppColors.errorColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide(color: AppColors.secondaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide(color: AppColors.primaryColor, width: 2.w),
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0.w),
            child: suffixIcon,
          ),
          suffixIconConstraints:
              BoxConstraints(minHeight: 18.h, minWidth: 22.w),
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 19.0.w),
            child: prefixIcon,
          ),
          prefixIconConstraints:
              BoxConstraints(minHeight: 23.h, minWidth: 17.w),
        ),
        obscureText: obscureText,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return validationMessage;
          }
          return null;
        },
      ),
    );
  }
}
