import 'package:engipedia/core/widgets/common_app_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../widgets/progress_card.dart';
import '../widgets/course_item_card.dart';
import '../widgets/info_glass_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary100, 
      child: SafeArea(
        bottom: false, 
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // 1. الهيدر الموحد والثابت (Pinned)
            SliverPersistentHeader(
              pinned: true,
              delegate: CommonAppHeader(), // 💡 السطر ده وفر علينا كود كتير
            ),

            // 2. قسم الترحيب وكارت التقدم
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 32.h),
                    Text("Welcome Zeyad", style: AppStyles.h3Bold25),
                    SizedBox(height: 8.h),
                    Text(
                      "Choose a course and begin your learning path",
                      style: AppStyles.pMedium16.copyWith(
                        color: const Color(0xFF222F44),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    const ProgressCard(),
                    SizedBox(height: 32.h),
                    _buildSectionTitle("Your Courses"),
                    SizedBox(height: 16.h),
                  ],
                ),
              ),
            ),

            // 3. قائمة الكورسات العرضية
            SliverToBoxAdapter(
              child: SizedBox(
                height: 370.h, 
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 24.w),
                  itemCount: 3,
                  itemBuilder: (context, index) => const CourseItemCard(),
                ),
              ),
            ),

            // 4. الأقسام التعريفية والمميزات
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    SizedBox(height: 40.h), 
                    _buildAboutSection(),
                    SizedBox(height: 40.h),
                    _buildFeaturesSection(),
                    // 💡 مسافة الأمان عشان الـ Nav Bar العائم
                    SizedBox(height: 140.h), 
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Helper Widgets (ماتغيرتش عشان نحافظ على التصميم) ---

  Widget _buildSectionTitle(String title) {
    return Text(title, style: AppStyles.h4Bold20);
  }

  Widget _buildAboutSection() {
    return Column(
      children: [
        Text("About Engipedia", style: AppStyles.h3Bold25),
        SizedBox(height: 8.h),
        Text(
          "Empowering future engineers through structured learning and a unified platform.",
          style: AppStyles.pMedium16.copyWith(fontSize: 13.sp, color: const Color(0xFF0A0E29)),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 24.h),
        const InfoGlassCard(
          title: "Our Mission",
          description: "To provide an accessible platform for engineering resources and student growth in a fast-evolving tech world.",
          icon: Icons.rocket_launch_rounded,
          radius: 24.0,
        ),
        const InfoGlassCard(
          title: "Our Vision",
          description: "To become a global standard for student-led technical education, building a community of innovators solving real-world problems.",
          icon: Icons.visibility_rounded,
          radius: 24.0,
        ),
      ],
    );
  }

  Widget _buildFeaturesSection() {
    return Column(
      children: [
        Text("Key Features", style: AppStyles.h3Bold25),
        SizedBox(height: 8.h),
        Text(
          "Explore the main tools and features designed to enhance your learning experience.",
          style: AppStyles.pMedium16.copyWith(fontSize: 13.sp, color: const Color(0xFF0A0E29)),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 24.h),
        const InfoGlassCard(
          title: "Structured Courses",
          description: "Organized curriculum paths tailored for specific engineering majors.",
          icon: Icons.account_tree_rounded,
          radius: 16.0,
        ),
        const InfoGlassCard(
          title: "Progress Tracking",
          description: "Visualize your learning journey with detailed performance metrics.",
          icon: Icons.insert_chart_rounded,
          radius: 16.0,
        ),
        const InfoGlassCard(
          title: "Community Support",
          description: "Connect with peers and mentors to solve complex problems together.",
          icon: Icons.groups_rounded,
          radius: 16.0,
        ),
        const InfoGlassCard(
          title: "Resource Library",
          description: "Access a vast collection of textbooks and research papers.",
          icon: Icons.library_books_rounded, 
          radius: 16.0,
        ),
        const InfoGlassCard(
          title: "Mock Exams",
          description: "Prepare for finals with real-time simulations and question banks.",
          icon: Icons.quiz_rounded, 
          radius: 16.0,
        ),
      ],
    );
  }
}