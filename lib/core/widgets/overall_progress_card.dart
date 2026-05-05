import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_styles.dart';

class OverallProgressCard extends StatelessWidget {
  const OverallProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 107.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Color(0xFFEAEDFA)],
              ),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Overall Progress",
                      style: AppStyles.h4Bold20.copyWith(fontSize: 18.sp),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "78%",
                      style: AppStyles.h4Bold20.copyWith(
                        fontSize: 24.sp,
                        color: const Color(0xFF0A0E29),
                      ),
                    ),
                  ],
                ),
                // 💡 جزء الدائرة والـ +5%
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 64.w,
                      height: 64.w,
                      child: CircularProgressIndicator(
                        value: 0.78,
                        strokeWidth: 6,
                        color: const Color(0xFF2839A4),
                        backgroundColor:
                            const Color(0xFF2839A4).withOpacity(0.1),
                        strokeCap: StrokeCap.round,
                      ),
                    ),
                    Text(
                      "+5%",
                      style: TextStyle(
                        fontFamily: 'Space Grotesk',
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                        color: const Color(0xFF0A0E29),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
