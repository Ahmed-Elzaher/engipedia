import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_styles.dart';
import '../utils/app_colors.dart';

class AppTextFormField extends StatelessWidget {
  final String labelText;
  final Widget? labelRightWidget;
  final bool isObscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;

  const AppTextFormField({
    super.key,
    required this.labelText,
    this.labelRightWidget,
    this.isObscureText = false,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: validator,
      initialValue: controller?.text,
      builder: (FormFieldState<String> state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. السطر اللي فوق (اسم الحقل + أيقونة الإخفاء)
            if (labelText.isNotEmpty) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    labelText,
                    style: AppStyles.pMedium16.copyWith(
                      color: AppColors.primary700,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  ?labelRightWidget,
                ],
              ),
              SizedBox(height: 8.h),
            ],

            // 2. البوكس بتاع الإدخال
            Container(
              width: double.infinity,
              height: 36.h, 
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x40000000),
                    offset: Offset(0, 25),
                    blurRadius: 50,
                    spreadRadius: -12,
                  ),
                  BoxShadow(
                    color: Color(0x121F2687),
                    offset: Offset(0, 8),
                    blurRadius: 32,
                  ),
                  BoxShadow(
                    color: Color(0x40000000),
                    offset: Offset(0, 4),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: state.hasError
                            ? [Colors.red, Colors.red.shade900]
                            : [
                                AppColors.primary400,
                                AppColors.primary950,
                              ],
                      ),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.offWhite,
                            AppColors.primary100,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(11.r),
                      ),
                      alignment: Alignment.center, // 💡 يضمن توسط النص عمودياً
                      child: TextField(
                        controller: controller,
                        obscureText: isObscureText,
                        keyboardType: keyboardType,
                        style: AppStyles.pMedium16.copyWith(color: Colors.black),
                        textAlignVertical: TextAlignVertical.center, // 💡 توسيط النص داخلياً
                        onChanged: (value) {
                          state.didChange(value);
                        },
                        decoration: InputDecoration(
                          isDense: true, // 💡 يقلل المساحات الداخلية الافتراضية
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          // 💡 التعديل الجوهري هنا: شيلنا الـ vertical padding
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // 3. رسالة الخطأ
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: SizedBox(
                width: double.infinity,
                child: !state.hasError
                    ? const SizedBox.shrink()
                    : Padding(
                        padding: EdgeInsets.only(top: 6.h, left: 4.w),
                        child: Text(
                          state.errorText ?? '',
                          style: AppStyles.smallRegular10.copyWith(
                            color: AppColors.error, 
                            fontSize: 12.sp, 
                            fontWeight: FontWeight.w500
                           ),
                        ),
                      ),
              ),
            ),
          ],
        );
      },
    );
  }
}