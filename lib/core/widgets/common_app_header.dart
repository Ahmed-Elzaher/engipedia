import 'package:engipedia/features/profile/ui/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/scale_clickable.dart';

class CommonAppHeader extends SliverPersistentHeaderDelegate {
  final String userName;

  CommonAppHeader({this.userName = "Zeyad Khaled Mohamed"});

  String getInitials(String name) {
    List<String> nameParts = name.split(" ");
    String initials = "";
    if (nameParts.isNotEmpty && nameParts[0].isNotEmpty) {
      initials += nameParts[0][0].toUpperCase();
    }
    if (nameParts.length > 1 && nameParts[1].isNotEmpty) {
      initials += nameParts[1][0].toUpperCase();
    }
    return initials.isEmpty ? "U" : initials;
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
        crossAxisAlignment: CrossAxisAlignment.center, // محاذاة مركزية لكل العناصر
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileScreen()),
                );
              },
              behavior: HitTestBehavior.opaque,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 40.w,
                    height: 40.w,
                    decoration: const BoxDecoration(
                      color: Color(0xFFADB5EB), 
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        getInitials(userName), 
                        style: AppStyles.pMedium16.copyWith(
                          color: const Color(0xFF141C52),
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 14.w),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userName, 
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
                ],
              ),
            ),
          ),

          // 💡 تعديل المحاذاة والارتفاع بالملي
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildIconWrapper(
                icon: Icons.notifications_none_rounded,
                size: 26.w,
                onTap: () {},
              ),
              SizedBox(width: 12.w),
              _buildIconWrapper(
                icon: Icons.chat_bubble_outline_rounded,
                size: 23.w, // حجم أصغر شعرة للتعادل بصرياً مع الجرس
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 🛠️ دالة مساعدة لضمان التمركز المطلق للأيقونات
  Widget _buildIconWrapper({required IconData icon, required double size, required VoidCallback onTap}) {
    return ScaleClickable(
      onTap: onTap,
      child: Container(
        height: 40.h, // ثبتنا الارتفاع تماماً
        alignment: Alignment.center, // تمركز الأيقونة داخل الـ 40 بكسل
        child: Icon(
          icon,
          color: const Color(0xFF1349EC),
          size: size,
        ),
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