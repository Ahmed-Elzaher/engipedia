import 'package:engipedia/features/hub/ui/hub_screen.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import '../../../../features/courses/ui/screens/courses_screen.dart';
// TODO: مسار شاشة الـ AI (مؤقتاً هنحط مكانها Container عشان ما تضربش)
import '../../../../features/progress/ui/screens/progress_screen.dart';
import '../widgets/custom_bottom_nav.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // 💡 الترتيب ده مطابق للـ BottomNav: 0=Home, 1=Courses, 2=AI, 3=Hub, 4=Progress
// الترتيب هنا هو اللي بيتحكم إيه يفتح لما تدوس
  final List<Widget> _pages = [
    const HomeScreen(),      // الاندكس 0 -> هيفتح Home
    const CoursesScreen(),   // الاندكس 1 -> هيفتح Courses
    
    // الاندكس 2 (زرار AI اللي في النص) -> حطيت لك صفحة فاضية مؤقتاً عشان متفتحش Hub
    Container(color: const Color(0xFFE5E9FF), child: const Center(child: Text("AI Screen", style: TextStyle(fontSize: 24)))), 
    
    const HubScreen(),       // الاندكس 3 -> هيفتح Hub
    const ProgressScreen(),  // الاندكس 4 -> هيفتح Progress
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // 💡 بتخلي المحتوى ينزل ورا البار في كل التطبيق
      backgroundColor: const Color(0xFFE5E9FF), // نفس لون خلفية الـ Home
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _selectedIndex,
        onTabSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}