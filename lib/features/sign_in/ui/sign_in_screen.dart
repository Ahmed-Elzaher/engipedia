import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/routing/routes.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_styles.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/app_text_button.dart';
import '../../../core/widgets/app_text_form_field.dart';
import '../../../core/widgets/social_login_button.dart';
import '../logic/sign_in_cubit.dart';
import '../logic/sign_in_state.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isPasswordHidden = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary100,
      // إضافة الزرار هنا كـ FloatingActionButton لتسهيل الوصول إليه
      floatingActionButton: _buildDeveloperShortcut(),
      body: SafeArea(
        child: BlocListener<SignInCubit, SignInState>(
          listenWhen: (previous, current) =>
              current is SignInSuccess || current is SignInError,
          listener: (context, state) {
            if (state is SignInSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.homeScreen,
                (route) => false,
              );
            }
            if (state is SignInError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  SizedBox(height: 32.h),
                  _buildForm(),
                  SizedBox(height: 32.h),
                  _buildSignInButton(),
                  SizedBox(height: 24.h),
                  _buildDivider(),
                  SizedBox(height: 24.h),
                  _buildSocialLogins(),
                  SizedBox(height: 32.h),
                  _buildFooter(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ميثود الزرار السريع للمطورين
  Widget _buildDeveloperShortcut() {
    return GestureDetector(
      onLongPress: () {
        // حركة صايعة: خليه يشتغل بالضغط المطول عشان محدش يفتحه بالصدفة
        Navigator.pushNamedAndRemoveUntil(
          context,
          Routes.homeScreen,
          (route) => false,
        );
      },
      child: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.homeScreen,
            (route) => false,
          );
        },
        backgroundColor: Colors.red.withOpacity(0.7),
        label: Text(
          "For developer only",
          style: AppStyles.captionRegularMontserrat.copyWith(
            color: Colors.white,
            fontSize: 10.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        icon: const Icon(Icons.developer_mode, color: Colors.white, size: 18),
      ),
    );
  }

  Widget _buildSignInButton() {
    return BlocBuilder<SignInCubit, SignInState>(
      builder: (context, state) {
        return AppTextButton(
          buttonText: state is SignInLoading ? "Loading..." : "Sign In",
          onPressed: state is SignInLoading
              ? () {}
              : () {
                  if (formKey.currentState!.validate()) {
                    context.read<SignInCubit>().emitSignInStates();
                  }
                },
        );
      },
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
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
        SizedBox(height: 16.h),
        Text(
          "Welcome Back",
          style: AppStyles.titleBoldMontserrat.copyWith(
            color: AppColors.primary900,
            fontSize: 25.sp,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          "Sign in to access your courses, track\nyour progress, and continue your\nlearning journey",
          textAlign: TextAlign.center,
          style: AppStyles.pMedium16.copyWith(color: AppColors.primary700),
        ),
      ],
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          AppTextFormField(
            labelText: "Email",
            controller: context.read<SignInCubit>().emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          SizedBox(height: 16.h),
          AppTextFormField(
            labelText: "Password",
            controller: context.read<SignInCubit>().passwordController,
            isObscureText: isPasswordHidden,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
            labelRightWidget: GestureDetector(
              onTap: () => setState(() => isPasswordHidden = !isPasswordHidden),
              child: Row(
                children: [
                  Icon(
                    isPasswordHidden ? Icons.visibility_off : Icons.visibility,
                    size: 18.w,
                    color: const Color(0xFF0A0E29),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    isPasswordHidden ? "Hide" : "Show",
                    style: AppStyles.captionRegularMontserrat.copyWith(
                      color: const Color(0xFF0A0E29),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 12.h),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, Routes.forgotPasswordScreen),
            child: Text(
              "Forget Password",
              style: AppStyles.captionRegularMontserrat.copyWith(
                color: const Color(0xFF0A0E29),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        const Expanded(child: Divider(color: Color(0xFF0A0E29), thickness: 1)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            "Or Continue with",
            style: AppStyles.pMedium16.copyWith(color: const Color(0xFF0A0E29)),
          ),
        ),
        const Expanded(child: Divider(color: Color(0xFF0A0E29), thickness: 1)),
      ],
    );
  }

  Widget _buildSocialLogins() {
    return Column(
      children: [
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
      ],
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
        Center(
          child: Text(
            "Don’t have an account?",
            style: AppStyles.h4Bold20.copyWith(color: const Color(0xFF0A0E29)),
          ),
        ),
        SizedBox(height: 16.h),
        AppTextButton(
          buttonText: "Sign up",
          onPressed: () => Navigator.pushNamed(context, Routes.signUpScreen),
        ),
      ],
    );
  }
}