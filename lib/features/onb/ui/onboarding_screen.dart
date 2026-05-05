import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/routing/routes.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart'; // import لملف الألوان
import '../../../core/utils/app_styles.dart';
import '../../../core/widgets/app_text_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
        },
        children: [
          _buildOnboardingItem(
            image: AppAssets.onb1,
            title: "Engipedia: Study\nSmarter, Not Harder",
            buttonText: "Next",
            index: 0,
            titleWidth: 341,
            titleHeight: 60,
            titleLeft: 26,
          ),
          _buildOnboardingItem(
            image: AppAssets.onb2,
            title: "Decode Complexity.\nMaster Engineering",
            buttonText: "Next",
            index: 1,
            titleWidth: 349,
            titleHeight: 48,
            titleLeft: 22,
          ),
          _buildOnboardingItem(
            image: AppAssets.onb3,
            title: "Your AI-Powered Gateway\nto Engineering Excellence",
            buttonText: "Begin Your Journey",
            index: 2,
            titleWidth: 345,
            titleHeight: 48,
            titleLeft: 24,
          ),
        ],
      ),
    );
  }

  Widget _buildOnboardingItem({
    required String image,
    required String title,
    required String buttonText,
    required int index,
    required double titleWidth,
    required double titleHeight,
    required double titleLeft,
  }) {
    return Stack(
      children: [
        // 1. الخلفية (الصور)
        Image.asset(
          image,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),

        // 2. سهم الرجوع
        if (index > 0)
          Positioned(
            top: 72.h,
            left: 24.w,
            child: GestureDetector(
              onTap: () {
                _pageController.previousPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(
                  Icons.arrow_circle_left_outlined,
                  color: AppColors.white,
                  size: 26.w,
                ),
              ),
            ),
          ),

        // 3. العنوان الأساسي
        Positioned(
          top: 176.h,
          left: index == 2 ? 0 : titleLeft.w,
          right: index == 2 ? 0 : null,
          child: SizedBox(
            width: index == 2 ? null : titleWidth.w,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: AppStyles.titleBoldMontserrat.copyWith(
                color: AppColors.white, // أبيض عشان يظهر فوق الصورة
                letterSpacing: index == 2 ? -1.2 : 0,
              ),
            ),
          ),
        ),

        // 4. الفريم السفلي (النقاط + الشروط + الزرار)
        Positioned(
          bottom: 50.h,
          left: 24.w,
          right: 24.w,
          child: SizedBox(
            width: 345.w,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // نقاط التنقل (Dots)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (dotIndex) => _buildDot(dotIndex: dotIndex),
                  ),
                ),
                SizedBox(height: 32.h),

                // النص الصغير (Terms & Conditions)
                SizedBox(
                  width: 345.w,
                  // شيلنا الارتفاع الثابت (height: 25.h) عشان السطرين يظهروا كاملين
                  child: Text(
                    "By proceeding to use Engipedia, you agree to our\nterms of services and privacy policy",
                    textAlign: TextAlign.center,
                    style: AppStyles.captionRegularMontserrat.copyWith(
                      color: AppColors.white, // أبيض
                    ),
                  ),
                ),

                SizedBox(height: 32.h),

                // زرار الانتقال
                AppTextButton(
                  buttonText: buttonText,
                  onPressed: () {
                    if (index == 2) {
                      Navigator.pushReplacementNamed(
                        context,
                        Routes.signInScreen,
                      );
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDot({required int dotIndex}) {
    return Container(
      margin: EdgeInsets.only(right: dotIndex == 2 ? 0 : 3.w),
      width: 10.w,
      height: 10.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: currentPage == dotIndex
            ? const Color(0xFF1349EC) // اللون الأزرق للـ Active Dot
            : const Color(0xFFD9D9D9),
      ),
    );
  }
}
