import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

// 1. الكلاس المسؤول عن تثبيت الهيدر فوق (Sticky)
class HomeHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: AppColors.primary100,
      child: const HomeHeaderContent(),
    );
  }

  @override
  // كبرنا الارتفاع هنا عشان يدي براح للنصوص وميحصلش Overflow
  double get maxExtent => 115.h;

  @override
  double get minExtent => 115.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

// 2. محتوى الهيدر نفسه (الـ UI)
class HomeHeaderContent extends StatelessWidget {
  const HomeHeaderContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // قللنا الـ vertical padding شوية عشان الكلام ياخد راحته
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // صورة البروفايل
          CircleAvatar(
            radius: 24.r, // كبرناها سيكا عشان تملى العين
            backgroundColor: AppColors.primary400, // لون مؤقت لحد ما تحط الصورة
            backgroundImage: const AssetImage('assets/images/pfp.jpg'),
          ),

          SizedBox(width: 16.w),

          // تفاصيل اليوزر
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Zeyad Khaled Mohamed",
                  style: AppStyles.pMedium16.copyWith(
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5.w,
                    color: AppColors.primary900,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  "zeyadkhaled@myu.com",
                  style: AppStyles.pMedium16.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primary800,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "Student",
                  style: AppStyles.pMedium16.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primary800,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(width: 8.w),

          // الأيقونات
          Row(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Icon(
                    Icons.notifications_none_rounded,
                    color: const Color(0xFF1349EC),
                    size: 26.w,
                  ),
                  // النقطة البرتقالي بتاعة الإشعارات
                  Positioned(
                    top: 2.h,
                    right: 4.w,
                    child: Container(
                      width: 6.w,
                      height: 6.w,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFF9500),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 16.w),
              Icon(Icons.crop_free, color: const Color(0xFF1349EC), size: 24.w),
            ],
          ),
        ],
      ),
    );
  }
}
