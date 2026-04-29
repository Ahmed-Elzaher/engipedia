import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/scale_clickable.dart';

class YouMightKnowWidget extends StatelessWidget {
  const YouMightKnowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFFAFAFA), Color(0xFFD6DAF5)],
        ),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("You might know", style: AppStyles.h4Bold20.copyWith(color: const Color(0xFF0A0E29))),
          SizedBox(height: 20.h),
          _buildPersonRow("Ahmed Hassan", "Electrical Eng.", "assets/images/onb2.png"), // استخدمت صور من المشروع
          SizedBox(height: 16.h),
          _buildPersonRow("Laila Omar", "Software Engineer", "assets/images/onb3.png"),
        ],
      ),
    );
  }

  Widget _buildPersonRow(String name, String major, String image) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20.r,
          backgroundImage: AssetImage(image),
          backgroundColor: const Color(0xFF94A3B8),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: AppStyles.pMedium16.copyWith(fontSize: 15.sp, color: const Color(0xFF0A0E29))),
              Text(
                major,
                style: AppStyles.smallRegular10.copyWith(
                  fontSize: 12.sp,
                  fontStyle: FontStyle.italic,
                  color: const Color(0xFF141C52).withOpacity(0.6),
                ),
              ),
            ],
          ),
        ),
        ScaleClickable(
          onTap: () {},
          child: Text(
            "Follow",
            style: AppStyles.pMedium16.copyWith(
              fontSize: 14.sp,
              color: const Color(0xFF0A0E29),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}