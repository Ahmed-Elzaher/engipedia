import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/scale_clickable.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: const [
          BoxShadow(color: Color(0x40000000), offset: Offset(0, 25), blurRadius: 50, spreadRadius: -12),
          BoxShadow(color: Color(0x121F2687), offset: Offset(0, 8), blurRadius: 32),
          BoxShadow(color: Color(0x40000000), offset: Offset(0, 4), blurRadius: 4),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFFFFFFF), Color(0xFFD6DAF5)],
              ),
            ),
            padding: const EdgeInsets.all(1.5),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22.5.r),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [const Color(0xFFFAFAFA).withOpacity(0.8), const Color(0xFFD6DAF5).withOpacity(0.8)],
                ),
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProfileImage(),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Zeyad Khaled Mohamed", style: AppStyles.h4Bold20, overflow: TextOverflow.ellipsis),
                            SizedBox(height: 4.h),
                            Text("CCE Student", style: AppStyles.pMedium16),
                            SizedBox(height: 12.h),
                            Text(
                              "Passionate about Computer Engineering and Hardware Design.",
                              style: AppStyles.smallRegular10.copyWith(fontSize: 13.sp, fontStyle: FontStyle.italic),
                            ),
                            SizedBox(height: 12.h),
                            // 💡 الـ Wrap هنا هو اللي بيمنع الـ Overflow يميناً
                            Wrap(
                              spacing: 12.w,
                              runSpacing: 8.h,
                              children: [
                                _buildInfoItem(Icons.location_on_outlined, "CAIRO, EGYPT"),
                                _buildInfoItem(Icons.link_rounded, "ENGIPEDIA.IO/ZEYAD"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  _buildEditButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Stack(
      children: [
        CircleAvatar(
          radius: 30.r,
          backgroundImage: const AssetImage('assets/images/onb1.png'), // استخدمت صورة من مشروعك
          backgroundColor: const Color(0xFFEAEDFA),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            width: 14.w,
            height: 14.w,
            decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 2)),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoItem(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14.sp, color: const Color(0xFF0A0E29)),
        SizedBox(width: 4.w),
        Flexible(
          child: Text(
            text,
            style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold, fontSize: 10.sp),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildEditButton() {
    return ScaleClickable(
      onTap: () {},
      child: Container(
        height: 44.h,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [Color(0xFF1E2A7B), Color(0xFF0A0E29)]),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Center(child: Text("Edit Profile", style: AppStyles.pMedium16.copyWith(color: Colors.white))),
      ),
    );
  }
}