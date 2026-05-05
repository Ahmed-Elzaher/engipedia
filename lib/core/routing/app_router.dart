import 'package:engipedia/features/courses/ui/screens/course_details_screen.dart';
import 'package:engipedia/features/profile/ui/screens/profile_screen.dart';
import 'package:engipedia/features/sign_up/ui/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/start/ui/start_screen.dart';
import '../../features/onb/ui/onboarding_screen.dart';
import '../../features/sign_in/logic/sign_in_cubit.dart';
import '../../features/sign_in/ui/sign_in_screen.dart';
import 'routes.dart';
import '../../features/forgot_password/ui/forgot_password_screen.dart';
import '../../features/check_email/ui/check_email_screen.dart';
import '../../features/home/ui/screens/main_screen.dart';
import '../../features/hub/ui/hub_screen.dart';
// 💡 لازم تعمل Import للملف ده عشان نستخدم getIt
import '../../core/di/dependency_injection.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.start_screen:
        return MaterialPageRoute(builder: (_) => const StartScreen());

      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case Routes.signInScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            // ✅ التصليح هنا: بننادي على الكيوبيت من getIt عشان يبعت الـ Repo أوتوماتيك
            create: (context) => getIt<SignInCubit>(),
            child: const SignInScreen(),
          ),
        );

      case Routes.forgotPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());

      case Routes.checkEmailScreen:
        return MaterialPageRoute(builder: (_) => const CheckEmailScreen());

      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            // ✅ نفس الكلام هنا (مؤقتاً لحين عمل SignUpCubit)
            create: (context) => getIt<SignInCubit>(),
            child: const SignUpScreen(),
          ),
        );

      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const MainScreen());

      case Routes.hubScreen:
        return MaterialPageRoute(builder: (_) => const HubScreen());

      case '/profile':
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case Routes.courseDetailsScreen:
        // بنستقبل اسم الكورس اللي جاي من صفحة الكورسات
        final String courseTitle =
            settings.arguments as String? ?? "Course Details";
        return MaterialPageRoute(
          builder: (_) => CourseDetailsScreen(
              courseTitle: courseTitle), // هنعدل الشاشة عشان تستقبله
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
