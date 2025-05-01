import 'package:active_bee/core/app_theme/app_colors.dart';
import 'package:active_bee/core/app_theme/app_text_styles.dart';
import 'package:active_bee/core/app_widgets/app_button.dart';
import 'package:active_bee/core/app_widgets/custom_text_form_field.dart';
import 'package:active_bee/features/auth/widgets/custom_dropdown_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController invitationCodeController =
      TextEditingController();

  final List<String> genderList = ['Male', 'Female'];
  final List<String> cityList = ['Damascus', 'Aleppo', 'Homs', 'Latakia'];

  final ValueNotifier<String?> selectedGender = ValueNotifier<String?>(null);
  final ValueNotifier<String?> selectedCity =
      ValueNotifier<String?>('Damascus');

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32.h),
              Text(
                'Personal Information',
                style: AppTextStyles.f24W600SecColor,
              ),
              SizedBox(height: 24.h),
              Text('Name', style: AppTextStyles.f14W600SecColor),
              SizedBox(height: 8.h),
              CustomTextFormField(
                hintText: "First and Last Name",
                controller: nameController,
                validationMessage: "Name is required",
                keyBoardType: TextInputType.name,
              ),
              SizedBox(height: 16.h),
              Text('Gender', style: AppTextStyles.f14W600SecColor),
              SizedBox(height: 8.h),
              CustomDropdownField(
                hintText: "Select Gender",
                valueListenable: selectedGender,
                items: genderList,
                onChanged: (newValue) {
                  selectedGender.value = newValue;
                },
              ),
              SizedBox(height: 16.h),
              Text('Your City', style: AppTextStyles.f14W600SecColor),
              SizedBox(height: 8.h),
              CustomDropdownField(
                hintText: "Select City",
                valueListenable: selectedCity,
                items: cityList,
                onChanged: (newValue) {
                  selectedCity.value = newValue;
                },
                hasLabel: true,
              ),
              SizedBox(height: 8.h),
              Divider(
                height: 20.h,
                color: AppColors.greyFontColor.withAlpha(124),
              ),
              SizedBox(height: 16.h),
              Text(
                'Please enter invitation code (Optional)',
                style: AppTextStyles.f14W600SecColor,
              ),
              SizedBox(height: 8.h),
              CustomTextFormField(
                hintText: "ASWEDFGHJKL",
                controller: invitationCodeController,
                validationMessage: "Invalid code",
                keyBoardType: TextInputType.text,
              ),
              SizedBox(
                height: 80,
              ),
              AppButton(buttonText: "Continue", buttonOnPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
