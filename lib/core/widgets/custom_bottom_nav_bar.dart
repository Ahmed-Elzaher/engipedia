import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88.h,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1E2A7B), Color(0xFF0A0E29)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(icon: Icons.home_filled, index: 0, context: context),
            _buildNavItem(icon: Icons.search, index: 1, context: context),
            _buildNavItem(icon: Icons.bookmark_border, index: 2, context: context),
            _buildNavItem(icon: Icons.notifications_none, index: 3, context: context),
            _buildNavItem(icon: Icons.person_outline, index: 4, context: context),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({required IconData icon, required int index, required BuildContext context}) {
    final bool isActive = currentIndex == index;
    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.translucent,
      child: SizedBox(
        width: (MediaQuery.of(context).size.width / 5),
        height: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            if (isActive)
              Positioned(
                top: -12.h,
                child: Container(
                  width: 64.w,
                  height: 32.h,
                  decoration: BoxDecoration(
                    color: AppColors.primary100, // Match scaffold background
                    borderRadius: BorderRadius.circular(32.r),
                  ),
                ),
              ),
            Icon(icon, size: 28.sp, color: isActive ? AppColors.accentBlue : Colors.white.withOpacity(0.7)),
          ],
        ),
      ),
    );
  }
}