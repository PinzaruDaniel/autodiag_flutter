import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/resources/text_styles.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

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
          Spacer(),
          Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: AppColors.onBackground,
              borderRadius: BorderRadius.circular(24.r),
              border: Border.all(color: AppColors.borderColor),
            ),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  // TODO: connect to audio recording flow.
                },
                child: Container(
                  height: 250.h,
                  width: 200.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(colors: [AppColors.primary, AppColors.secondary]),
                    boxShadow: [BoxShadow(color: AppColors.primary.withAlpha(100), blurRadius: 6, spreadRadius: 2)],
                  ),
                  child: Icon(Icons.mic, size: 80.w, color: AppColors.white),
                ),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
