import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

abstract class AppStyles {
  // القاعدة العامة: Montserrat هو الخط الأساسي، واللون الافتراضي هو الـ Dark Blue (primary900)
  
  static final TextStyle _baseMontserrat = TextStyle(
    fontFamily: 'Montserrat',
    color: AppColors.primary900, // اللون الافتراضي للنصوص
  );

  static TextStyle h1Bold39 = _baseMontserrat.copyWith(
    fontSize: 39.sp,
    fontWeight: FontWeight.w700,
  );

  static TextStyle h2Bold31 = _baseMontserrat.copyWith(
    fontSize: 31.sp,
    fontWeight: FontWeight.w700,
  );

  static TextStyle h3Bold25 = _baseMontserrat.copyWith(
    fontSize: 25.sp,
    fontWeight: FontWeight.w700,
  );

  static TextStyle h4Bold20 = _baseMontserrat.copyWith(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
  );

  static TextStyle pMedium16 = _baseMontserrat.copyWith(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    height: 1.5,
  );

  static TextStyle captionMediumItalic13 = _baseMontserrat.copyWith(
    fontSize: 13.sp,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
  );

  static TextStyle captionRegularItalic13 = _baseMontserrat.copyWith(
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
  );

  static TextStyle smallRegular10 = _baseMontserrat.copyWith(
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
  );

  // ستايلات مخصصة (Montserrat)
  static TextStyle titleBoldMontserrat = _baseMontserrat.copyWith(
    fontSize: 28.sp, 
    fontWeight: FontWeight.bold,
    height: 1.2, // أمان أكتر من 1.0 عشان الحروف متتقصش
  );

  static TextStyle captionRegularMontserrat = _baseMontserrat.copyWith(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    height: 1.2,
  );

  static TextStyle buttonMediumMontserrat = _baseMontserrat.copyWith(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    height: 1.5,
    letterSpacing: 0.5,
    color: AppColors.white, // ده الوحيد اللي ثبتناه أبيض عشان الزراير
  );
  static TextStyle font13MediumItalicCaption = _baseMontserrat.copyWith(
  fontSize: 13.sp,
  fontWeight: FontWeight.w500,
  fontStyle: FontStyle.italic,
  color: AppColors.primary800,
);
}