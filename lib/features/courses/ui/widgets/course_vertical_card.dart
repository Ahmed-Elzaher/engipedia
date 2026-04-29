import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/scale_clickable.dart';

class CourseVerticalCard extends StatelessWidget {
  final String title;
  final String doctor;
  final String level;
  final String lectures;

  const CourseVerticalCard({
    super.key,
    required this.title,
    required this.doctor,
    required this.level,
    required this.lectures,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleClickable(
      onTap: () {}, // اذهب لتفاصيل الكورس
      child: Container(
        height: 211.h,
        margin: EdgeInsets.only(bottom: 20.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.25), offset: const Offset(0, 4), blurRadius: 4),
            BoxShadow(color: Colors.black.withOpacity(0.25), offset: const Offset(0, 4), blurRadius: 4),
            BoxShadow(color: Colors.black.withOpacity(0.25), offset: const Offset(0, 4), blurRadius: 4),
            BoxShadow(color: Colors.black.withOpacity(0.25), offset: const Offset(0, 4), blurRadius: 4),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFFAFAFA), Color(0xFFD6DAF5)],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: AppStyles.pMedium16.copyWith(color: const Color(0xFF0A0E29), fontWeight: FontWeight.w600)),
                      SizedBox(height: 8.h),
                      Text(doctor, style: AppStyles.pMedium16.copyWith(color: const Color(0xFF0A0E29), fontSize: 14.sp)),
                      SizedBox(height: 8.h),
                      Text("level $level", style: AppStyles.pMedium16.copyWith(color: const Color(0xFF0A0E29), fontSize: 13.sp)),
                      SizedBox(height: 4.h),
                      Text(lectures, style: AppStyles.pMedium16.copyWith(color: const Color(0xFF0A0E29), fontSize: 13.sp)),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: 34.h,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xFF1E2A7B), Color(0xFF0A0E29)]),
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: const [BoxShadow(color: Color(0x40000000), offset: Offset(0, 4), blurRadius: 20)],
                    ),
                    child: Center(
                      child: Text("continue", style: AppStyles.pMedium16.copyWith(color: const Color(0xFFEAEDFA), fontSize: 14.sp)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}