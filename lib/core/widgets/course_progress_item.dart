import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_styles.dart';

class CourseProgressItem extends StatelessWidget {
  final String title;
  final String moduleInfo;
  final double progress;

  const CourseProgressItem({
    super.key,
    required this.title,
    required this.moduleInfo,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 345.w,
      height: 88.h, // 💡 ملتزمين بالـ 88
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: const [
          BoxShadow(
              color: Color(0x40000000), offset: Offset(0, 4), blurRadius: 4),
          BoxShadow(
              color: Color(0x121F2687), offset: Offset(0, 8), blurRadius: 32),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFFFFFFF), Color(0xFFADB5EB)],
              ),
            ),
            padding: const EdgeInsets.all(1),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.r),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white, Color(0xFFEAEDFA)],
                ),
              ),
              child: Row(
                children: [
                  // 1. الأيقونة (64x64)
                  Container(
                    width: 64.w,
                    height: 64.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD6DAF5),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: const Center(
                      child: Icon(Icons.menu_book_rounded,
                          color: Color(0xFF2839A4), size: 30),
                    ),
                  ),
                  SizedBox(width: 16.w),

                  // 2. المحتوى
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // 💡 الحل هنا: توزيع العناصر آلياً في المساحة المتاحة
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // العنوان
                        Text(
                          title,
                          style: AppStyles.h4Bold20.copyWith(
                            fontSize: 18
                                .sp, // صغرنا الخط سيكا عشان يفتح مساحة للبروجرس بار
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF0A0E29),
                            height: 1.1,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),

                        // الـ Progress Bar
                        Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 8
                                  .h, // قللنا الارتفاع 2 بكسل عشان الـ Overflow
                              decoration: BoxDecoration(
                                color: const Color(0xFFEAEDFA),
                                borderRadius: BorderRadius.circular(9999),
                              ),
                            ),
                            FractionallySizedBox(
                              widthFactor: progress,
                              child: Container(
                                height: 8.h,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF2839A4),
                                  borderRadius: BorderRadius.circular(9999),
                                ),
                              ),
                            ),
                          ],
                        ),

                        // الفوتر (Module + %)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              moduleInfo,
                              style: AppStyles.smallRegular10.copyWith(
                                fontSize: 12.sp,
                                color: const Color(0xFF141C52),
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            Text(
                              "${(progress * 100).toInt()}%",
                              style: AppStyles.pMedium16.copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF2839A4),
                              ),
                            ),
                          ],
                        ),
                      ],
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
