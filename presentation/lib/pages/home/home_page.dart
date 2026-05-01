import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/utils/widgets/base/base_page.dart';

import 'history_tab.dart';
import 'home_tab.dart';
import 'profile_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      pendingIds: [''],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.background,
        title: const Text('AutoDiag AI'),
        foregroundColor: AppColors.white,
        centerTitle: true,
      ),
      builder: (context) {
        return Scaffold(
          backgroundColor: AppColors.background,
          body: TabBarView(controller: _tabController, children: const [HomeTab(), HistoryTab(), ProfileTab()]),
          bottomNavigationBar: Container(
            margin: .fromLTRB(16, 0, 16, 12),
            decoration: BoxDecoration(
              color: AppColors.onBackground,
              borderRadius: .circular(24.r),
              boxShadow: [BoxShadow(blurRadius: 20, color: AppColors.primary.withAlpha(40))],
            ),
            child: SafeArea(
              top: false,
              child: ClipRRect(
                borderRadius: .circular(24.r),
                child: Padding(
                  padding: .symmetric(horizontal: 12.w, vertical: 8.h),
                  child: GNav(
                    gap: 8,
                    activeColor: AppColors.primary,
                    color: AppColors.hintColor,
                    iconSize: 24.w,
                    padding: .symmetric(horizontal: 20.w, vertical: 12.h),
                    duration: const Duration(milliseconds: 400),
                    tabBackgroundColor: AppColors.background,
                    tabs: const [
                      GButton(icon: Icons.home, text: 'Home'),
                      GButton(icon: Icons.history, text: 'History'),
                      GButton(icon: Icons.person, text: 'Profile'),
                    ],
                    selectedIndex: _selectedIndex,
                    onTabChange: (index) {
                      setState(() {
                        _selectedIndex = index;
                        _tabController.animateTo(index);
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
