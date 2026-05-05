import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_styles.dart';

class ProgressStatsCard extends StatelessWidget {
  final String title;
  final String value;
  final String statusText;
  final IconData? icon;
  final Color? iconColor;

  const ProgressStatsCard({
    super.key,
    required this.title,
    required this.value,
    required this.statusText,
    this.icon,
    this.iconColor,
    required String subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 107.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: const Offset(0, 4),
              blurRadius: 4),
          BoxShadow(
              color: const Color(0x121F2687),
              offset: const Offset(0, 8),
              blurRadius: 32),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Color(0xFFEAEDFA)],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(title,
                        style: AppStyles.h4Bold20.copyWith(
                            fontSize: 18.sp, color: const Color(0xFF0A0E29))),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Text(value,
                            style: AppStyles.h4Bold20.copyWith(
                                fontSize: 22.sp,
                                color: const Color(0xFF0A0E29))),
                        SizedBox(width: 12.w),
                        Text(statusText,
                            style: const TextStyle(
                                fontFamily: 'Space Grotesk',
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2839A4))),
                      ],
                    ),
                  ],
                ),
                if (icon != null) Icon(icon, color: iconColor, size: 32.w),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
