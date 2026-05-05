import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_styles.dart';
import '../../../core/widgets/app_text_button.dart';
import '../../../core/widgets/app_text_form_field.dart';
import '../../../core/widgets/social_login_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // Password Visibility States
  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.h),

                  // 1. زرار الرجوع
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_circle_left_outlined,
                      color: AppColors.accentBlue,
                      size: 28.w,
                    ),
                  ),

                  // المسافة لحد البلوك بتاع الهيدر (Top: 82px - 16px padding - 28px icon)
                  SizedBox(height: 38.h),

                  // 2. الهيدر (العنوان والتفاصيل) - تم التعديل حسب الـ CSS
                  Center(
                    child: SizedBox(
                      width: 345.w,
                      child: Column(
                        children: [
                          Text(
                            "Let’s Create Your Account",
                            textAlign: TextAlign.center,
                            style: AppStyles.h3Bold25.copyWith(
                              color: AppColors.primary900,
                              fontSize: 25.sp, // h3 size
                              height: 1.2, // line-height: 30px on 25px font
                            ),
                          ),

                          // Gap: 16px
                          SizedBox(height: 16.h),

                          Text(
                            "Sign up to access courses, track your progress, and stay updated throughout the semester.",
                            textAlign: TextAlign.center,
                            style: AppStyles.pMedium16.copyWith(
                              color: AppColors.primary800,
                              height: 1.5, // line-height: 150%
                              letterSpacing: 0.5.w,
                            ),
                          ),

                          // Gap: 16px
                          SizedBox(height: 16.h),

                          // Already have an account? Sign In
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: "Already have an account? ",
                              style: AppStyles.pMedium16.copyWith(
                                color: AppColors.primary800,
                                height: 1.5,
                                letterSpacing: 0.5.w,
                              ),
                              children: [
                                TextSpan(
                                  text: "Sign In",
                                  style: AppStyles.pMedium16.copyWith(
                                    color: AppColors.primary800,
                                    height: 1.5,
                                    letterSpacing: 0.5.w,
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pop(context);
                                    },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Gap between header and form block (248px - 202px)
                  SizedBox(height: 46.h),

                  // 3. حقول الإدخال

                  _buildInputBlock(
                    label: "First Name",
                    controller: firstNameController,
                    validator: (value) =>
                        value!.isEmpty ? 'Enter your first name' : null,
                  ),

                  SizedBox(height: 24.h),

                  _buildInputBlock(
                    label: "Last Name",
                    controller: lastNameController,
                    validator: (value) =>
                        value!.isEmpty ? 'Enter your last name' : null,
                  ),

                  SizedBox(height: 24.h),

                  _buildInputBlock(
                    label: "Email",
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) =>
                        value!.isEmpty ? 'Enter your email' : null,
                  ),

                  SizedBox(height: 24.h),

                  _buildInputBlock(
                    label: "Password",
                    controller: passwordController,
                    isPassword: true,
                    isHidden: isPasswordHidden,
                    onToggleVisibility: () {
                      setState(() {
                        isPasswordHidden = !isPasswordHidden;
                      });
                    },
                    validator: (value) =>
                        value!.isEmpty ? 'Enter your password' : null,
                  ),

                  SizedBox(height: 16.h),

                  // شروط الباسورد (Password Criteria)
                  _buildPasswordCriteriaBlock(),

                  SizedBox(height: 24.h),

                  _buildInputBlock(
                    label: "Confirm Password",
                    controller: confirmPasswordController,
                    isPassword: true,
                    isHidden: isConfirmPasswordHidden,
                    onToggleVisibility: () {
                      setState(() {
                        isConfirmPasswordHidden = !isConfirmPasswordHidden;
                      });
                    },
                    validator: (value) {
                      if (value!.isEmpty) return 'Confirm your password';
                      if (value != passwordController.text)
                        return 'Passwords do not match';
                      return null;
                    },
                  ),

                  SizedBox(height: 40.h),

                  // 4. زرار التسجيل
                  AppTextButton(
                    buttonText: "Sign up",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        // Sign Up Logic
                      }
                    },
                  ),

                  SizedBox(height: 32.h),

                  // 5. الفاصل (Or Continue with)
                  Row(
                    children: [
                      const Expanded(
                          child: Divider(
                              color: AppColors.primary900, thickness: 1)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: Text(
                          "Or Continue with",
                          style: AppStyles.pMedium16.copyWith(
                            color: AppColors.primary900,
                            letterSpacing: 0.5.w,
                          ),
                        ),
                      ),
                      const Expanded(
                          child:
                              Divider(color: Color(0xFF0A0E29), thickness: 1)),
                    ],
                  ),

                  SizedBox(height: 24.h),

                  // 6. زراير السوشيال ميديا
                  SocialLoginButton(
                    text: "Continue With Google",
                    iconPath: AppAssets.googleIcon,
                    iconWidth: 24,
                    iconHeight: 24,
                    onPressed: () {},
                  ),
                  SizedBox(height: 16.h),
                  SocialLoginButton(
                    text: "Continue With Facebook",
                    iconPath: AppAssets.facebookIcon,
                    iconWidth: 32,
                    iconHeight: 32,
                    onPressed: () {},
                  ),

                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // --- Helpers ---

  Widget _buildInputBlock({
    required String label,
    required TextEditingController controller,
    bool isPassword = false,
    bool isHidden = true,
    VoidCallback? onToggleVisibility,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
  }) {
    return SizedBox(
      width: 345.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: AppStyles.pMedium16.copyWith(
                  color: AppColors.primary900,
                  letterSpacing: 0.5.w,
                  fontWeight: FontWeight.w500, // As per Figma
                ),
              ),
              if (isPassword && onToggleVisibility != null)
                GestureDetector(
                  onTap: onToggleVisibility,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        isHidden ? Icons.visibility_off : Icons.visibility,
                        size: 18.w,
                        color: AppColors.primary900,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        isHidden ? "Hide" : "Show",
                        style: AppStyles.pMedium16.copyWith(
                          color: AppColors.primary900,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          SizedBox(height: 8.h),
          AppTextFormField(
            labelText: "",
            controller: controller,
            isObscureText: isHidden && isPassword,
            validator: validator,
            keyboardType: keyboardType ?? TextInputType.text,
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordCriteriaBlock() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCriteriaItem("Use 8 or more characters"),
        _buildCriteriaItem("One special character"),
        _buildCriteriaItem("One number"),
        _buildCriteriaItem("One Uppercase character"),
        _buildCriteriaItem("One lowercase character"),
      ],
    );
  }

  Widget _buildCriteriaItem(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        children: [
          Container(
            width: 8.w,
            height: 8.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary800,
            ),
          ),
          SizedBox(width: 8.w),
          Text(
            text,
            style: AppStyles.captionRegularItalic13
                .copyWith(color: AppColors.primary800),
          ),
        ],
      ),
    );
  }
}
