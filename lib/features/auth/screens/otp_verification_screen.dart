import 'dart:async';
import 'package:active_bee/core/app_constants/app_assets.dart';
import 'package:active_bee/core/app_theme/app_colors.dart';
import 'package:active_bee/core/app_theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final TextEditingController otpController = TextEditingController();
  late final PinTheme defaultPinTheme;
  late final PinTheme focusedPinTheme;
  late final PinTheme errorPinTheme;

  int _secondsRemaining = 60;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _initializePinThemes();
    _startTimer();
  }

  void _initializePinThemes() {
    defaultPinTheme = PinTheme(
      width: 48.w,
      height: 48.h,
      textStyle: AppTextStyles.f24W600SecColor,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.primaryColor),
      ),
    );

    focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.primaryColor, width: 2.w),
      ),
    );

    errorPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.red, width: 2.w),
      ),
    );
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 0) {
        timer.cancel();
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  @override
  void dispose() {
    otpController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        leading: const BackButton(color: AppColors.secondaryColor),
        title: Text("Phone Number Verification",
            style: AppTextStyles.f16W600SecColor),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 32.h),
              Center(
                child: Image.asset(
                  AppAssets.pinput,
                  height: 200.h,
                ),
              ),
              SizedBox(height: 32.h),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  style: AppTextStyles.f14W400Grey,
                  children: [
                    TextSpan(
                      text: "Please enter the verification code sent to ",
                    ),
                    TextSpan(
                      text: "0938920500 ",
                      style: AppTextStyles.f14W600SecColor.copyWith(
                        color: AppColors.primaryColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(
                      text: "Edit?",
                      style: AppTextStyles.f14W600SecColor.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              Pinput(
                controller: otpController,
                length: 6,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                errorPinTheme: errorPinTheme,
                submittedPinTheme: defaultPinTheme,
                mainAxisAlignment: MainAxisAlignment.center,
                autofocus: true,
              ),
              SizedBox(height: 32.h),
              Text("You can request a new code in",
                  style: AppTextStyles.f14W400Grey),
              SizedBox(height: 4.h),
              Text("00:${_secondsRemaining.toString().padLeft(2, '0')}",
                  style: AppTextStyles.f24W600SecColor),
              SizedBox(height: 32.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Didn't receive the code?",
                      style: AppTextStyles.f14W400Grey),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Icon(Icons.sms,
                          size: 20, color: AppColors.secondaryColor),
                      SizedBox(width: 8.w),
                      Text("Resend Code", style: AppTextStyles.f14W600SecColor),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      Icon(Icons.call,
                          size: 20, color: AppColors.secondaryColor),
                      SizedBox(width: 8.w),
                      Text("Call me with the code",
                          style: AppTextStyles.f14W600SecColor),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
