import 'package:active_bee/core/constant/app_assets.dart';
import 'package:active_bee/core/cubit/auth_cubit.dart';
import 'package:active_bee/core/theme/app_colors.dart';
import 'package:active_bee/core/theme/app_text_styles.dart';
import 'package:active_bee/core/widgets/app_button.dart';
import 'package:active_bee/core/widgets/custom_text_form_field.dart';
import 'package:active_bee/features/auth/screens/show_bottom_sheet.dart';
import 'package:active_bee/features/main_screen/home/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogInScreen extends StatelessWidget {
  final TextEditingController _phoneController = TextEditingController();

  LogInScreen({super.key});
  ShowBottomSheet showBottomSheet = ShowBottomSheet();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32.h),
              Center(
                child: Image.asset(
                  AppAssets.logo,
                  height: 160.h,
                ),
              ),
              SizedBox(height: 32.h),
              Text('Phone Number', style: AppTextStyles.f16W600SecColor),
              SizedBox(height: 8.h),
              CustomTextFormField(
                  hintText: "0*********",
                  controller: _phoneController,
                  validationMessage:
                      "The phone number must be 10 numbers only ",
                  keyBoardType: TextInputType.phone),
              SizedBox(height: 64.h),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  style: AppTextStyles.f14W400Grey,
                  children: [
                    TextSpan(
                        text:
                            'By choosing Agree or continue as a guest, you agree to the '),
                    TextSpan(
                      text: 'Terms and Conditions',
                      style: AppTextStyles.f14W400Grey.copyWith(
                        color: AppColors.primaryColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(text: ' and '),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: AppTextStyles.f14W400Grey.copyWith(
                        color: AppColors.primaryColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 64.h),
              AppButton(
                buttonText: "Agree",
                buttonOnPressed: () {
                  context.read<AuthCubit>().logIn();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                  // showBottomSheet.showPhoneConfirmationDialog(
                  // context, "0938920500");
                },
              ),
              SizedBox(height: 28.h),
              GestureDetector(
                onTap: () {
                  showBottomSheet.showPrivacyPolicySheet(context);
                },
                child: Center(
                  child: Text(
                    'Continue As a Guest',
                    style: AppTextStyles.f16W600White
                        .copyWith(color: AppColors.primaryColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
