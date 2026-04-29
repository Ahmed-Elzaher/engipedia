import 'package:engipedia/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../../core/widgets/app_text_button.dart';
import '../../../core/widgets/app_text_form_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary100, // لون الخلفية الأساسي
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 16.h),

                  // 1. زرار الرجوع (ثابت فوق)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_circle_left_outlined,
                        color: AppColors.accentBlue,
                        size: 28.w,
                      ),
                    ),
                  ),

                  // Space to push content down to match top: 228px
                  SizedBox(height: 184.h),

                  // أيقونة القفل
                  Container(
                    width: 48.w,
                    height: 48.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          AppColors.primary50.withOpacity(0.15),
                          AppColors.primary100.withOpacity(0.15),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          offset: const Offset(0, 4),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.lock_outline,
                        size: 24.w,
                        color: AppColors.primary950,
                      ),
                    ),
                  ),

                  SizedBox(height: 16.h),

                  // العنوان
                  Text(
                    "Forgot Password ?",
                    style: AppStyles.h3Bold25.copyWith(
                      color: AppColors.primary900,
                      height: 1.2, // line-height: 30px on 25px font
                    ),
                  ),

                  SizedBox(height: 16.h),

                  // النص الفرعي
                  Text(
                    "Don’t Worry ! Please enter your email.\nwe will send you reset instructions.",
                    textAlign: TextAlign.center,
                    style: AppStyles.pMedium16.copyWith(
                      color: AppColors.primary800,
                      letterSpacing: 0.5.w,
                    ),
                  ),

                  SizedBox(height: 48.h),

                  // حقل الإيميل
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Email",
                      style: AppStyles.pMedium16.copyWith(
                        color: AppColors.primary900,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5.w,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  AppTextFormField(
                    labelText: "",
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 60.h),

                  // زرار الإرسال
                  AppTextButton(
                    buttonText: "Send",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.pushNamed(
                          context,
                          Routes.checkEmailScreen,
                        );
                      }
                    },
                  ),

                  // مسافة أمان صغيرة من تحت
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
