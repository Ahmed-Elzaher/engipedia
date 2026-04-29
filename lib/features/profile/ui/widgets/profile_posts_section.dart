import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_styles.dart';

class ProfilePostsSection extends StatelessWidget {
  const ProfilePostsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Recent Activity",
          style: AppStyles.h3Bold25.copyWith(color: const Color(0xFF0A0E29)),
        ),
        SizedBox(height: 32.h),
        
        // 1. Shared Post (البوست اللي فيه محتوى داخلي)
        _buildSharedPost(),
        
        SizedBox(height: 32.h),
        
        // 2. Original Post (البوست الشخصي)
        _buildOriginalPost(),
      ],
    );
  }

  // --- النوع الأول: البوست المشترك (Shared Post) ---
  Widget _buildSharedPost() {
    return _buildPostContainer(
      height: 545.h,
      child: Column(
        children: [
          _buildPostHeader("Zeyad shared a post • 2h ago"),
          SizedBox(height: 12.h),
          // المحتوى الداخلي (Nested Content)
          Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFD6DAF5), Color(0xFFADB5EB)],
              ),
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.25), offset: const Offset(0, 4), blurRadius: 4)],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAuthorRow("Dr. Sarah Ibrahim", "Professor of Computer Architecture"),
                SizedBox(height: 12.h),
                Text("New findings in RISC-V optimization", style: AppStyles.h4Bold20.copyWith(fontSize: 18.sp)),
                SizedBox(height: 8.h),
                Text(
                  "We've successfully reduced instruction latency by 14% using a new branch prediction algorithm...",
                  style: AppStyles.pMedium16.copyWith(fontSize: 14.sp, height: 1.4),
                ),
                SizedBox(height: 12.h),
                // صورة الـ CPU
                Container(
                  height: 118.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    image: const DecorationImage(image: AssetImage('assets/images/cpu_arch.png'), fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          _buildPostActions("1.2k", "48", "12"),
        ],
      ),
    );
  }

  // --- النوع الثاني: المحتوى الأصلي (Original Content) ---
  Widget _buildOriginalPost() {
    return _buildPostContainer(
      height: 293.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPostHeader("Original content • 1 day ago"),
          SizedBox(height: 24.h),
          Text("My first FPGA Implementation!", style: AppStyles.h4Bold20),
          SizedBox(height: 16.h),
          Text(
            "Just finished mapping a custom 8-bit CPU core onto a Spartan-7. The timing constraints were challenging but finally got it to run at 50MHz stable!",
            style: AppStyles.pMedium16.copyWith(fontSize: 14.sp, height: 1.5),
          ),
          const Spacer(),
          const Divider(color: Color(0x33FFFFFF)), // White 20%
          _buildPostActions("236", "24", null),
        ],
      ),
    );
  }

  // --- عناصر مساعدة مكررة ---

  Widget _buildPostContainer({required double height, required Widget child}) {
    return Container(
      width: 347.w,
      height: height,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFFFFFFF), Color(0xFFEAEDFA)],
        ),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.25), offset: const Offset(0, 4), blurRadius: 4),
          BoxShadow(color: const Color(0xFF1F2687).withOpacity(0.07), offset: const Offset(0, 8), blurRadius: 32),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: child,
        ),
      ),
    );
  }

  Widget _buildPostHeader(String subtitle) {
    return Row(
      children: [
        Container(
          width: 32.w,
          height: 32.w,
          decoration: const BoxDecoration(color: Color(0xFFD6DAF5), shape: BoxShape.circle),
          child: Icon(Icons.share, size: 16.sp, color: const Color(0xFF1349EC)),
        ),
        SizedBox(width: 12.w),
        Text(subtitle, style: AppStyles.smallRegular10.copyWith(fontSize: 13.sp, fontStyle: FontStyle.italic, color: const Color(0xFF141C52))),
      ],
    );
  }

  Widget _buildAuthorRow(String name, String title) {
    return Row(
      children: [
        const CircleAvatar(radius: 16, backgroundImage: AssetImage('assets/images/dr_sarah.png')),
        SizedBox(width: 12.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: AppStyles.pMedium16.copyWith(fontSize: 14.sp, fontWeight: FontWeight.bold)),
            Text(title, style: AppStyles.smallRegular10.copyWith(fontSize: 11.sp)),
          ],
        ),
      ],
    );
  }

  Widget _buildPostActions(String likes, String comments, String? shares) {
    return Padding(
      padding: EdgeInsets.only(top: 8.h),
      child: Row(
        children: [
          _buildActionItem(Icons.favorite_border, likes),
          SizedBox(width: 24.w),
          _buildActionItem(Icons.chat_bubble_outline, comments),
          if (shares != null) ...[
            SizedBox(width: 24.w),
            _buildActionItem(Icons.reply_all_outlined, shares, isShare: true),
          ],
        ],
      ),
    );
  }

  Widget _buildActionItem(IconData icon, String count, {bool isShare = false}) {
    return Row(
      children: [
        Icon(icon, size: 18.sp, color: isShare ? const Color(0xFF2563EB) : const Color(0xFF1349EC)),
        SizedBox(width: 8.w),
        Text(count, style: AppStyles.smallRegular10.copyWith(fontSize: 13.sp, color: const Color(0xFF141C52))),
      ],
    );
  }
}