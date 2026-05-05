import 'package:engipedia/core/widgets/common_app_header.dart'; // الهيدر الموحد بتاعك
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
    _videoController = VideoPlayerController.asset('assets/videos/elmahaba.mp4');
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
    setState(() {});
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
      backgroundColor: const Color(0xFFD6DAF5),
      body: SafeArea(
        child: CustomScrollView( // استخدمنا CustomScrollView عشان الهيدر الموحد يشتغل صح
          physics: const BouncingScrollPhysics(),
          slivers: [
            // 1. الهيدر الموحد والثابت (Pinned)
            SliverPersistentHeader(
              pinned: true,
              delegate: CommonAppHeader(), // هنا استخدمنا الهيدر بتاعك
            ),

            // 2. محتوى الصفحة
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(height: 24.h),
                    _buildVideoPlayerCard(),
                    SizedBox(height: 24.h),
                    _buildActionButtons(),
                    SizedBox(height: 16.h),
                    _buildTestButton(),
                    SizedBox(height: 24.h),
                    _buildCourseCurriculum(),
                    SizedBox(height: 40.h),
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
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: _chewieController != null && _chewieController!.videoPlayerController.value.isInitialized
            ? Chewie(controller: _chewieController!)
            : const Center(child: CircularProgressIndicator(color: Colors.white)),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        _buildSmallButton("Download Lecture"),
        SizedBox(width: 16.w),
        _buildSmallButton("Download Section"),
      ],
    );
  }

  Widget _buildSmallButton(String text) {
    return Expanded(
      child: Container(
        height: 40.h,
        decoration: BoxDecoration(
          color: const Color(0xFF0A0E29),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: Text(text, style: AppStyles.smallRegular10.copyWith(color: Colors.white, fontSize: 12.sp)),
        ),
      ),
    );
  }

  Widget _buildTestButton() {
    return Container(
      width: double.infinity,
      height: 45.h,
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFF1E2A7B), Color(0xFF0A0E29)]),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Center(
        child: Text("Test Yourself", style: AppStyles.pMedium16.copyWith(color: Colors.white)),
      ),
    );
  }

  Widget _buildCourseCurriculum() {
    final List<Map<String, String>> lessons = [
      {"title": "Lec 1: Introduction to Databases", "time": "35 Min"},
      {"title": "Lec 2: Database Models Overview", "time": "42 Min"},
      {"title": "Lec 3: ER Diagrams and Design", "time": "34 Min"},
      {"title": "Lec 4: Relational Model Basics", "time": "50 Min"},
    ];

    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 15)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            height: 40.h,
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFF5B6CD7), Color(0xFF141C52)]),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              children: [
                Expanded(child: Text("Search", style: TextStyle(color: Colors.white70, fontSize: 14.sp))),
                const Icon(Icons.search, color: Colors.white70),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: lessons.length,
            separatorBuilder: (context, index) => SizedBox(height: 16.h),
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Icon(Icons.play_circle_fill, color: const Color(0xFF1349EC), size: 40.w),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(lessons[index]["title"]!, style: AppStyles.pMedium16, maxLines: 1, overflow: TextOverflow.ellipsis),
                        Text(lessons[index]["time"]!, style: AppStyles.captionRegularMontserrat),
                      ],
                    ),
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