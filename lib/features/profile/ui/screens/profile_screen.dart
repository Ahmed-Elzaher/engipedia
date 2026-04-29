import 'package:engipedia/features/profile/ui/widgets/enrolled_courses_widget.dart';
import 'package:engipedia/features/profile/ui/widgets/profile_posts_section.dart';
import 'package:engipedia/features/profile/ui/widgets/you_might_know_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_styles.dart';
import '../widgets/profile_header_widget.dart';
import '../widgets/profile_stats_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 💡 الشاشة دي مفيهاش Bottom Nav عشان ندي مساحة للمحتوى ونمنع الـ Overflow
      backgroundColor: const Color(0xFFE5E9FF),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // 1. هيدر بسيط وأنيق بزرار رجوع
            SliverAppBar(
              pinned: true,
              backgroundColor: const Color(0xFFE5E9FF),
              elevation: 0,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Color(0xFF141C52),
                ),
                onPressed: () =>
                    Navigator.pop(context), // يرجعك للشاشة اللي كنت فيها
              ),
              title: Text("Profile", style: AppStyles.h4Bold20),
              centerTitle: true,
            ),

            // 2. محتوى الصفحة المنسق
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    const ProfileHeaderWidget(),
                    SizedBox(height: 24.h),
                    const ProfileStatsWidget(),
                    SizedBox(height: 32.h), // مسافة قبل النشاطات
                    const ProfilePostsSection(), // 💡 ضيف السيكشن الجديد هنا
                    SizedBox(height: 32.h),
                    const EnrolledCoursesWidget(),
                    SizedBox(height: 24.h),
                    const YouMightKnowWidget(),
                    SizedBox(height: 40.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
