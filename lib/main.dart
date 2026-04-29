import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/utils/app_colors.dart';

void main() async {
  // لضمان استقرار كل الـ Plugins قبل تشغيل الأبلكيشن
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(const EngipediaApp());
}

class EngipediaApp extends StatelessWidget {
  const EngipediaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // ده مقاس الفيجما الحقيقي اللي بنينا عليه عشان المسافات متضربش
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true, // السطر ده بيعالج تهنيجة الشاشة السودا
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Engipedia',
          // تفعيل الـ Theme عشان تريح نفسك في الألوان
          theme: ThemeData(
            primaryColor: AppColors.primary700,
            scaffoldBackgroundColor: Colors.white, // أو AppColors.primary100 حسب تصميمك
          ),
          initialRoute: Routes.start_screen,
          onGenerateRoute: AppRouter().generateRoute,
        );
      },
    );
  }
}