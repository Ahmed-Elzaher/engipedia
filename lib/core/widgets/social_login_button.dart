import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/app_styles.dart';

class SocialLoginButton extends StatefulWidget {
  final String text;
  final String iconPath;
  final VoidCallback onPressed;
  final double iconWidth;
  final double iconHeight;

  const SocialLoginButton({
    super.key,
    required this.text,
    required this.iconPath,
    required this.onPressed,
    this.iconWidth = 24,
    this.iconHeight = 24,
  });

  @override
  State<SocialLoginButton> createState() => _SocialLoginButtonState();
}

class _SocialLoginButtonState extends State<SocialLoginButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) => setState(() => _isPressed = true),
      onPointerUp: (_) => setState(() => _isPressed = false),
      onPointerCancel: (_) => setState(() => _isPressed = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedScale(
          scale: _isPressed ? 0.95 : 1.0,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutBack,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            width: double.infinity,
            height: 48.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: _isPressed 
                  ? [const Color(0xFF5B6CD7), const Color(0xFF141C52)]
                  : [const Color(0xFF1E2A7B), const Color(0xFF0A0E29)],
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x40000000),
                  offset: const Offset(0, 4),
                  blurRadius: _isPressed ? 2 : 6,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  widget.iconPath,
                  width: widget.iconWidth.w,
                  height: widget.iconHeight.h,
                ),
                SizedBox(width: 12.w),
                Flexible(
                  child: Text(
                    widget.text,
                    style: AppStyles.buttonMediumMontserrat,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}