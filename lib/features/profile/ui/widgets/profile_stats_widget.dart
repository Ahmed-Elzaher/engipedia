import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_styles.dart';

class ProfileStatsWidget extends StatelessWidget {
  const ProfileStatsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildStatCard("45", "Total Posts", Icons.edit_document),
        SizedBox(height: 16.h),
        _buildStatCard("8", "Courses Completed", Icons.school_outlined),
        SizedBox(height: 16.h),
        _buildStatCard("120", "Contributions", Icons.star_border_rounded, suffix: "pts"),
      ],
    );
  }

  Widget _buildStatCard(String value, String label, IconData icon, {String? suffix}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: const [
          BoxShadow(color: Color(0x40000000), offset: Offset(0, 4), blurRadius: 4),
          BoxShadow(color: Color(0x121F2687), offset: Offset(0, 8), blurRadius: 32),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xFFFAFAFA).withOpacity(0.8),
                  const Color(0xFFD6DAF5).withOpacity(0.8)
                ],
              ),
              border: Border.all(color: Colors.white.withOpacity(0.6), width: 1.5),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      value,
                      style: AppStyles.h3Bold25.copyWith(color: const Color(0xFF0A0E29)),
                    ),
                    if (suffix != null) ...[
                      SizedBox(width: 4.w),
                      Padding(
                        padding: EdgeInsets.only(bottom: 4.h),
                        child: Text(
                          suffix,
                          style: AppStyles.pMedium16.copyWith(
                            color: const Color(0xFF0A0E29).withOpacity(0.6),
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ]
                  ],
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon, color: const Color(0xFF141C52).withOpacity(0.7), size: 16.sp),
                    SizedBox(width: 6.w),
                    Text(
                      label,
                      style: AppStyles.pMedium16.copyWith(
                        color: const Color(0xFF141C52),
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}