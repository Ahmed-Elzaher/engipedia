import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/scale_clickable.dart';

class CourseActionButtons extends StatelessWidget {
  const CourseActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _buildButton("Download Lecture", flex: 1, onTap: () {}),
            SizedBox(width: 8.w),
            _buildButton("Download Section", flex: 1, onTap: () {}),
          ],
        ),
        SizedBox(height: 12.h),
        _buildButton("Test Yourself", isFullWidth: true, onTap: () {}),
      ],
    );
  }

  Widget _buildButton(String text,
      {int flex = 1, bool isFullWidth = false, required VoidCallback onTap}) {
    Widget button = Container(
      height: 34.h,
      width: isFullWidth ? double.infinity : null,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF1E2A7B), Color(0xFF0A0E29)],
        ),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r), bottomRight: Radius.circular(12.r)),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: const Offset(0, 4),
              blurRadius: 10)
        ],
      ),
      child: Center(
        child: Text(text,
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 13.sp,
                color: const Color(0xFFEAEDFA))),
      ),
    );

    return ScaleClickable(
      onTap: onTap,
      child: isFullWidth ? button : Expanded(flex: flex, child: button),
    );
  }
}
