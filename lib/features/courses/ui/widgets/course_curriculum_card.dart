import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseCurriculumCard extends StatelessWidget {
  const CourseCurriculumCard({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> lessons = [
      {"title": "Lec 1: Introduction to Databases", "time": "35 Min"},
      {"title": "Lec 2: Database Models Overview", "time": "42 Min"},
      {"title": "Lec 3: ER Diagrams and Design", "time": "34 Min"},
      {"title": "Lec 4: Relational Model Basics", "time": "50 Min"},
      {"title": "Lec 5: SQL Basics", "time": "48 Min"},
      {"title": "Lec 6: Advanced SQL Queries", "time": "56 Min"},
      {"title": "Lec 7: Database Normalization", "time": "52 Min"},
      {"title": "Lec 8: Indexing and Optimization", "time": "56 Min"},
      {"title": "Lec 9: Transactions & Concurrency", "time": "44 Min"},
      {"title": "Lec 10: Database Security & Backup", "time": "35 Min"},
    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFFAFAFA), Color(0xFFD6DAF5)],
        ),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: const Offset(0, 4),
              blurRadius: 15)
        ],
      ),
      child: Column(
        children: [
          _buildSearchBar(),
          SizedBox(height: 24.h),
          ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: lessons.length,
            separatorBuilder: (_, __) => SizedBox(height: 20.h),
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(lessons[index]["title"]!,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: const Color(0xFF0A0E29))),
                  SizedBox(height: 4.h),
                  Text(lessons[index]["time"]!,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12.sp,
                          color: const Color(0xFF0A0E29).withOpacity(0.7))),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 34.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            colors: [Color(0xFF5B6CD7), Color(0xFF141C52)]),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Search",
              style: TextStyle(
                  color: const Color(0xFFEAEDFA),
                  fontSize: 16.sp,
                  fontFamily: 'Montserrat')),
          Icon(Icons.search, color: const Color(0xFFEAEDFA), size: 18.w),
        ],
      ),
    );
  }
}
