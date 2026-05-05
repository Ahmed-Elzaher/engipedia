import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:async';
import '../../../core/routing/routes.dart';
import '../../../core/utils/app_assets.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  void initState() {
    super.initState();
    // التايمر سليم وزي الفل
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, Routes.onboardingScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. صورة الخلفية
          Image.asset(
            AppAssets.splashBg,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          // 2. اللوجو في النص
          Center(
            child: SvgPicture.asset(
              AppAssets.appLogo,
              width: 200.w,
            ),
          ),
        ],
      ),
    );
  }
}
