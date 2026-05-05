import 'package:engipedia/core/widgets/common_app_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/scale_clickable.dart';
import '../../../../core/routing/routes.dart'; // ضفنا مسار الـ Routes هنا
import '../widgets/courses_search_field.dart';
import '../widgets/course_vertical_card.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, 
      backgroundColor: AppColors.primary100, 
      body: SafeArea(
        bottom: false, 
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // 1. الهيدر الموحد والثابت (Pinned)
            SliverPersistentHeader(
              pinned: true,
              delegate: CommonAppHeader(),
            ),

            // 2. قسم العناوين والبحث والمستويات
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTitleSection(),
                    SizedBox(height: 32.h),
                    const CoursesSearchField(),
                    SizedBox(height: 24.h),
                    _buildLevelGrid(),
                  ],
                ),
              ),
            ),

            // 3. الكورس المتميز (Featured Card)
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              sliver: SliverToBoxAdapter(
                child: _buildFeaturedCard(context), // مررنا الـ context هنا
              ),
            ),

            // 4. قائمة الكورسات الطولية
            SliverPadding(
              padding: EdgeInsets.fromLTRB(24.w, 32.h, 24.w, 0), 
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  CourseVerticalCard(
                    title: "Database Systems",
                    doctor: "Dr. Nalha Beshri",
                    level: "200",
                    lectures: "10 Lecs",
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.courseDetailsScreen,
                        arguments: "Database Systems",
                      );
                    },
                  ),
                  CourseVerticalCard(
                    title: "Computer Network",
                    doctor: "Dr. Mohamed Sabry Saraya",
                    level: "200",
                    lectures: "10 Lecs",
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.courseDetailsScreen,
                        arguments: "Computer Network",
                      );
                    },
                  ),
                  CourseVerticalCard(
                    title: "PLC",
                    doctor: "Dr. Mahmoud Moawad",
                    level: "400",
                    lectures: "12 Lecs",
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.courseDetailsScreen,
                        arguments: "PLC",
                      );
                    },
                  ),
                ]),
              ),
            ),

            // مسافة أسفل المحتوى لمنع اختفائه خلف الـ BottomNav العائم
            SliverToBoxAdapter(child: SizedBox(height: 140.h)),
          ],
        ),
      ),
    );
  }

  // قسم النصوص التوضيحية
  Widget _buildTitleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.school_outlined, color: Color(0xFF1349EC), size: 24),
            SizedBox(width: 12.w),
            Text(
              "Academic Excellence",
              style: AppStyles.pMedium16.copyWith(color: AppColors.primary900),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Text("Explore Your Courses", style: AppStyles.h3Bold25),
        SizedBox(height: 8.h),
        Text(
          "Continue your journey through our curated collection of advanced linguistic studies and technical literature.",
          style: AppStyles.smallRegular10.copyWith(
            fontSize: 13.sp,
            color: const Color(0xFF141C52),
            height: 1.4,
          ),
        ),
      ],
    );
  }

  // شبكة اختيار المستويات (Grid)
  Widget _buildLevelGrid() {
    return Column(
      children: [
        Row(
          children: [
            _LevelButton(label: "level 0", onTap: () {}),
            SizedBox(width: 20.w),
            _LevelButton(label: "level 100", onTap: () {}),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            _LevelButton(label: "level 200", onTap: () {}),
            SizedBox(width: 20.w),
            _LevelButton(label: "level 300", onTap: () {}),
          ],
        ),
        SizedBox(height: 12.h),
        _LevelButton(label: "level 400", width: double.infinity, onTap: () {}),
      ],
    );
  }

  // الكارت الكبير (Featured Course)
  Widget _buildFeaturedCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xFF141C52),
        borderRadius: BorderRadius.circular(16.r),
        image: const DecorationImage(
          image: AssetImage('assets/images/featured_bg.png'),
          fit: BoxFit.cover,
          opacity: 0.6,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Embedded Systems",
            style: AppStyles.h3Bold25.copyWith(color: const Color(0xFFEAEDFA)),
          ),
          SizedBox(height: 12.h),
          Text(
            "Learn how embedded systems are designed and used in real-world applications, combining hardware and software for efficient and reliable performance.",
            style: AppStyles.pMedium16.copyWith(
              color: const Color(0xFFEAEDFA),
              fontSize: 14.sp,
              height: 1.5,
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(height: 24.h),
          _buildFeaturedButton(context), // مررنا الـ context للزرار
          SizedBox(height: 20.h),
          Row(
            children: [
              const Icon(Icons.access_time, color: Color(0xFFEAEDFA), size: 18),
              SizedBox(width: 8.w),
              Text(
                "12h 45m left",
                style: AppStyles.pMedium16.copyWith(
                  color: const Color(0xFFEAEDFA),
                  fontSize: 13.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedButton(BuildContext context) {
    return ScaleClickable(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.courseDetailsScreen,
          arguments: "Embedded Systems",
        );
      },
      child: Container(
        height: 52.h,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFFAFAFA), Color(0xFFD6DAF5)],
          ),
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 10, offset: const Offset(0, 4)),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Continue Learning",
              style: AppStyles.pMedium16.copyWith(color: AppColors.primary900),
            ),
            SizedBox(width: 8.w),
            const Icon(Icons.play_arrow_rounded, color: Color(0xFF0A0E29)),
          ],
        ),
      ),
    );
  }
}

// Widget الزرار المتكرر للمستويات
class _LevelButton extends StatelessWidget {
  final String label;
  final double? width;
  final VoidCallback onTap;

  const _LevelButton({required this.label, this.width, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: width == null ? 1 : 0,
      child: ScaleClickable(
        onTap: onTap,
        child: Container(
          width: width,
          height: 36.h,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF5B6CD7), Color(0xFF141C52)],
            ),
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.25), offset: const Offset(0, 4), blurRadius: 4),
            ],
          ),
          child: Center(
            child: Text(
              label,
              style: AppStyles.pMedium16.copyWith(
                color: const Color(0xFFEAEDFA),
                fontSize: 14.sp,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}