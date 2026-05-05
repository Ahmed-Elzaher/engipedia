import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_styles.dart';

class LearningActivityCard extends StatelessWidget {
  const LearningActivityCard({super.key});

  @override
  Widget build(BuildContext context) {
    // 💡 نسب الارتفاعات بدل الأرقام الثابتة عشان تبقى مرنة (Max height = 116)
    final List<double> barHeightRatios = [
      49 / 116,
      79 / 116,
      104 / 116,
      37 / 116,
      67 / 116,
      116 / 116,
      24 / 116
    ];
    final List<String> days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

    return Container(
      width: double.infinity, // 💡 خليناها تأخذ عرض الشاشة بالكامل مع البادينج
      // 💡 شيلنا الارتفاع الثابت (274) وخلينا الكارت يتمدد براحته مع المحتوى
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: const [
          BoxShadow(
              color: Color(0x40000000), offset: Offset(0, 4), blurRadius: 4),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFFFFFFF), Color(0xFFADB5EB)],
              ),
            ),
            padding: const EdgeInsets.all(1),
            child: Container(
              padding: EdgeInsets.all(
                  16.w), // 💡 زودنا البادينج الداخلي شوية عشان يلم المحتوى
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.r),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white, Color(0xFFEAEDFA)],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize:
                    MainAxisSize.min, // 💡 يخلي الكارت يأخذ مساحة المحتوى بس
                children: [
                  // 1. العنوان
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: 24.h), // 💡 قللنا المسافة شوية
                    child: Text(
                      "Learning Activity",
                      style: AppStyles.h4Bold20.copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF0A0E29),
                      ),
                    ),
                  ),

                  // 2. منطقة الشارت
                  SizedBox(
                    height: 120.h, // 💡 ارتفاع ثابت ومعقول لمنطقة الشارت
                    child: LayoutBuilder(builder: (context, constraints) {
                      return Column(
                        children: [
                          // منطقة الأعمدة والخطوط
                          Expanded(
                            child: Stack(
                              children: [
                                // خطوط الشبكة
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: List.generate(
                                      4,
                                      (index) => Container(
                                            width: double.infinity,
                                            height: 1.h,
                                            color: const Color(0xFF0A0E29)
                                                .withOpacity(0.15),
                                          )),
                                ),
                                // الأعمدة
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween, // 💡 بتوزع المسافات بالتساوي
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: List.generate(7, (index) {
                                    // 💡 حساب عرض العمود بشكل مرن بناءً على مساحة الشاشة المتاحة
                                    double barWidth =
                                        (constraints.maxWidth - (6 * 8.w)) / 7;
                                    // منع العمود إنه يكون رفيع أو تخين بزيادة
                                    barWidth = barWidth.clamp(20.w, 35.w);

                                    return _buildBar(
                                      heightRatio: barHeightRatios[index],
                                      width: barWidth,
                                      maxHeight: constraints.maxHeight -
                                          20.h, // 💡 حجز مساحة لأسماء الأيام
                                    );
                                  }),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8.h),
                          // أيام الأسبوع
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: days.map((day) {
                              // 💡 نفس عرض العمود عشان يبقوا متسنترين صح
                              double barWidth =
                                  (constraints.maxWidth - (6 * 8.w)) / 7;
                              barWidth = barWidth.clamp(20.w, 35.w);
                              return SizedBox(
                                width: barWidth,
                                child: Center(
                                  child: Text(
                                    day,
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12
                                          .sp, // 💡 صغرنا الخط سيكا لمنع الـ Overflow
                                      fontStyle: FontStyle.italic,
                                      color: const Color(0xFF141C52),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      );
                    }),
                  ),

                  // 3. الفوتر: Time Spent
                  SizedBox(height: 24.h),
                  Container(
                    padding: EdgeInsets.only(top: 16.h),
                    decoration: BoxDecoration(
                      border: Border(
                          top:
                              BorderSide(color: Colors.white.withOpacity(0.4))),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 36.w, // 💡 قللناها سيكا
                              height: 36.w,
                              decoration: BoxDecoration(
                                color: const Color(0xFFADB5EB),
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Center(
                                child: Icon(Icons.access_time_rounded,
                                    color: const Color(0xFF2563EB), size: 20.w),
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Text(
                              "Time Spent",
                              style: AppStyles.pMedium16.copyWith(
                                color: const Color(0xFF0A0E29),
                                fontWeight: FontWeight.w600,
                                fontSize: 15.sp, // 💡 ظبطنا المقاس
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "14.5h",
                          style: AppStyles.pMedium16.copyWith(
                            color: const Color(0xFF0A0E29),
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // العمود بقى بيحسب ارتفاعه وعرضه ديناميكياً
  Widget _buildBar(
      {required double heightRatio,
      required double width,
      required double maxHeight}) {
    return Container(
      width: width,
      height: maxHeight * heightRatio, // 💡 بيأخذ نسبته من المساحة المتاحة
      decoration: BoxDecoration(
        color: const Color(0xFF2839A4),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
              12.r), // 💡 قللنا הـ Radius ليتناسب مع العرض المرن
          topRight: Radius.circular(12.r),
        ),
      ),
    );
  }
}
