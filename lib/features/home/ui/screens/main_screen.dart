import 'package:engipedia/features/progress/ui/screens/progress_screen.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';
// 💡 استيراد الشاشات من الفيتشرز بتاعتها
import '../../../courses/ui/screens/courses_screen.dart'; 
import '../widgets/custom_bottom_nav.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // 💡 الشاشات مرتبة حسب ترتيب أيقونات الـ Bottom Nav
  final List<Widget> _screens = [
    const HomeScreen(),      // Index 0: Home
    const CoursesScreen(),   // Index 1: Courses
    const Center(child: Text("AI Screen - Coming Soon")), // Index 2: AI
    const Center(child: Text("Hub Screen - Coming Soon")), // Index 3: Hub
    const ProgressScreen(),  // Index 4: Progress (ركبت اهي يا وحش)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody ضروري عشان الـ Bottom Nav العائم يندمج مع خلفية الشاشات
      extendBody: true, 
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _currentIndex,
        onTabSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}