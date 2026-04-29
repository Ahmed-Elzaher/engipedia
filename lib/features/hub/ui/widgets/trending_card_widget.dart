import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/scale_clickable.dart';

class TrendingCardWidget extends StatelessWidget {
  const TrendingCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 345.w,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFFAFAFA), Color(0xFFD6DAF5)],
        ),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.25), offset: const Offset(0, 4), blurRadius: 4),
          const BoxShadow(color: Color(0x111F2687), offset: Offset(0, 8), blurRadius: 32),
        ],
      ),
      child: Column(
        children: [
          // 1. Header (Trending)
          Row(
            children: [
              Icon(Icons.trending_up, color: const Color(0xFF177064), size: 24.sp),
              SizedBox(width: 8.w),
              Text(
                "Trending",
                style: AppStyles.h4Bold20.copyWith(color: const Color(0xFF0A0E29)),
              ),
            ],
          ),
          SizedBox(height: 24.h),

          // 2. List of Trending Topics
          _buildTrendingItem("Engineering", "#ModulationTechniques", "1.2k students active"),
          SizedBox(height: 24.h),
          _buildTrendingItem("Final Projects", "#AutomationLogic", "850 posts this week"),
          SizedBox(height: 24.h),
          _buildTrendingItem("Career Prep", "#SummerInternships", "430 students active"),
          SizedBox(height: 24.h),

          // 3. View All Button
          ScaleClickable(
            onTap: () {},
            child: Container(
              height: 36.h,
              width: double.infinity,
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
                  "View All", // استبدل النص لو مختلف في فيجما
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: const Color(0xFFEAEDFA),
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrendingItem(String category, String hashtag, String stats) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontStyle: FontStyle.italic,
            fontSize: 13.sp,
            color: const Color(0xFF177064), // Turquoise
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          hashtag,
          style: AppStyles.pMedium16.copyWith(
            color: const Color(0xFF0A0E29),
            fontWeight: FontWeight.w500,
            fontSize: 15.sp,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          stats,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 11.sp,
            color: const Color(0xFF0A0E29).withOpacity(0.6),
          ),
        ),
      ],
    );
  }
}