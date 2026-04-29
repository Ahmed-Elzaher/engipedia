import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../../core/widgets/app_text_button.dart';

class CheckEmailScreen extends StatefulWidget {
  const CheckEmailScreen({super.key});

  @override
  State<CheckEmailScreen> createState() => _CheckEmailScreenState();
}

class _CheckEmailScreenState extends State<CheckEmailScreen> {
  final TextEditingController pinController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 1. تظبيط شكل المربعات (Default State)
    final defaultPinTheme = PinTheme(
      width: 67.w,
      height: 65.h,
      textStyle: AppStyles.h3Bold25.copyWith(
        color: AppColors.primary900,
        fontSize: 24.sp,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.offWhite, AppColors.primary100],
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x121F2687),
            offset: Offset(0, 8),
            blurRadius: 32,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x40000000),
            offset: Offset(0, 4),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
    );

    // 2. شكل المربع عند الضغط (Focused State)
    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: AppColors.primary700, width: 1.5.w),
      ),
    );

    // 3. شكل المربع في حالة الخطأ (Error State)
    final errorPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: AppColors.error, width: 1.5.w),
      ),
    );

    return Scaffold(
      backgroundColor: AppColors.primary100,
      body: SafeArea(
        child: SingleChildScrollView(
          // استبدلنا الـ CustomScrollView عشان نتحكم في المسافات أسهل
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 16.h),
                  _buildBackButton(context),

                  // المسافة بين زرار الرجوع وبداية المحتوى حسب تصميم فيجما (228px - 72px - 28px)
                  SizedBox(height: 128.h),

                  _buildEmailIcon(),
                  SizedBox(height: 16.h),
                  Text("Check Your Email", style: AppStyles.h3Bold25),
                  SizedBox(height: 16.h),
                  Text(
                    "We sent an 4 Digit code to your email",
                    textAlign: TextAlign.center,
                    style: AppStyles.pMedium16.copyWith(
                      color: AppColors.primary800,
                      letterSpacing: 0.5.w,
                    ),
                  ),
                  SizedBox(height: 32.h),

                  Pinput(
                    length: 4,
                    separatorBuilder: (index) => SizedBox(width: 24.w),
                    controller: pinController,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    errorPinTheme: errorPinTheme,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.length < 4) {
                        return 'Please enter all 4 digits';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 60.h),
                  AppTextButton(
                    buttonText: "Verify",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        // Logic هنا
                      }
                    },
                  ),
                  SizedBox(height: 16.h),
                  _buildResendText(),

                  // مسافة أخيرة للتأكد إن مفيش حاجة لازقة في آخر الشاشة
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Icon(
          Icons.arrow_circle_left_outlined,
          color: AppColors.accentBlue,
          size: 28.w,
        ),
      ),
    );
  }

  Widget _buildEmailIcon() {
    return Container(
      width: 48.w,
      height: 48.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.centerLeft, // 90deg
          end: Alignment.centerRight,
          colors: [
            AppColors.primary50.withOpacity(0.15),
            AppColors.primary100.withOpacity(0.15),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: Offset(0, 4),
            blurRadius: 20,
          ),
        ],
      ),
      child: Center(
        child: Icon(Icons.mail_outline, size: 24.w, color: AppColors.black),
      ),
    );
  }

  Widget _buildResendText() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "Don’t receive the email ? ",
        style: AppStyles.captionRegularMontserrat.copyWith(
          color: AppColors.primary800,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5.w,
        ),
        children: [
          TextSpan(
            text: "Resend (13s)",
            style: AppStyles.captionRegularMontserrat.copyWith(
              color: AppColors.primary900,
              fontWeight: FontWeight.w700, // Bold
            ),
          ),
        ],
      ),
    );
  }
}
