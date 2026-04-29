import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_styles.dart';

class InfoGlassCard extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;
  final double radius;

  const InfoGlassCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    this.radius = 24.0, 
  });

  @override
  State<InfoGlassCard> createState() => _InfoGlassCardState();
}

class _InfoGlassCardState extends State<InfoGlassCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: () {},
      child: AnimatedScale(
        scale: _isPressed ? 0.96 : 1.0, 
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 24.h), 
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.radius.r),
            boxShadow: const [
              BoxShadow(
                color: Color(0x40000000), 
                offset: Offset(0, 4),
                blurRadius: 4,
              ),
              BoxShadow(
                color: Color(0x121F2687), 
                offset: Offset(0, 8),
                blurRadius: 32,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(widget.radius.r),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15), 
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFFAFAFA), Color(0xFFD6DAF5)],
                  ),
                  borderRadius: BorderRadius.circular(widget.radius.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 48.w,
                      height: 48.w,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD6DAF5),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Icon(widget.icon, color: const Color(0xFF2839A4), size: 28.w),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      widget.title,
                      // 💡 هنا استخدمنا Montserrat Bold مع line-height 100% (1.0)
                      style: AppStyles.h4Bold20.copyWith(
                        color: const Color(0xFF0A0E29),
                        height: 1.0, 
                      ),
                    ),
                    SizedBox(height: 12.h), // مسافة الفيجما
                    Text(
                      widget.description,
                      // 💡 هنا استخدمنا Montserrat Medium مع line-height 150% (1.5) و letter-spacing 0.5px
                      style: AppStyles.pMedium16.copyWith(
                        color: const Color(0xFF141C52),
                        fontSize: 16.sp, // الفيجما بتقول 16 مش 15
                        height: 1.5, 
                        letterSpacing: 0.5.w,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}