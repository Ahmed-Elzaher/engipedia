import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class CourseItemCard extends StatefulWidget {
  const CourseItemCard({super.key});

  @override
  State<CourseItemCard> createState() => _CourseItemCardState();
}

class _CourseItemCardState extends State<CourseItemCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    // 💡 السر هنا: Align بيمنع الـ ListView إنها تمط الكارت غصب عنه
    return Align(
      alignment: Alignment.topCenter,
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        onTap: () {},
        child: AnimatedScale(
          scale: _isPressed ? 0.96 : 1.0,
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeInOut,
          child: Container(
            width: 163.w,
            margin: EdgeInsets.only(
                right: 16.w, bottom: 20.h), // مساحة للشادو براحته
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x40000000),
                  offset: Offset(0, 4),
                  blurRadius: 4,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFFFAFAFA),
                        Color(0xFFD6DAF5),
                      ],
                    ),
                    border: Border.all(
                      color: const Color(0xFFEAEDFA),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // الكارت بيلم على قده
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // 1. صورة الكورس
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: Image.asset(
                          'assets/images/course_cover.jpg',
                          width: 139.w,
                          height: 105.h,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                            width: 139.w,
                            height: 105.h,
                            color: AppColors.primary400,
                          ),
                        ),
                      ),

                      SizedBox(height: 16.h), // 💡 مسافة الفيجما

                      // 2. شريط التقدم
                      Container(
                        width: 139.w,
                        height: 12.h,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEAEDFA),
                          borderRadius: BorderRadius.circular(64.r),
                        ),
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 90.w,
                          height: 12.h,
                          decoration: BoxDecoration(
                            color: const Color(0xFF10B981),
                            borderRadius: BorderRadius.circular(64.r),
                          ),
                        ),
                      ),

                      SizedBox(height: 12.h), // 💡 مسافة الفيجما

                      // 3. اسم المادة ووصفها
                      SizedBox(
                        width: 139.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Embedded Systems",
                              style: AppStyles.pMedium16.copyWith(
                                color: const Color(0xFF0A0E29),
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                                height: 12
                                    .h), // 💡 مسافة الفيجما بين العنوان والوصف
                            Text(
                              "Hardware & software control systems",
                              style: AppStyles.pMedium16.copyWith(
                                color: const Color(0xFF0A0E29),
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                          height: 12.h), // 💡 مسافة الفيجما بين الوصف والدكتور

                      // 4. الدكتور
                      SizedBox(
                        width: 139.w,
                        height: 25.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 12.r,
                              backgroundImage:
                                  const AssetImage('assets/images/pfp.jpg'),
                              backgroundColor: AppColors.primary400,
                            ),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: Text(
                                "Dr. Mohamed Moawad",
                                style: AppStyles.pMedium16.copyWith(
                                  color: const Color(0xFF0A0E29),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                          height: 8.h), // 💡 مسافة الفيجما بين الدكتور والزرار

                      // 5. زرار Continue
                      Container(
                        width: 125.w,
                        height: 34.h,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFF1E2A7B),
                              Color(0xFF0A0E29),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(16.r),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x40000000),
                              offset: Offset(0, 4),
                              blurRadius: 20,
                            ),
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(16.r),
                            onTap: () {},
                            child: Center(
                              child: Text(
                                "continue",
                                style: AppStyles.pMedium16.copyWith(
                                  color: const Color(0xFFEAEDFA),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
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
      ),
    );
  }
}
