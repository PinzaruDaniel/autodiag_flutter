import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/app_colors.dart';

class IconContainerWidget extends StatelessWidget {
  final IconData iconData;
  const IconContainerWidget({super.key, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.w,
      width: 110.w,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [AppColors.primary, AppColors.secondary]),
        borderRadius: .circular(40.r),
        boxShadow: [BoxShadow(color: AppColors.primary.withAlpha(100), blurRadius: 6, spreadRadius: 6)],
      ),
      child: Icon(iconData, size: 55.w, color: AppColors.white),
    );
  }
}
