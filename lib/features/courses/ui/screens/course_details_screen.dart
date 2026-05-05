import 'package:engipedia/core/widgets/common_app_header.dart';
import 'package:engipedia/core/widgets/scale_clickable.dart';
import 'package:engipedia/features/home/ui/widgets/custom_bottom_nav.dart'
    show CustomBottomNav;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class CourseDetailsScreen extends StatefulWidget {
  final String courseTitle;

  const CourseDetailsScreen({super.key, required this.courseTitle});

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  late VideoPlayerController _videoController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    // 💡 تأكد إن المسار ده مطابق للي في الـ pubspec.yaml
    _videoController =
        VideoPlayerController.asset('assets/videos/videoplayback.mp4');

    try {
      await _videoController.initialize();
      _chewieController = ChewieController(
        videoPlayerController: _videoController,
        autoPlay: false,
        looping: false,
        aspectRatio: 16 / 9,
        materialProgressColors: ChewieProgressColors(
          playedColor: AppColors.primary900,
          handleColor: Colors.white,
          backgroundColor: Colors.white24,
          bufferedColor: Colors.white.withOpacity(0.2),
        ),
      );
    } catch (e) {
      debugPrint("Video Init Error: $e");
    }

    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _videoController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xFFD6DAF5),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: 1,
        onTabSelected: (index) {
          if (index != 1) Navigator.pop(context, index);
        },
      ),
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: CommonAppHeader(),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24.h),
                    Text(
                      widget.courseTitle,
                      style: AppStyles.h3Bold25.copyWith(
                        color: AppColors.primary900,
                        fontSize: 22.sp,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    SizedBox(height: 16.h),

                    _buildVideoPlayerCard(),
                    SizedBox(height: 24.h),

                    // 💡 تم ضبط الـ Row هنا لضمان عدم ترحيل الزراير
                    _buildActionButtons(),

                    SizedBox(height: 12.h),

                    _buildCustomButton(
                      text: "Test Yourself",
                      isFullWidth: true,
                      onTap: () {},
                    ),

                    SizedBox(height: 32.h),

                    // 💡 كارت الـ 10 دروس كاملة
                    _buildCourseCurriculum(),

                    SizedBox(height: 140.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoPlayerCard() {
    return Container(
      width: double.infinity,
      height: 210.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Colors.black,
        boxShadow: [
          BoxShadow(
              color: Colors.black26, blurRadius: 10, offset: const Offset(0, 4))
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: _chewieController != null &&
                _chewieController!.videoPlayerController.value.isInitialized
            ? Chewie(controller: _chewieController!)
            : const Center(
                child: CircularProgressIndicator(color: Colors.white)),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // لضمان التوسط
      children: [
        _buildCustomButton(text: "Download Lecture", onTap: () {}),
        SizedBox(width: 8.w),
        _buildCustomButton(text: "Download Section", onTap: () {}),
      ],
    );
  }

  Widget _buildCustomButton(
      {required String text,
      bool isFullWidth = false,
      required VoidCallback onTap}) {
    Widget buttonContent = Container(
      height: 34.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF1E2A7B), Color(0xFF0A0E29)],
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.r),
          bottomRight: Radius.circular(12.r),
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: const Offset(0, 4),
              blurRadius: 10),
        ],
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 13.sp,
          fontWeight: FontWeight.w400,
          color: const Color(0xFFEAEDFA),
        ),
      ),
    );

    Widget finalButton = ScaleClickable(onTap: onTap, child: buttonContent);

    return isFullWidth ? finalButton : Expanded(child: finalButton);
  }

  Widget _buildCourseCurriculum() {
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
              blurRadius: 15),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 34.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF5B6CD7), Color(0xFF141C52)],
              ),
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
          ),
          SizedBox(height: 24.h),
          ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: lessons.length,
            separatorBuilder: (context, index) => SizedBox(height: 20.h),
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lessons[index]["title"]!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: const Color(0xFF0A0E29)),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    lessons[index]["time"]!,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 12.sp,
                        color: const Color(0xFF0A0E29).withOpacity(0.7)),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
