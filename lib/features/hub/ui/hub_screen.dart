import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/app_styles.dart';
import '../../../core/widgets/common_app_header.dart';
import '../../../core/widgets/scale_clickable.dart';

// 💡 استدعاء الـ Widgets المنفصلة
import 'widgets/post_card_widget.dart';
import 'widgets/trending_card_widget.dart';
import 'widgets/study_groups_card_widget.dart';

class HubScreen extends StatelessWidget {
  const HubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xFFE5E9FF),
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // 1. الهيدر
            SliverPersistentHeader(
              pinned: true,
              delegate: CommonAppHeader(),
            ),

            // 2. الجزء العلوي (Recent Activity + Filters + Share Update)
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Recent Activity",
                        style: AppStyles.h3Bold25
                            .copyWith(color: const Color(0xFF141C52))),
                    SizedBox(height: 16.h),
                    _buildFilterButtons(),
                    SizedBox(height: 24.h),
                    _buildShareUpdateCard(),
                  ],
                ),
              ),
            ),

            // 3. لستة البوستات (بقت هي اللي فوق)
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                    padding: EdgeInsets.only(bottom: 24.h),
                    child: const PostCardWidget(),
                  ),
                  childCount: 4,
                ),
              ),
            ),

            // 4. 💡 قسم الـ Trending والـ Study Groups (نزل تحت البوستات)
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(height: 8.h),
                    const TrendingCardWidget(),
                    SizedBox(height: 24.h),
                    const StudyGroupsCardWidget(),
                  ],
                ),
              ),
            ),

            // 5. مسافة في آخر الصفحة عشان البار العائم
            SliverToBoxAdapter(child: SizedBox(height: 140.h)),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButtons() {
    return Row(
      children: [
        _buildFilterButton(
          title: "All",
          gradientColors: const [Color(0xFF1E2A7B), Color(0xFF0A0E29)],
        ),
        SizedBox(width: 20.w),
        _buildFilterButton(
          title: "My Dept",
          gradientColors: const [Color(0xFF5B6CD7), Color(0xFF141C52)],
        ),
      ],
    );
  }

  Widget _buildFilterButton(
      {required String title, required List<Color> gradientColors}) {
    return Expanded(
      child: ScaleClickable(
        onTap: () {},
        child: Container(
          height: 34.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: gradientColors,
            ),
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: const Offset(0, 4),
                blurRadius: 4,
              ),
            ],
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: const Color(0xFFEAEDFA),
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildShareUpdateCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFFAFAFA), Color(0xFFD6DAF5)],
        ),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(0, 4),
            blurRadius: 4,
          ),
          const BoxShadow(
            color: Color(0x111F2687),
            offset: Offset(0, 8),
            blurRadius: 32,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24.r,
                backgroundImage: const AssetImage('assets/images/pfp.png'),
                backgroundColor: Colors.grey.shade300,
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Container(
                  height: 38.h,
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFFFAFAFA), Color(0xFFD6DAF5)],
                    ),
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: Colors.white, width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Share an update",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontStyle: FontStyle.italic,
                        fontSize: 13.sp,
                        color: const Color(0xFF141C52),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Row(
            children: [
              _buildShareAction(Icons.image_outlined, "Image"),
              SizedBox(width: 16.w),
              _buildShareAction(Icons.attach_file_outlined, "File"),
              const Spacer(),
              ScaleClickable(
                onTap: () {},
                child: Container(
                  width: 100.w,
                  height: 36.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF5B6CD7), Color(0xFF141C52)],
                    ),
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        offset: const Offset(0, 4),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Text(
                    "Post",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: const Color(0xFFEAEDFA),
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildShareAction(IconData icon, String label) {
    return ScaleClickable(
      onTap: () {},
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF1349EC), size: 20.sp),
          SizedBox(width: 6.w),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              color: const Color(0xFF141C52),
            ),
          ),
        ],
      ),
    );
  }
}
