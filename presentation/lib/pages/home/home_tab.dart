import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:presentation/controllers/home_controller.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/resources/text_styles.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with SingleTickerProviderStateMixin {
  late final HomeController _controller;
  late final AnimationController _pulseController;
  late final Animation<double> _pulseAnimation;
  late final Animation<double> _pulseBorderScale;
  late final Animation<double> _pulseBorderOpacity;
  Worker? _recordingWorker;

  @override
  void initState() {
    super.initState();
    _controller = Get.put(HomeController());
    _pulseController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1400));
    _pulseAnimation = Tween<double>(
      begin: 1.0,
      end: 1.05,
    ).animate(CurvedAnimation(parent: _pulseController, curve: Curves.easeInOutSine));
    _pulseBorderScale = Tween<double>(
      begin: 1.0,
      end: 1.24,
    ).animate(CurvedAnimation(parent: _pulseController, curve: Curves.easeOut));
    _pulseBorderOpacity = Tween<double>(
      begin: 0.45,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _pulseController, curve: Curves.easeOut));
    _recordingWorker = ever<bool>(_controller.isRecording, (isRecording) {
      if (isRecording) {
        _pulseController.repeat(reverse: true);
      } else {
        _pulseController.stop();
        _pulseController.value = 0.0;
      }
    });
  }

  @override
  void dispose() {
    _recordingWorker?.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  double _barHeight(double base, double variance, double phase) {
    final t = _pulseController.value * 2 * math.pi;
    return base + variance * (1 + math.sin(t + phase)) / 2;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .symmetric(vertical: 16.h, horizontal: 24.w),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text('Hi!', style: TextStyles.whiteBold(fontSize: 24.sp)),
          8.verticalSpace,
          Text('How is your car today?', style: TextStyles.baseTextStyle),
          const Spacer(),
          Container(
            padding: .all(60.w),
            decoration: BoxDecoration(
              color: AppColors.onBackground,
              borderRadius: .circular(24.r),
              border: .all(color: AppColors.borderColor),
            ),
            child: Center(
              child: GestureDetector(
                onTap: () => _controller.toggleRecording(context: context),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedBuilder(
                      animation: _pulseController,
                      builder: (context, _) {
                        return Opacity(
                          opacity: _controller.isRecording.value ? _pulseBorderOpacity.value : 0.0,
                          child: Transform.scale(
                            scale: _pulseBorderScale.value,
                            child: Container(
                              height: 140.w,
                              width: 140.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: AppColors.recordingStart, width: 2),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    ScaleTransition(
                      scale: _pulseAnimation,
                      child: Obx(() {
                        final isRecording = _controller.isRecording.value;
                        final gradientColors = isRecording
                            ? const [AppColors.recordingStart, AppColors.recordingEnd]
                            : const [AppColors.primary, AppColors.secondary];
                        return Container(
                          height: 140.w,
                          width: 140.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(colors: gradientColors),
                            boxShadow: [
                              BoxShadow(
                                color: (isRecording ? AppColors.recordingStart : AppColors.primary).withAlpha(100),
                                blurRadius: 6,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Center(
                            child: isRecording
                                ? AnimatedBuilder(
                                    animation: _pulseController,
                                    builder: (context, _) {
                                      return SizedBox(
                                        height: 30.w,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            _buildBar(_barHeight(18.w, 8.w, 0.0)),
                                            _buildBar(_barHeight(22.w, 10.w, 1.1)),
                                            _buildBar(_barHeight(16.w, 7.w, 2.2)),
                                            _buildBar(_barHeight(20.w, 9.w, 3.3)),
                                          ],
                                        ),
                                      );
                                    },
                                  )
                                : Icon(Icons.mic, size: 60.w, color: AppColors.white),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildBar(double height) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: SizedBox(
        height: 60.w,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 8.w,
            height: height,
            decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(6.r)),
          ),
        ),
      ),
    );
  }
}
