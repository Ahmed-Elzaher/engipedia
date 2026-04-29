import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/scale_clickable.dart';

class CommonAppHeader extends SliverPersistentHeaderDelegate {
  // 💡 بنضيف متغير الاسم هنا عشان نمرره للهيدر
  final String userName;

  CommonAppHeader({this.userName = "Zeyad Khaled Mohamed"});

  // 💡 فنكشن سحرية بتطلع الـ Initials (أول حروف من الاسم)
  String getInitials(String name) {
    List<String> nameParts = name.split(" ");
    String initials = "";
    
    if (nameParts.isNotEmpty && nameParts[0].isNotEmpty) {
      initials += nameParts[0][0].toUpperCase(); // أول حرف من الاسم الأول
    }
    
    if (nameParts.length > 1 && nameParts[1].isNotEmpty) {
      initials += nameParts[1][0].toUpperCase(); // أول حرف من الاسم الثاني
    }
    
    return initials.isEmpty ? "U" : initials; // لو الاسم فاضي حط U (User)
  }

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      decoration: BoxDecoration(
        color: AppColors.primary100,
        boxShadow: overlapsContent
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ]
            : [],
      ),
      alignment: Alignment.center,
      child: Row(
        children: [
          // 1. بروفايل Placeholder ديناميكي
          Container(
            width: 40.w,
            height: 40.w,
            decoration: const BoxDecoration(
              color: Color(0xFFADB5EB), 
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                getInitials(userName), // 💡 هنا هينادي على الفنكشن ويطلع ZK أو AH حسب الاسم
                style: AppStyles.pMedium16.copyWith(
                  color: const Color(0xFF141C52),
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ),
          SizedBox(width: 14.w),

          // 2. منطقة البيانات
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName, // 💡 الاسم اللي داخل للهيدر
                  style: AppStyles.pMedium16.copyWith(
                    color: const Color(0xFF0A0E29),
                    fontWeight: FontWeight.bold,
                    height: 1.1,
                  ),
                  maxLines: 1,
                ),
                SizedBox(height: 4.h),
                Text(
                  "zeyadkhaled@myu.com",
                  style: AppStyles.smallRegular10.copyWith(
                    fontSize: 11.sp,
                    color: const Color(0xFF141C52).withOpacity(0.7),
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                  "Student",
                  style: AppStyles.smallRegular10.copyWith(
                    fontSize: 11.sp,
                    color: const Color(0xFF141C52).withOpacity(0.7),
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),

          // 3. أيقونات التفاعل
          Row(
            children: [
              ScaleClickable(
                onTap: () {},
                child: const Icon(Icons.notifications_none_rounded, color: Color(0xFF1349EC), size: 22),
              ),
              SizedBox(width: 16.w),
              ScaleClickable(
                onTap: () {},
                child: const Icon(Icons.grid_view_rounded, color: Color(0xFF1349EC), size: 22),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 82.h;
  @override
  double get minExtent => 82.h;
  
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}