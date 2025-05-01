import 'package:active_bee/core/app_theme/app_colors.dart';
import 'package:active_bee/core/app_theme/app_text_styles.dart';
import 'package:active_bee/core/app_widgets/app_button.dart';
import 'package:active_bee/features/auth/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowBottomSheet {
  void showPrivacyPolicySheet(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    bool hasScrolledToEnd = false;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            scrollController.addListener(() {
              if (scrollController.offset >=
                      scrollController.position.maxScrollExtent &&
                  !scrollController.position.outOfRange) {
                if (!hasScrolledToEnd) {
                  setState(() => hasScrolledToEnd = true);
                }
              }
            });

            return DraggableScrollableSheet(
              initialChildSize: 0.9,
              maxChildSize: 0.95,
              minChildSize: 0.5,
              expand: false,
              builder: (_, controller) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Container(
                              width: 60.w,
                              height: 4.h,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Text('ActiveBee Privacy Policy',
                                style: AppTextStyles.f20W600Primary),
                            Text('Privacy Policy for ActiveBee Company:',
                                style: AppTextStyles.f16W600SecColor),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),

                      // Scrollable content
                      Expanded(
                        child: SingleChildScrollView(
                          controller: scrollController,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _sectionTitle('Introduction:'),
                              _sectionBody(
                                'BeeDelivery LLC with capital of 22,220,000 SYP fully paid, CR No. 18647 (“We”, “Us” or “ActiveBee”) is committed to protecting the data of all users of our website http://www.ActiveBee.com or our mobile app.',
                              ),
                              _sectionBody(
                                'Please read the following privacy policy which explains how we collect and protect your information. By using our services, you agree to the data we collect about you.',
                              ),
                              SizedBox(height: 12.h),
                              _sectionTitle('1. Contact Information:'),
                              _sectionBody(
                                'If you have any questions or requests regarding our privacy policy or how we handle your data, you may contact us by phone: 0958889999 or via email: privacy@ActiveBee.com',
                              ),
                              SizedBox(height: 12.h),
                              _sectionTitle('2. How We Collect Your Data:'),
                              _sectionBody(
                                'We collect your personal data when you interact with us or use our services. For example, when you use the website to place an order.',
                              ),
                              _sectionBody(
                                'We also look at how visitors use our website to help us improve our services and customer experience.',
                              ),
                              _sectionBody(
                                'We collect data when:',
                              ),
                              _bulletPoint(
                                  'You create an account or change your account settings.'),
                            ],
                          ),
                        ),
                      ),

                      // Buttons
                      SizedBox(height: 16.h),
                      Row(
                        children: [
                          Expanded(
                            child: AppButton(
                              textColor: AppColors.primaryColor,
                              buttonColorSide: AppColors.primaryColor,
                              buttonColor: AppColors.backgroundColor,
                              buttonText: "Don't Agree",
                              buttonOnPressed: () =>
                                  Navigator.of(context).pop(),
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: AppButton(
                              buttonText: "Agree",
                              buttonOnPressed: hasScrolledToEnd
                                  ? () => Navigator.of(context).pop()
                                  : null,
                              buttonColor: hasScrolledToEnd
                                  ? AppColors.primaryColor
                                  : AppColors.primaryColor.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  Widget _sectionTitle(String title) {
    return Text(title, style: AppTextStyles.f16W600SecColor);
  }

  Widget _sectionBody(String body) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Text(body, style: AppTextStyles.f14W400SecColorWithOpacity),
    );
  }

  Widget _bulletPoint(String text) {
    return Padding(
      padding: EdgeInsets.only(top: 6.h, left: 12.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('• ', style: AppTextStyles.f14W600SecColor),
          Expanded(
            child: Text(
              text,
              style: AppTextStyles.f14W400SecColorWithOpacity,
            ),
          ),
        ],
      ),
    );
  }

  void showPhoneConfirmationDialog(BuildContext context, String phoneNumber) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shadowColor: Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
          child: Padding(
            padding: EdgeInsets.all(24.0.r),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(phoneNumber, style: AppTextStyles.f24W600SecColor),
                SizedBox(height: 12.h),
                Text("Is this your correct number?",
                    style: AppTextStyles.f14W400SecColor),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Edit",
                    style: AppTextStyles.f14W400Grey.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                AppButton(
                  buttonText: "Confirm",
                  buttonOnPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => RegisterScreen(),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
