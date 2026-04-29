import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex; // 💡 بنعرفه إحنا فين دلوقتي
  final Function(int) onTabSelected; // 💡 بنبلغه لما اليوزر يضغط

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
  });

  final List<Map<String, dynamic>> _tabs = const [
    {'icon': Icons.home_rounded, 'label': 'Home'},
    {'icon': Icons.play_lesson_rounded, 'label': 'Courses'},
    {'icon': Icons.auto_awesome_rounded, 'label': 'AI'},
    {'icon': Icons.groups_rounded, 'label': 'Hub'},
    {'icon': Icons.bar_chart_rounded, 'label': 'Progress'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95.h,
      margin: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 24.h),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double itemWidth = constraints.maxWidth / 5;

          return Stack(
            clipBehavior: Clip.none,
            children: [
              // 1. جسم البار
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 65.h,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF1E2A7B), Color(0xFF0A0E29)],
                    ),
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: const [
                      BoxShadow(color: Color(0x40000000), offset: Offset(0, 3.2), blurRadius: 3.2),
                    ],
                  ),
                ),
              ),

              // 2. النغزة والدايرة (الأنيميشن السافل)
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOutCubic,
                bottom: 32.h,
                left: (itemWidth * currentIndex) + (itemWidth / 2) - (56.w / 2),
                child: Container(
                  width: 56.w,
                  height: 56.w,
                  decoration: const BoxDecoration(
                    color: AppColors.primary100,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Container(
                      width: 44.w,
                      height: 44.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFF5B6CD7), Color(0xFF141C52)],
                        ),
                      ),
                      child: Icon(_tabs[currentIndex]['icon'], color: const Color(0xFFEAEDFA), size: 22.w),
                    ),
                  ),
                ),
              ),

              // 3. الأماكن الحقيقية للضغط
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: 65.h,
                  child: Row(
                    children: List.generate(5, (index) {
                      bool isActive = currentIndex == index;
                      return Expanded(
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () => onTabSelected(index), // 💡 بننادي على الأب يغير الشاشة
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              AnimatedOpacity(
                                opacity: isActive ? 0.0 : 1.0,
                                duration: const Duration(milliseconds: 200),
                                child: Icon(_tabs[index]['icon'], color: const Color(0xFFEAEDFA), size: 24.w),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                _tabs[index]['label'],
                                style: AppStyles.pMedium16.copyWith(
                                  color: const Color(0xFFEAEDFA),
                                  fontSize: 13.sp,
                                  fontWeight: isActive ? FontWeight.w500 : FontWeight.w400,
                                  height: 1.0,
                                ),
                              ),
                              SizedBox(height: 12.h),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}