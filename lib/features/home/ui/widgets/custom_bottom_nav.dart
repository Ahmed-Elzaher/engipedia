import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabSelected;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
  });

 final List<Map<String, dynamic>> _tabs = const [
    {'icon': Icons.home_rounded, 'label': 'Home'},         // 0
    {'icon': Icons.play_lesson_rounded, 'label': 'Courses'}, // 1
    {'icon': Icons.auto_awesome_rounded, 'label': 'AI'},      // 2
    {'icon': Icons.groups_rounded, 'label': 'Hub'},          // 3
    {'icon': Icons.bar_chart_rounded, 'label': 'Progress'},   // 4
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95.h,
      margin: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 15.h,
      ), // تقليل المارجن قليلاً لشكل ألطف
      child: LayoutBuilder(
        builder: (context, constraints) {
          double itemWidth = constraints.maxWidth / 5;

          return Stack(
            clipBehavior: Clip.none,
            children: [
              // 1. جسم البار الأساسي
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
                    borderRadius: BorderRadius.circular(
                      25.r,
                    ), // تدوير أكبر للزوايا
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: const Offset(0, 10),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                ),
              ),

              // 2. الدايرة الطائرة (الأنيميشن المطور)
              AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOutBack, // 💡 المسمى الصحيح هو easeOutBack
                bottom: 35.h,
                left: (itemWidth * currentIndex) + (itemWidth / 2) - (28.w),
                child: Container(
                  width: 56.w,
                  height: 56.w,
                  decoration: BoxDecoration(
                    color: AppColors.primary100,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF5B6CD7).withOpacity(0.4),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Container(
                      width: 46.w,
                      height: 46.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [Color(0xFF5B6CD7), Color(0xFF141C52)],
                        ),
                      ),
                      child: Icon(
                        _tabs[currentIndex]['icon'],
                        color: Colors.white,
                        size: 24.w,
                      ),
                    ),
                  ),
                ),
              ),

              // 3. أيقونات ونصوص البار
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
                          onTap: () => onTabSelected(index),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // الأيقونة بتتحرك لفوق وتختفي لما تكون نشطة
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                transform: Matrix4.translationValues(
                                  0,
                                  isActive ? -40 : 0,
                                  0,
                                ),
                                child: AnimatedOpacity(
                                  opacity: isActive ? 0.0 : 0.7,
                                  duration: const Duration(milliseconds: 200),
                                  child: Icon(
                                    _tabs[index]['icon'],
                                    color: Colors.white,
                                    size: 22.w,
                                  ),
                                ),
                              ),
                              SizedBox(height: 2.h),
                              // النص بيصغر أو يتغير لونه بشكل ناعم
                              AnimatedDefaultTextStyle(
                                duration: const Duration(milliseconds: 300),
                                style: AppStyles.pMedium16.copyWith(
                                  color: isActive
                                      ? Colors.white
                                      : Colors.white.withOpacity(0.5),
                                  fontSize: isActive ? 12.sp : 11.sp,
                                  fontWeight: isActive
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                                child: Text(_tabs[index]['label']),
                              ),
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
