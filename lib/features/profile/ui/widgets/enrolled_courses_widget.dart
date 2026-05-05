import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_styles.dart';

class EnrolledCoursesWidget extends StatelessWidget {
  const EnrolledCoursesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        // نفس تدرج الألوان اللي استخدمناه في الكروت الزجاجية
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFFAFAFA), Color(0xFFD6DAF5)],
        ),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Enrolled Courses",
              style:
                  AppStyles.h4Bold20.copyWith(color: const Color(0xFF0A0E29))),
          SizedBox(height: 20.h),
          // بننادي على الدالة اللي بتبني كل سطر كورس
          _buildCourseProgress("Computer Architecture", 0.75),
          SizedBox(height: 16.h),
          _buildCourseProgress("Embedded Systems Pro", 0.40),
          SizedBox(height: 16.h),
          _buildCourseProgress("Signal Processing Basics", 0.90),
        ],
      ),
    );
  }

  // دالة مساعدة عشان متكررش الكود لكل كورس
  Widget _buildCourseProgress(String name, double progress) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name,
                style: AppStyles.pMedium16
                    .copyWith(fontSize: 14.sp, color: const Color(0xFF0A0E29))),
            Text("${(progress * 100).toInt()}%",
                style: AppStyles.pMedium16
                    .copyWith(fontSize: 14.sp, color: const Color(0xFF0A0E29))),
          ],
        ),
        SizedBox(height: 8.h),
        ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.white.withOpacity(0.3),
            color: const Color(0xFF2839A4), // لون البروجرس بار من التصميم
            minHeight: 8.h,
          ),
        ),
      ],
    );
  }
}
