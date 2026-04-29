import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:engipedia/core/utils/app_colors.dart';
import 'package:engipedia/core/utils/app_styles.dart';
import 'package:engipedia/core/widgets/common_app_header.dart';
import 'package:engipedia/core/widgets/scale_clickable.dart';

class HubScreen extends StatelessWidget {
  const HubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary100, // نفس خلفية الـ Progress
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              // 1. الهيدر الموحد (Pinned) كالعادة
              SliverPersistentHeader(
                pinned: true,
                delegate: CommonAppHeader(),
              ),

              // 2. ترويسة صفحة الـ Hub
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Engineering Hub", style: AppStyles.h3Bold25),
                      SizedBox(height: 4.h),
                      Text(
                        "Connect with your peers and share knowledge.",
                        style: AppStyles.pMedium16.copyWith(
                          fontSize: 14.sp,
                          color: AppColors.primary800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // 3. قسم كتابة المنشور (Composer Card)
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                sliver: SliverToBoxAdapter(
                  child: _buildGlassPostComposer(),
                ),
              ),

              // 4. عنوان التغذية الإخبارية (Feed)
              SliverPadding(
                padding: EdgeInsets.fromLTRB(24.w, 32.h, 24.w, 16.h),
                sliver: SliverToBoxAdapter(
                  child: Text("Recent Activity", style: AppStyles.h3Bold25.copyWith(fontSize: 20.sp)),
                ),
              ),

              // 5. قائمة المنشورات (Feed List)
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => Padding(
                      padding: EdgeInsets.only(bottom: 16.h),
                      child: _buildGlassPostCard(),
                    ),
                    childCount: 5, // مثال لعدد المنشورات
                  ),
                ),
              ),

              SliverToBoxAdapter(child: SizedBox(height: 100.h)),
            ],
          ),
        ),
      ),
    );
  }

  // كارت كتابة بوست جديد بنفس ستايل Resume Card
  Widget _buildGlassPostComposer() {
    return ScaleClickable(
      onTap: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.white.withOpacity(0.6), const Color(0xFFEAEDFA).withOpacity(0.4)],
              ),
              border: Border.all(color: Colors.white.withOpacity(0.5)),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Color(0xFFD6DAF5),
                  child: Icon(Icons.person, color: Color(0xFF2839A4)),
                ),
                SizedBox(width: 16.w),
                Text(
                  "What's on your mind, Ahmed?",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: const Color(0xFF141C52).withOpacity(0.6),
                    fontSize: 14.sp,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // كارت المنشور (Post Card) بتأثير Glassmorphism
  Widget _buildGlassPostCard() {
    return ScaleClickable(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: const Offset(0, 4),
              blurRadius: 10,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: Colors.white.withOpacity(0.7),
                border: Border.all(color: Colors.white.withOpacity(0.4)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: const Color(0xFFD6DAF5),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: const Icon(Icons.engineering_outlined, color: Color(0xFF2839A4)),
                      ),
                      SizedBox(width: 12.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Dr. Sarah Ahmed", style: AppStyles.pMedium16.copyWith(fontWeight: FontWeight.w700, fontSize: 14.sp)),
                          Text("CCE Department", style: TextStyle(fontSize: 11.sp, color: Colors.grey[600])),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    "The lecture notes for 'Computer Architecture' Module 12 have been uploaded to the dashboard.",
                    style: AppStyles.pMedium16.copyWith(fontSize: 13.sp, height: 1.4),
                  ),
                  SizedBox(height: 16.h),
                  Divider(color: AppColors.primary100),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildPostAction(Icons.favorite_border, "12"),
                      _buildPostAction(Icons.chat_bubble_outline, "5"),
                      _buildPostAction(Icons.share_outlined, "Share"),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPostAction(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, size: 18.sp, color: const Color(0xFF2839A4)),
        SizedBox(width: 4.w),
        Text(label, style: TextStyle(fontSize: 12.sp, color: const Color(0xFF141C52))),
      ],
    );
  }
}