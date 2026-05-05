import 'dart:ui';
import 'package:engipedia/core/widgets/common_app_header.dart';
import 'package:engipedia/core/widgets/overall_progress_card.dart';
import 'package:engipedia/core/widgets/progress_stats_card.dart';
import 'package:engipedia/core/widgets/learning_activity_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/scale_clickable.dart';
import '../../../../core/widgets/course_progress_item.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // 💡 التعديل هنا: يمتد تحت شريط التنقل
      backgroundColor:
          AppColors.primary100, // 💡 التعديل هنا: استخدام لونك المفضل للخلفية
      body: SafeArea(
        bottom: false, // 💡 التعديل هنا: إلغاء الـ SafeArea من الأسفل
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // 1. الهيدر الموحد (Pinned)
            SliverPersistentHeader(
              pinned: true,
              delegate: CommonAppHeader(),
            ),

            // 2. ترويسة الصفحة
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Progress Dashboard", style: AppStyles.h3Bold25),
                    SizedBox(height: 4.h),
                    Text(
                      "Track your academic journey and milestones.",
                      style: AppStyles.pMedium16.copyWith(
                        fontSize: 14.sp,
                        color: AppColors.primary800,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 3. قسم كروت الإحصائيات (Stats)
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  ScaleClickable(
                    onTap: () {},
                    child: const ProgressStatsCard(
                      title: "Courses In Progress",
                      value: "3",
                      subTitle: "Ongoing",
                      statusText: '',
                    ),
                  ),
                  SizedBox(height: 24.h),
                  ScaleClickable(
                    onTap: () {},
                    child: const OverallProgressCard(),
                  ),
                  SizedBox(height: 24.h),
                  ScaleClickable(
                    onTap: () {},
                    child: const ProgressStatsCard(
                      title: "Study Streak",
                      value: "15 Days",
                      subTitle: "Fire!",
                      icon: Icons.local_fire_department,
                      iconColor: Color(0xFFF97316),
                      statusText: '',
                    ),
                  ),
                ]),
              ),
            ),

            // 4. عنوان Learning Journey
            SliverPadding(
              padding: EdgeInsets.fromLTRB(24.w, 40.h, 24.w, 16.h),
              sliver: SliverToBoxAdapter(
                child: Text("Your Learning Journey", style: AppStyles.h3Bold25),
              ),
            ),

            // 5. قائمة تقدم الكورسات
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  ScaleClickable(
                    onTap: () {},
                    child: const CourseProgressItem(
                        title: "Computer Architecture",
                        moduleInfo: "Module 12 of 14",
                        progress: 0.85),
                  ),
                  SizedBox(height: 12.h),
                  ScaleClickable(
                    onTap: () {},
                    child: const CourseProgressItem(
                        title: "Signal",
                        moduleInfo: "Module 4 of 10",
                        progress: 0.40),
                  ),
                  SizedBox(height: 12.h),
                  ScaleClickable(
                    onTap: () {},
                    child: const CourseProgressItem(
                        title: "Math 5",
                        moduleInfo: "Module 6 of 10",
                        progress: 0.60),
                  ),
                ]),
              ),
            ),

            // 6. كارت الـ Learning Activity (تحت الكورسات مباشرة)
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
              sliver: SliverToBoxAdapter(
                child: ScaleClickable(
                  onTap: () {},
                  child: const LearningActivityCard(),
                ),
              ),
            ),

            // 7. كارت الـ Resume المحدث (Continue Course)
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              sliver: SliverToBoxAdapter(child: _buildResumeCard()),
            ),

            // 💡 التعديل الأخير: مسافة أسفل المحتوى لمنع اختفائه خلف الـ BottomNav العائم
            SliverToBoxAdapter(child: SizedBox(height: 140.h)),
          ],
        ),
      ),
    );
  }

  Widget _buildResumeCard() {
    return ScaleClickable(
      onTap: () {}, // الأنميشن الآن يشمل الكارت بالكامل
      child: Container(
        width: 348.w,
        height: 218.h, // الارتفاع المطلوب من التصميم
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: const Offset(0, 4),
              blurRadius: 4,
            ),
            const BoxShadow(
              color: Color(0x121F2687),
              offset: Offset(0, 8),
              blurRadius: 32,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              // Gradient Border الخارجي
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFFFFFFF), Color(0xFFADB5EB)],
                ),
              ),
              padding: const EdgeInsets.all(1), // سمك البوردر
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFFFFFFF), Color(0xFFEAEDFA)],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // يمنع الـ Overflow ويوزع العناصر
                  children: [
                    // الجزء العلوي: الأيقونة والنصوص الرئيسية
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // أيقونة البلاي (Box 48x53)
                        Container(
                          width: 48.w,
                          height: 53.h,
                          decoration: BoxDecoration(
                            color: const Color(0xFFD6DAF5),
                            borderRadius: BorderRadius.circular(16.r),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x1A000000),
                                offset: Offset(0, 20),
                                blurRadius: 25,
                                spreadRadius: -5,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Icon(
                              Icons.play_arrow_rounded,
                              color: const Color(0xFF2839A4),
                              size: 32.w,
                            ),
                          ),
                        ),
                        SizedBox(width: 20.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Pick up where you left off",
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 13.sp,
                                  fontStyle: FontStyle.italic,
                                  color: const Color(0xFF141C52),
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                "Computer Architecture: Memory Hierarchy",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize:
                                      18.sp, // صغرناه لضمان عدم وجود Overflow
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFF0A0E29),
                                  height: 1.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    // وصف الموديول (Module 12)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding:
                            EdgeInsets.only(left: 68.w), // محاذاة مع النص فوق
                        child: Text(
                          "Module 12: Exploring L1/L2 Cache optimization strategies.",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12.sp,
                            fontStyle: FontStyle.italic,
                            color: const Color(0xFF141C52),
                          ),
                        ),
                      ),
                    ),

                    // الزرار النهائي (Continue Course)
                    Container(
                      width: 301.w,
                      height: 40.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFF1E2A7B), Color(0xFF0A0E29)],
                        ),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0x40000000),
                              offset: Offset(0, 4),
                              blurRadius: 4),
                        ],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.r),
                          bottomRight: Radius.circular(12.r),
                        ),
                      ),
                      child: Text(
                        "Continue Course",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: const Color(0xFFEAEDFA),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
