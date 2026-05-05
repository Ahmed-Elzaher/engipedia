import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_styles.dart';

class PostCardWidget extends StatelessWidget {
  const PostCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 345.w,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFFAFAFA), Color(0xFFEAEDFA)],
        ),
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: const Offset(0, 4),
              blurRadius: 4),
          const BoxShadow(
              color: Color(0x111F2687), offset: Offset(0, 8), blurRadius: 32),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. User Info Header
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40.w,
                height: 40.w,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFEAEDFA), width: 2),
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  backgroundImage: const AssetImage(
                      'assets/images/pfp.png'), // غير المسار لو مختلف
                  backgroundColor: Colors.grey.shade300,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dr. Hala Bahi El-Din",
                      style: AppStyles.pMedium16.copyWith(
                          color: const Color(0xFF0A0E29),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "Analog Communications • Faculty of Engineering • 2h ago",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontStyle: FontStyle.italic,
                        fontSize: 13.sp,
                        color: const Color(0xFF141C52).withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.more_horiz,
                  color: const Color(0xFF0A0E29).withOpacity(0.4)),
            ],
          ),

          SizedBox(height: 24.h),

          // 2. Post Content
          Text(
            "I've just uploaded the supplementary materials for the \"Modulation Techniques\" module. Make sure to review the section on Phase Shift Keying before next Tuesday's lecture! 📡✨",
            style: AppStyles.pMedium16.copyWith(
              color: const Color(0xFF0A0E29),
              fontSize: 15.sp,
              height: 1.5,
            ),
          ),

          SizedBox(height: 16.h),

          // 3. Attached Image/Card
          Container(
            width: double.infinity,
            height: 169.h,
            decoration: BoxDecoration(
              color: const Color(0xFFEAEDFA),
              borderRadius: BorderRadius.circular(16.r),
              image: const DecorationImage(
                image: AssetImage(
                    'assets/images/course_cover.png'), // مسار الصورة المرفقة
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, 4),
                    blurRadius: 6),
              ],
            ),
          ),

          SizedBox(height: 24.h),
          const Divider(height: 1, color: Color(0xFFEAEDFA)),
          SizedBox(height: 16.h),

          // 4. Action Buttons (Like, Comment, Share)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildInteractionButton(Icons.favorite_border, "128"),
              _buildInteractionButton(Icons.chat_bubble_outline, "24"),
              _buildInteractionButton(Icons.share_outlined, "Share"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInteractionButton(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF1349EC), size: 22.sp),
        SizedBox(width: 8.w),
        Text(
          label,
          style: AppStyles.pMedium16.copyWith(
            color: const Color(0xFF0A0E29),
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }
}
