import 'package:flutter/material.dart';

class ScaleClickable extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double scaleFactor; // نسبة التصغير (0.95 مثلاً)
  final Duration duration;

  const ScaleClickable({
    super.key,
    required this.child,
    this.onTap,
    this.scaleFactor = 0.96, // القيمة المثالية لليوزر إكسبرينس
    this.duration = const Duration(milliseconds: 150),
  });

  @override
  State<ScaleClickable> createState() => _ScaleClickableState();
}

class _ScaleClickableState extends State<ScaleClickable> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // 💡 ده أهم سطر عشان يخلي أي مساحة فاضية جوه الكارت قابلة للضغط
      behavior: HitTestBehavior.opaque,

      onTapDown: (_) {
        if (widget.onTap != null) setState(() => _isPressed = true);
      },
      onTapUp: (_) {
        if (widget.onTap != null) setState(() => _isPressed = false);
      },
      onTapCancel: () {
        if (widget.onTap != null) setState(() => _isPressed = false);
      },
      onTap: widget.onTap,

      child: AnimatedScale(
        scale: _isPressed ? widget.scaleFactor : 1.0,
        duration: widget.duration,
        curve: Curves.easeInOut, // عشان الحركة تكون سموث
        child: widget.child,
      ),
    );
  }
}
