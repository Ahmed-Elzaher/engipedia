import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_styles.dart';

class AppTextButton extends StatefulWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final double? width;
  final double? height;

  const AppTextButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.width,
    this.height,
  });

  @override
  State<AppTextButton> createState() => _AppTextButtonState();
}

class _AppTextButtonState extends State<AppTextButton> {
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
          scale: _isPressed ? 0.95 : 1.0, // نسبة تصغير أوضح شوية للشياكة
          duration:
              const Duration(milliseconds: 200), // وقت مثالي للرجوع بنعومة
          curve: Curves
              .easeOutBack, // التريكة هنا: بيدي "نطة" خفيفة ورايقة وهو راجع
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut, // انسيابية في تحول الألوان
            width: widget.width ?? 345.w,
            height: widget.height ?? 48.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: _isPressed
                    ? [
                        const Color(0xFF5B6CD7),
                        const Color(0xFF141C52)
                      ] // الـ Gradient وقت الضغط
                    : [
                        const Color(0xFF1E2A7B),
                        const Color(0xFF0A0E29)
                      ], // الأساسي
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x40000000),
                  offset: const Offset(0, 4),
                  blurRadius: _isPressed ? 2 : 6, // شادو أنعم وهو راجع
                ),
              ],
            ),
            child: Center(
              child: Text(
                widget.buttonText,
                style: AppStyles.buttonMediumMontserrat,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
