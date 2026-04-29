import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/scale_clickable.dart';

class StudyGroupsCardWidget extends StatelessWidget {
  const StudyGroupsCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 345.w,
      // الارتفاع متحدد في فيجما بـ 246 تقريباً، بس يفضل نسيبه ياخد مساحته أو نحطه لو التصميم طالب كدا
      // height: 246.h, 
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: const [
          // الشادو الأول
          BoxShadow(
            color: Color(0x40000000), // #00000040
            offset: Offset(0, 25),
            blurRadius: 50,
            spreadRadius: -12,
          ),
          // الشادو الثاني
          BoxShadow(
            color: Color(0x121F2687), // #1F268712
            offset: Offset(0, 8),
            blurRadius: 32,
          ),
          // الشادو الثالث والرابع (مكررين في فيجما)
          BoxShadow(
            color: Color(0x40000000), // #00000040
            offset: Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30), // الـ Blur بـ 30px زي ما بعت
          child: Container(
            // 💡 الـ Container الخارجي ده بيمثل الـ Gradient Border
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFFFFFFF), Color(0xFFD6DAF5)], // Border Image Source
              ),
            ),
            padding: const EdgeInsets.all(1), // سُمك البوردر (border-width: 1px)
            child: Container(
              // 💡 الـ Container الداخلي بيمثل الخلفية والمحتوى
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r), // 16 - 1
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  // ملحوظة: اديت الألوان شفافية 70% عشان تأثير الـ Blur اللي ورا يظهر
                  colors: [
                    const Color(0xFFFAFAFA).withOpacity(0.7), 
                    const Color(0xFFD6DAF5).withOpacity(0.7)
                  ],
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.group_outlined, color: const Color(0xFF177064), size: 24.sp),
                      SizedBox(width: 8.w),
                      Text(
                        "Study Groups",
                        style: AppStyles.h4Bold20.copyWith(color: const Color(0xFF0A0E29)),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),

                  _buildGroupItem(Icons.memory, "Microprocessors", "12 Active Now"),
                  SizedBox(height: 20.h),
                  _buildGroupItem(Icons.functions, "Advanced Calculus II", "5 Active Now"),
                  SizedBox(height: 32.h),

                  ScaleClickable(
                    onTap: () {},
                    child: Container(
                      height: 48.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFF5B6CD7), Color(0xFF141C52)],
                        ),
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            offset: const Offset(0, 4),
                            blurRadius: 4,
                          ),
                          BoxShadow(
                            color: const Color(0xFF1F2687).withOpacity(0.07),
                            offset: const Offset(0, 8),
                            blurRadius: 32,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "Join a Group",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: const Color(0xFFEAEDFA),
                            letterSpacing: 0.5,
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
    );
  }

  Widget _buildGroupItem(IconData icon, String title, String activeCount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 48.w,
              height: 48.w,
              decoration: BoxDecoration(
                color: const Color(0xFF177064),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(icon, color: const Color(0xFFD6DAF5), size: 24.sp),
            ),
            SizedBox(width: 16.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppStyles.pMedium16.copyWith(
                    color: const Color(0xFF0A0E29),
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  activeCount,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 13.sp,
                    color: const Color(0xFF0A0E29).withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ],
        ),
        Container(
          width: 8.w,
          height: 8.w,
          decoration: BoxDecoration(
            color: const Color(0xFF177064),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF2DD4BF).withOpacity(0.5),
                blurRadius: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }
}